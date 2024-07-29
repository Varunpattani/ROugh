const express = require("express");
const app = express();

app.get("/", (req, res) => {
  res.send("Hello world from express");
});

app.get("/about", (req, res) => {
  res.send("Hello world from about");
});

app.get("/contact", (req, res) => {
  res.send("Hello world from contact");
});

app.get("/home", (req, res) => {
  res.send("Hello world from home");
});

app.get("/address", (req, res) => {
  res.send("Hello world from address");
});

app.get("/sign", (req, res) => {
  res.send("Hello world from sign in");
});

app.listen(3000, () => {
  console.log("server started");
});
