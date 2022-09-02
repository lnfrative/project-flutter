import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:path/path.dart';
import 'package:stative_app/models/index.dart';

class Database {
  late final sqflite.Database connector;

  Future<sqflite.Database> connect() async {
    String path = await sqflite.getDatabasesPath();
    final database = sqflite.openDatabase(
      join(path, 'stative.db'),
      version: 1,
      onCreate: (database, version) => {
        database.execute(
          '''CREATE TABLE IF NOT EXISTS ${UserModel.table} (
            id INTEGER PRIMARY KEY,
            email TEXT UNIQUE NOT NULL,
            name TEXT,
            session INTEGER NOT NULL,
            height INTEGER,
            weight INTEGER
          )'''
        )
      }
    );

    connector = await database;
    return connector;
  }
}