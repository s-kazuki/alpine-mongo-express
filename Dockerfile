FROM node:12.16-alpine

LABEL maintainer="S-Kazuki<contact@revoneo.com>"

ENV APP_ROOT=/node

WORKDIR $APP_ROOT

COPY package.json ${APP_ROOT}/
COPY yarn.lock ${APP_ROOT}/

RUN yarn install \
\
&& apk update \
&& apk add tzdata \
&& TZ=${TZ:-Asia/Tokyo} \
&& cp /usr/share/zoneinfo/$TZ /etc/localtime \
&& echo $TZ> /etc/timezone \
&& apk del tzdata \
&& rm -rf /var/cache/apk/*

CMD ["yarn", "start"]