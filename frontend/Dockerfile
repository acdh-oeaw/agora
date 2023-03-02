FROM node:8

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install git -y

RUN git clone --branch master --single-branch https://github.com/grnet/agora-sp.git /home/agora-sp && \
    mkdir -p /srv/agora && \  
    cp -r /home/agora-sp/ui /srv/agora/ && \
    rm -fr /home/agora-sp

WORKDIR /srv/agora/ui

RUN yarn install --non-interactive && ./node_modules/.bin/ember build
CMD ["./node_modules/.bin/ember" "build" "--watch"] 
