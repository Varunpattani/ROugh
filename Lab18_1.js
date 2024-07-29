const http = require("http");

const server = http.createServer((req, res) => {
  res.end("Hello world from http");
});
let port = 3000;
server.listen(port, () => {
  console.log(`Server at ${port}`);
});
