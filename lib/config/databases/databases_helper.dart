import 'package:sqflite/sqflite.dart';

abstract class DatabasesHelper {
  Future<Database> createOrGetDatabase(String databaseName);
}
