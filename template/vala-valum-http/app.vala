using Valum;
using VSGI;

var app = new Router ();

app.rule (Method.ANY, "/*", new App ().handle);

Server.new ("http", handler: app).run ({"app", "--address=0.0.0.0:3003"});
