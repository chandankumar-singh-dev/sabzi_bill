import 'package:sqflite/sqflite.dart';

abstract class DatabasesHelper {
  Future<Database> get database;
  Future<int> insertDataIntoDB({
    required String table,
    required Map<String, dynamic> data,
  });
  Future<List<Map<String, Object?>>> getAllData({required String table});
  Future<Map<String, Object?>?> getDataById({
    required String table,
    required int id,
  });
  Future<int> updateById({
    required String table,
    required Map<String, dynamic> data,
  });

  Future<int> deleteById({
    required String table,
    required int id
  });
}
