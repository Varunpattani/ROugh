const http = require("http");

function homw() {
  const server = http.createServer((req, res) => {
    res.end("HI");
  });
  server.listen(3000, () => {
    console.log("Server is on");
  });
}
function abt() {
  const forabout = http.createServer((req, res) => {
    res.end("WELCOME TO ABOUT");
  });
  forabout.listen(4000, () => {
    console.log("Server is on");
  });
}
function com() {
  const forcon = http.createServer((req, res) => {
    res.end("WELCOME TO CONTACT");
  });
  forcon.listen(5000, () => {
    console.log("Server is on");
  });
}
homw();
abt();
com();
