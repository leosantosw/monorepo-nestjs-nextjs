# Dependencies
FROM node:18.16.1-slim AS install

WORKDIR /usr/src/app

COPY package.json package-lock.json ./
RUN npm ci

COPY turbo.json .

COPY apps/api/package.json ./apps/api/
COPY apps/client/package.json ./apps/client/
# COPY apps/api/package-lock.json ./apps/api/
# COPY apps/client/package-lock.json ./apps/client/

RUN npm install --prefix apps/api
RUN npm install --prefix apps/client

# Build
FROM install AS build

COPY apps/api ./apps/api
COPY apps/client ./apps/client

RUN npm run build --prefix apps/api
RUN npm run build --prefix apps/client

# Start
FROM node:18.16.1-alpine

WORKDIR /usr/src/app

COPY --from=build /usr/src/app .

CMD [ "npm", "start" ]
