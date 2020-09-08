FROM swift:latest

WORKDIR /swift/src/handler

RUN \
    apt-get update && \
    apt-get install -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app
WORKDIR /app
COPY . .
RUN swiftc function/handler.swift main.swift -o handler

RUN curl -sSL https://github.com/openfaas/faas/releases/download/0.8.0/fwatchdog > ./fwatchdog
RUN chmod +x ./fwatchdog

ENV fprocess="./handler"

HEALTHCHECK --interval=2s CMD [ -e /tmp/.lock ] || exit 1

CMD ["./fwatchdog"]
