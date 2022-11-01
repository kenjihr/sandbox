FROM node:19

WORKDIR /home
RUN npx create-react-app my-app
WORKDIR /home/my-app

RUN npm install @apollo/client graphql

#COPY ./index.js /home/my-app/

CMD [ "npm", "start" ]
