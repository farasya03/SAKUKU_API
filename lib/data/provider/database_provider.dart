import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static final DatabaseProvider dbProvider = DatabaseProvider();

  Database? database;

  Future<Database> get db async {
    if (database != null) {
      return database!;
    } else {
      database = await createDatabase();
      return database!;
    }
  }

  Future<Database> createDatabase() async {
    Directory docDirectory = await getApplicationDocumentsDirectory();

    String path = join(docDirectory.path, "sakuku.db");

    var database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE transfer ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "title TEXT,"
          "desc TEXT,"
          "total_money INTEGER,"
          "date_time INTEGER"
          ")");
    }, onUpgrade: (Database db, int oldVersion, int newVersion) {
      if (newVersion > oldVersion) {
        // todo
      }
    });

    return database;
  }
}
