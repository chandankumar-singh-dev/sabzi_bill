import 'package:path/path.dart';
import 'package:sabzi_bill/config/databases/databases_helper.dart';
import 'package:sabzi_bill/utils/log/dev_logger.dart';
import 'package:sqflite/sqflite.dart';

class DatabasesHelperIml extends DatabasesHelper {
  @override
  Future<Database> get database async {
    final dbPath =
        await getDatabasesPath(); // its give path where the database file store

    devLog(dbPath, "DATABASE FILE LOCATION");
    final path = join(
      dbPath,
      "sabzi_bill.db",
    ); // here we join the database file path with database.
    devLog(path, "DATABASE FILE LOCATION WITH DATABASE NAME");
    final db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db
            .execute('''
          CREATE TABLE customers (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            phone TEXT,
            address TEXT,
            created_at TEXT NOT NULL,
            updated_at TEXT NOT NULL
          )
        ''')
            .whenComplete(() => devLog("database created"));
      },
    );
    return db;
  }

  @override
  Future<int> insertDataIntoDB({
    required String table,
    required Map<String, dynamic> data,
  }) async {
    Database db = await database;
    data["created_at"] = DateTime.now().toIso8601String();
    data["updated_at"] = DateTime.now().toIso8601String();
    return await db.insert(table, data);
  }

  @override
  Future<List<Map<String, Object?>>> getAllData({required String table}) async {
    Database db = await database;

    return db.query(table, orderBy: 'name ASC');
  }

  @override
  Future<int> updateById({
    required String table,
    required Map<String, dynamic> data,
  }) async {
    Database db = await database;

    return db.update(table, data, where: "id = ?", whereArgs: [data["id"]]);
  }

  @override
  Future<int> deleteById({required String table, required int id}) async {
    Database db = await database;

    return db.delete(table, where: "id = ?", whereArgs: [id]);
  }

  @override
  Future<Map<String, Object?>?> getDataById({
    required String table,
    required int id,
  }) async {
    Database db = await database;
    List<Map<String, Object?>> result = await db.query(
      table,
      where: "id = ?",
      whereArgs: [id],
    );
    if (result.isEmpty) {
      return null;
    }

    return result.first;
  }
}
