FROM node:14-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

ENV \
  HOST=0.0.0.0 \
  NODE_ENV=production \
  PORT=8080

CMD [ "npm", "run", "start" ]
