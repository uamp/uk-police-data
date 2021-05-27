# base image
FROM node:14.17.0-buster

# set working directory
WORKDIR /app

RUN npm install @vue/cli -g

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /app/package.json
RUN npm install

# start app
CMD ["npm", "run", "serve"]