using Valum;
using VSGI;

public class App {
  public string handle(Request req, Response res) {
    return req.flatten_utf8();
  }
}
