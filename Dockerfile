FROM node:10.17.0-alpine

WORKDIR /src
RUN chown -R node:node /src

RUN apk add --no-cache git

USER node

RUN git init
RUN git remote add origin https://github.com/zooniverse/Panoptes-Front-End.git
RUN git fetch origin abab2b0115231dc34fd824f70f46a0c372b3043e --depth=1
RUN git reset --hard FETCH_HEAD

RUN npm install --unsafe-perm
COPY --chown=node:node src/ .

COPY bin/build-pfe.sh /usr/local/bin 

VOLUME ["/src/dist"]
ENTRYPOINT build-pfe.sh
