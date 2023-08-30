# base
FROM node:18 AS base

WORKDIR /usr/src/app

COPY package*.json ./
    
RUN npm install

COPY . .

# for lint

FROM base as linter

WORKDIR /usr/src/app

RUN npm run lint

# for build

FROM linter as builder

WORKDIR /usr/src/app

RUN npm run build


# for production

FROM node:18-alpine

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install --only=production

COPY --from=builder /usr/src/app/build ./build

EXPOSE 3000

ENTRYPOINT ["node","./app.js"]
