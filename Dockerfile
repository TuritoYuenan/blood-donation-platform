FROM node:alpine

WORKDIR /app

COPY package.json .

RUN npm i

COPY public src index.html vite.config.ts \
	tsconfig.app.json tsconfig.json tsconfig.node.json /

RUN npm run build

EXPOSE 4173

CMD [ "npm", "run", "preview", "--host" ]
