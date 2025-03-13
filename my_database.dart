import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDatabase{
 Future<Database> initDatabase() async {
   Directory directory = await getApplicationDocumentsDirectory();
   String path = join(directory.path,'cureOption.db');
   var db = await openDatabase(path,onCreate: (db, version) async{
     await db.execute('''
     create table Todo(
     todo_id INTEGER PRIMARY KEY AUTOINCREMENT,
     todo_name TEXT NOT NULL
     )
     ''');
   },onUpgrade: (db, oldVersion, newVersion) {

   },version: 1);
   return db;
 }
 Future<List<Map<String,dynamic>>> selectAllData() async{
   Database db = await initDatabase();
   return await db.rawQuery("select * from Todo");
 }
 Future<void> insertData(Map<String,dynamic> data) async{
   Database db = await initDatabase();
   int id = await db.insert("Todo", data);
 }
 Future<void> updateData(Map<String,dynamic> data) async{
   Database db = await initDatabase();
   int id = await db.update("Todo", data,where: "todo_id = ?",whereArgs: [data["todo_id"]] );
 }
 Future<void> deleteData(int todo_id) async{
   Database db = await initDatabase();
   int id = await db.delete("Todo",where:"todo_id = ?",whereArgs: [todo_id]);
 }
}