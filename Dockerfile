FROM node:12.16-alpine

LABEL maintainer="S-Kazuki<contact@revoneo.com>"

ENV APP_ROOT=/node

WORKDIR $APP_ROOT

COPY package.json ${APP_ROOT}/
COPY yarn.lock ${APP_ROOT}/

RUN apk update \
&& apk add git tzdata \
&& TZ=${TZ:-Asia/Tokyo} \
&& cp /usr/share/zoneinfo/$TZ /etc/localtime \
&& echo $TZ> /etc/timezone \
&& apk del tzdata \
&& rm -rf /var/cache/apk/* \
\
&& yarn install

CMD ["yarn", "start"]