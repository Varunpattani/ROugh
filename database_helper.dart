import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('users.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        fullName TEXT NOT NULL,
        email TEXT UNIQUE NOT NULL,
        mo TEXT NOT NULL,
        dob TEXT NOT NULL,
        city TEXT NOT NULL,
        gender TEXT NOT NULL,
        isFav INTEGER NOT NULL,
        hobb TEXT,
        pass TEXT NOT NULL,
        conf TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertUser(Map<String, dynamic> user) async {
    final db = await instance.database;
    return await db.insert('users', user);
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await instance.database;
    return await db.query('users');
  }

  Future<int> updateUser(int id, Map<String, dynamic> user) async {
    final db = await instance.database;
    return await db.update('users', user, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteUser(int id) async {
    final db = await instance.database;
    return await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }
}
