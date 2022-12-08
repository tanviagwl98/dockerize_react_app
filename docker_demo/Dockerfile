FROM ubuntu:latest

RUN apt-get update && apt-get install -y nodejs npm

#&& apt-get install -y npm

WORKDIR /usr/src/app/

COPY package.json /usr/src/app/

RUN npm install

COPY . /usr/src/app/

EXPOSE 3000

CMD ["npm", "start"]
