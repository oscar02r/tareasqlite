import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database _database;

  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDerectory = await getApplicationDocumentsDirectory();

    final path = join(documentsDerectory.path, 'contactDB.db');

    return openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute(
        'CREATE TABLE Contacts('
         'id INTEGER PRIMARY KEY,'
         'name TEXT,'
         'lastName TEXT,'
         'pnone TEXT'
         ')'
      );
    });
  }
}
