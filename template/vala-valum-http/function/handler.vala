using Valum;
using VSGI;

public class App : Router {
  construct {
    get("/", handler);
    post("/", handler);

  }

  public bool handler (Request req, Response res, NextCallback next, Context ctx) {
    return res.expand_utf8(req.flatten_utf8());
  }
}
