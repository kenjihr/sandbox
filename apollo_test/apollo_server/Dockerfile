FROM node:19

RUN mkdir /home/server
RUN mkdir /home/server/src
WORKDIR /home/server
RUN npm init --yes

RUN npm install @apollo/server graphql
RUN npm install @apollo/server-plugin-landing-page-graphql-playground
RUN npm install --save-dev typescript @types/node

COPY ./package.json /home/server/
COPY ./tsconfig.json /home/server/
COPY ./index.ts /home/server/src/

CMD ["npm", "start"]
