# Stage 1: Build the application
FROM node:18 AS build

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install

COPY . .
RUN npm run build

# Stage 2: Serve the application
FROM node:18-alpine

WORKDIR /app

COPY --from=build ./dist ./dist
COPY package.json package-lock.json ./
RUN npm install --production

CMD ["npm", "start"]
