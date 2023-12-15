import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseLinguas {
  static final DatabaseLinguas _instance = DatabaseLinguas.internal();
  factory DatabaseLinguas() => _instance;

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  DatabaseLinguas.internal();

  Future<Database> initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'login.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
      'CREATE TABLE users (id INTEGER PRIMARY KEY, email TEXT, password TEXT)',
    );
  }

  Future<int> saveUser(String email, String password) async {
    var client = await db;
    return client.insert(
      'users',
      {'email': email, 'password': password},
    );
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    var client = await db;
    return client.query('users');
  }
}
