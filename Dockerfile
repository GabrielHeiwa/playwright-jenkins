FROM node:23.1.0-alpine

WORKDIR /usr/app/node

COPY package*.json .

RUN npm install

RUN npx playwright test

CMD [ "node", "." ]