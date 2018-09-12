FROM alpine:3.8

RUN apk update && apk add lua5.3 curl

RUN mkdir -p /app
WORKDIR /app
COPY . .

RUN curl -sSL https://github.com/openfaas/faas/releases/download/0.9.2/fwatchdog > ./fwatchdog
RUN chmod +x ./fwatchdog

ENV fprocess="lua5.3 main.lua"

HEALTHCHECK --interval=2s CMD [ -e /tmp/.lock ] || exit 1

CMD ["./fwatchdog"]
