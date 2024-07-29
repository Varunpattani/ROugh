const express = require("express");
const fs = require("fs");
const app = express();
fs.readFile('about.txt', (err,data) => {
    
})

app.get("/", (req, res) => {
  fs.readFile("about.txt", (err, data) => {
    if (err) throw err;
    res.write(data);
    return res.send();
  });
  fs.readFile("contact.txt", (err, data) => {
    if (err) throw err;
    res.write(data);
    return res.send();
  });
});

// app.get("/contact", (req, res) => {
//   fs.readFile("contact.txt", (err, data) => {
//     if (err) throw err;
//     res.write(data);
//     return res.send();
//   });
// });

app.listen(3000, () => {
  console.log("server started");
});
