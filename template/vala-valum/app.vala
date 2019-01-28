using Valum;
using VSGI;

var app = new Router ();
var handler = new App ();

app.get ("/", (req, res) => {
    res.headers.set_content_type ("text/plain", null);
    return res.expand_utf8(handler.handle(req, res));
});

app.post ("/", (req, res) => {
    res.headers.set_content_type ("text/plain", null);
    return res.expand_utf8(handler.handle(req, res));
});

Server.new ("http", handler: app).run ({"app", "--address=0.0.0.0:8080"});
