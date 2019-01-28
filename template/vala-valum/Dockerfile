FROM valum/valum:0.3

RUN meson install
WORKDIR /app
ADD . .

RUN valac --pkg=valum-0.3 function/*.vala app.vala -o app

HEALTHCHECK --interval=5s CMD [ -e /tmp/.lock ] || exit 1

USER app
CMD ["/app/app"]
