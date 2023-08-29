
FROM node:16-alpine

ENV NODE_ENV='development'

WORKDIR /opt


COPY ["package*.json", "./"]


RUN npm install 


COPY . .


CMD npm  start
# FROM node:18

# RUN apt-get update && apt-get install -y apt-transport-https ca-certificates curl software-properties-common 
# RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
# RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
# RUN apt-get update
# RUN apt-get install -y docker.io
# RUN apt-get install -y docker-compose

# CMD ["node", "-v"]
