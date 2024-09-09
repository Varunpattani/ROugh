const express = require("express");
const app = express();

const bodyParser = require("body-parser");

app.use(express.json());

app.use(bodyParser.urlencoded({ extended: false }));

const a = [
  {
    id: "1",
    product_name: "Headphone",
    price: "1500",
    company: "samsung",
  },
  {
    id: "2",
    product_name: "watch",
    price: "15000",
    company: "samsung",
  },
  {
    id: "3",
    product_name: "Headphone",
    price: "2500",
    company: "bot",
  },
  {
    id: "4",
    product_name: "pendrive",
    price: "1000",
    company: "sendisk",
  },
];

app.get("/home", (req, res) => {
  res.json(a);
});

app.get("/home/:id", (req, res) => {
  res.send(
    a.find((e) => {
      if (e.id == req.params.id) {
        return e;
      } else {
        res.status(404).send("not found");
      }
    })
  );
});

app.post("/home", (req, res) => {
  a.push(req.body);
  res.send(a);
});

app.put("/home/:id", (req, res) => {
  const IdToEdit = a.findIndex((e) => e.id == req.params.id);
  a[IdToEdit] = req.body;
  res.send(a);
});

app.patch("/home/:id", (req, res) => {
  const IdToEdit = a.findIndex((e) => e.id == req.params.id);
  a[IdToEdit] = { ...a[IdToEdit], ...req.body };
  res.send(a);
});

app.delete("/home/:id", (req, res) => {
  const IdToDelete = a.findIndex((e) => e.id == req.params.id);
  a[IdToDelete] = req.body;
  a.splice(IdToDelete, 1);
  res.send(a);
});

app.listen(3000, (req, res) => {
  console.log("server started");
});