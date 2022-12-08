FROM ubuntu:20.04
#FROM python_docker
ENV TZ=Asia/Calcutta
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y curl

RUN curl -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh

RUN bash /tmp/nodesource_setup.sh

RUN apt-get install -y nodejs
RUN node -v
RUN npm -v

WORKDIR /usr/src/app/

COPY package.json /usr/src/app/

RUN npm install

COPY . /usr/src/app/

EXPOSE 3000

CMD ["npm", "start"]
