import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqliteapp/src/models/contact_model.dart';
export 'package:sqliteapp/src/models/contact_model.dart';

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

    final path = join(documentsDerectory.path, 'contactsDB.db');

    return openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Contacts('
          ' id INTEGER PRIMARY KEY,'
          ' name TEXT,'
          ' lastName TEXT,'
          ' phone TEXT'
          ' )');
    });
  }

  insertContact(ContactModel contact) async {
    final db = await database;
    final res = await db.insert('Contacts', contact.toJson());
    return res;
  }

  Future<List<ContactModel>> getContacts() async {
    final db = await database;
    final contacts = await db.query('Contacts');

    List<ContactModel> list = contacts.isNotEmpty
        ? contacts.map((contact) => ContactModel.fromJson(contact)).toList()
        : [];

    return list;
  }

  Future<int> updateContact(ContactModel contact) async {
    final db = await database;

    final resp = await db.update('Contacts', contact.toJson(),
        where: 'id = ?', whereArgs: [contact.id]);

    return resp;
  }

  Future<int> deleteContact(int id) async {
    final db = await database;
    final resp = await db.delete('Contacts', where: 'id = ?', whereArgs: [id]);
    return resp;
  }

}
