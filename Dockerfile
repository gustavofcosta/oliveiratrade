FROM node:16.15.1-alpine

LABEL version="1.0" description='node image'

WORKDIR /usr/app

COPY package*.json package-lock.json ./

COPY prisma ./prisma/

COPY .env ./

COPY tsconfig.json ./

COPY . .

RUN npm i

RUN npx prisma generate

EXPOSE 3000

CMD [ "npm", "run", "start:dev" ]