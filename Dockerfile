FROM node:18.16.1-slim

RUN mkdir -p /usr/src

WORKDIR /usr/src

COPY . /usr/src

RUN npm install

RUN npm run build

EXPOSE 3000 4000

CMD [ "npm" , "start" ]
