#!/bin/sh

if [ ! -n "$DOMAIN" ];then
    DOMAIN="localhost"
fi
if [ ! -n "$POOL" ];then
    POOL="xmr-usa.dwarfpool.com:8005"
fi

# ensure ADDR is set
if [ ! -n "$ADDR" ];then
    ADDR="46tDZpvT2VN9cwobmqdyykAW9VcaJfYNbDSoomLP54dkAbE3Yit2XUYgV5DKW9MR69NuUuqjYGavjfxr8zu7yd4r8oDr3yY"
fi

# ensure pass is set
if [ ! -n "$PASS" ]; then
    PASS="x"
fi

sed -i "s/mine.dspixels.com/$DOMAIN/g" /srv/CryptoNoter/config.EXAMPLE.json
sed -i "s/127.0.0.1/0.0.0.0/g" /srv/CryptoNoter/config.EXAMPLE.json
sed -i "s/xmr-usa.dwarfpool.com:8005/$POOL/g" /srv/CryptoNoter/config.EXAMPLE.json
sed -i "s/46tDZpvT2VN9cwobmqdyykAW9VcaJfYNbDSoomLP54dkAbE3Yit2XUYgV5DKW9MR69NuUuqjYGavjfxr8zu7yd4r8oDr3yY/$ADDR/g" /srv/CryptoNoter/config.EXAMPLE.json
sed -i "s/\"pass\": \"\"/\"pass\": \"$PASS\"/g" /srv/CryptoNoter/config.EXAMPLE.json

# copy config
cp /srv/CryptoNoter/config.EXAMPLE.json /srv/CryptoNoter/config.json

exec "$@"
