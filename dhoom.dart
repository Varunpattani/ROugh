import 'package:demo/db%20crud/db_demo.dart';
import 'package:flutter/material.dart';

class Dhoom extends StatefulWidget {
  const Dhoom({super.key});

  @override
  State<Dhoom> createState() => _DhoomState();
}
Db_Demo db = Db_Demo();

class _DhoomState extends State<Dhoom> {
  TextEditingController nam = TextEditingController();
  TextEditingController cit = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crud bytch",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.purple,
      ),
      body: FutureBuilder(future: db.getAllUser(), builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        else if(snapshot.hasData){
          List data = snapshot.data!;
          print("Data from getAllUser(): $data"); // <--- ADDED PRINT STATEMENT HERE
          return ListView.builder(itemCount:data.length,
            itemBuilder: (context, index) {
              final item = data[index]; // Get item for null safety
              final name = item?["name"]?.toString() ?? "No Name Available"; // Null-safe access & default
              final city = item?["city"]?.toString() ?? "No City Available"; // Null-safe access & default
              final itemId = item?["id"]; // Null-safe access to ID

              return ListTile(
                title: Text(name), // Using null-safe name
                subtitle: Text(city), // Using null-safe city
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed:() async {
                      if (itemId != null) { // Null check before delete
                        await db.deleteData(itemId);
                        setState(() {});
                      } else {
                        print("Warning: Item ID is null, cannot delete.");
                      }
                    } , icon: Icon(Icons.delete)),
                    IconButton(onPressed: () {
                      showDialog(context: context, builder: (context) {
                        return AlertDialog(
                          title: Text("Edit:"),
                          content: Column(
                            children: [
                              TextFormField(
                                controller: nam,
                                decoration: InputDecoration(label: Text("Enter name:")),
                              ),
                              TextFormField(
                                controller: cit,
                                decoration: InputDecoration(label: Text("Enter city:")),
                              )
                            ],
                          ),
                          actions: [
                            ElevatedButton(onPressed: () async {
                              await db.updateData({"id": itemId, "name":nam.text,"city":cit.text}); // Included itemId in update
                              Navigator.pop(context);
                              setState(() {});
                            }, child: Text("Submit"))
                          ],
                        );
                      },);
                    }, icon: Icon(Icons.edit))
                  ],
                ),
              );
            },);
        }
        else{
          return Text("Error");
        }
      },),
      floatingActionButton: FloatingActionButton(onPressed: () async{
        showDialog(context: context, builder: (context) {
          return AlertDialog(
            title: Text("Add:"),
            content: Column(children: [
              TextFormField(controller: nam,decoration: InputDecoration(label: Text("Enter Name:")),),
              TextFormField(controller: cit,decoration: InputDecoration(label: Text("Enter City:")),)
            ],),
            actions: [
              ElevatedButton(onPressed: () async {
                await db.insertData({"name":nam.text,"city":cit.text});
                Navigator.pop(context);
                setState(() {

                });
              }, child: Text("Submit"))
            ],
          );
        },);
      },child: Icon(Icons.add),),
    );
  }
}