FROM valum/valum:0.3

RUN meson install
WORKDIR /app
ADD . .

RUN valac --pkg=valum-0.3 --pkg=gio-2.0 function/*.vala app.vala -o app

RUN useradd app
RUN chown app:app -R /app

WORKDIR /app

RUN apt-get update && \
    apt-get -y install wget && \
    wget https://github.com/openfaas-incubator/of-watchdog/releases/download/0.4.6/of-watchdog -O fwatchdog \
    && chmod +x fwatchdog \
    && apt-get remove wget -y

USER app


ENV fprocess="./app"
ENV mode="http"
ENV upstream_url="http://127.0.0.1:3003"

CMD ["./fwatchdog"]
