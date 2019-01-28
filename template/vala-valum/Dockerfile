FROM valum/valum:0.3

RUN meson install
WORKDIR /app
ADD . .

RUN touch /tmp/.lock
RUN valac --pkg=valum-0.3 --pkg=gio-2.0 function/*.vala app.vala -o app

RUN adduser app
RUN chown app:app -R /app

HEALTHCHECK --interval=5s CMD [ -e /tmp/.lock ] || exit 1

USER app
CMD ["/app/app"]
