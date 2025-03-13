import 'package:demo/db%20crud/my_database.dart';
import 'package:flutter/material.dart';

class TodoCrud extends StatefulWidget {
  const TodoCrud({super.key});

  @override
  State<TodoCrud> createState() => _TodoCrudState();
}

class _TodoCrudState extends State<TodoCrud> {
  MyDatabase db = MyDatabase();
  bool isAscending = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isAscending = !isAscending;
              });
            },
            icon: Icon(Icons.sort),
          )
        ],
      ),
      body: FutureBuilder(
        future: db.selectAllData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            List data = snapshot.data!;
            data.sort((a, b) => isAscending
                ? a["todo_name"].compareTo(b["todo_name"])
                : b["todo_name"].compareTo(a["todo_name"]));

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index]["todo_name"]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () async {
                          await db.deleteData(data[index]["todo_id"]);
                          setState(() {});
                        },
                        icon: Icon(Icons.delete, color: Colors.red),
                      ),
                      IconButton(
                        onPressed: () {
                          showEditDialog(data[index]);
                        },
                        icon: Icon(Icons.edit),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(child: Text("No data available."));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }


  void showAddDialog() {
    TextEditingController input = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add Task"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: input, decoration: InputDecoration(labelText: "Task Name")),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () async {
                await db.insertData({"todo_name": input.text});
                Navigator.of(context).pop();
                setState(() {});
              },
              child: Text("Submit"),
            )
          ],
        );
      },
    );
  }

  void showEditDialog(Map task) {
    TextEditingController nameController = TextEditingController(text: task["todo_name"]);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Task"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: nameController, decoration: InputDecoration(labelText: "Task Name")),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () async {
                await db.updateData({
                  "todo_id": task["todo_id"],
                  "todo_name": nameController.text,
                });
                Navigator.of(context).pop();
                setState(() {});
              },
              child: Text("Save"),
            )
          ],
        );
      },
    );
  }
}