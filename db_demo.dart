import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Db_Demo{
  Future<Database> initDatabase() async{
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path,'cureOption.db');
    var db = await openDatabase(path,onCreate: (db, version) async{
      await db.execute('''
      CREATE TABLE Demo(
        id integer primary key autoincrement,
        name text not null,
        city text not null
      )
      ''');
    },
    version: 1);
    return db;

  }

  Future<List<Map<String,dynamic>>> getAllUser() async{
    Database db = await initDatabase();
    return await db.rawQuery("select * from Demo");
  }

  Future<void> insertData(Map<String,dynamic> data) async{
    Database db = await initDatabase();
    int id = await db.insert("Demo", data);
  }

  Future<void> updateData(Map<String,dynamic> data) async{
    Database db = await initDatabase();
    int id = await db.update("Demo",data, where: "id = ?",whereArgs: [data["id"]]);
  }

  Future<void> deleteData(int data_id) async {
    Database db = await initDatabase();
    int id = await db.delete("Demo",where: "id = ?",whereArgs: [data_id]);
  }
}