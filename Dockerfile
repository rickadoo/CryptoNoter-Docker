FROM mkenney/npm

RUN set -x \
    && apk update \
    && apk add \
        git 

# git pull CryptoNoter source code
RUN cd /srv \
    && git clone https://github.com/rickadoo/CryptoNoter-Docker -o CryptoNoter

WORKDIR /srv/CryptoNoter

RUN npm install

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["npm", "start"]
