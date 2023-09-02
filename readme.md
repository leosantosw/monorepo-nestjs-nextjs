## Project Overview
This README provides an overview of the project structure and setup for the project. This project is organized into several directories and contains both a client-side and server-side application. It also includes infrastructure provisioning using Terraform and Docker for containerization.

## Directory Structure
```
├── Dockerfile
├── apps
│   ├── api
│   │   ├── nest-cli.json
│   │   ├── package.json
│   │   ├── src
│   │   │   ├── app.controller.ts
│   │   │   ├── app.module.ts
│   │   │   ├── app.service.ts
│   │   │   └── main.ts
│   │   ├── tsconfig.build.json
│   │   └── tsconfig.json
│   └── client
│       ├── next.config.js
│       ├── package.json
│       └── pages
│           ├── _app.js
│           └── index.js
├── infra
│   └── provisioning
│       ├── modules
│       │   ├── erc.tf
│       │   ├── provider.tf
│       │   └── variables.tf
│       ├── production
│       │   └── main.tf
│       ├── readme.md
│       ├── scripts
│       │   └── deploy_ecr.sh
│       └── staging
├── package-lock.json
├── package.json
└── turbo.json
```

## Getting Started

1. Install Dependencies: In the root directory, run the following command to install project dependencies:
```shell
  npm install
```
2. Build the Application: Run the following command to build the application:
```shell
  npm run build
```
3. Start the Application: To start the application, use the following command:
```shell
  npm start
```

## Additional Notes
- The project uses Turbo for development, building, and starting. Refer to the scripts in the project's package.json for these commands.

- Ensure that you have the necessary environment variables and AWS credentials set up if you are working with AWS services.
