import 'package:path/path.dart';
import 'package:sabzi_bill/config/databases/databases_helper.dart';
import 'package:sabzi_bill/utils/log/dev_logger.dart';
import 'package:sqflite/sqflite.dart';

class DatabasesHelperIml extends DatabasesHelper{
  
  @override
  Future<Database> createOrGetDatabase(String databaseName) async {
    final dbPath =
        await getDatabasesPath(); // its give path where the database file store

    devLog(dbPath, "DATABASE FILE LOCATION");
    final path = join(
      dbPath,
      databaseName
    ); // here we join the database file path with database.
    devLog(path, "DATABASE FILE LOCATION WITH DATABASE NAME");
    final db = await openDatabase(path, version: 1);
    return db;
  }
}