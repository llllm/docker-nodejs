FROM alpine:3.8
ENV NODE_ENV development
WORKDIR /usr/src/app
COPY ["package.json", "yarn.lock", "./"]
RUN apk --no-cache add g++ gcc libgcc libstdc++ linux-headers make python nodejs npm
RUN npm i -g yarn
RUN yarn global add node-gyp
RUN yarn install  
COPY . .
EXPOSE 80
CMD npm start