import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<sql.Database> dataBase() async {
    final dbPath = sql.getDatabasesPath().toString();
    final sqlDB = await sql.openDatabase(
      path.join(dbPath, 'user_places.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE user_places (id TEXT PRIMARY KEY, title TEXT, image TEXT)');
      },
      version: 1,
    );
    return sqlDB;
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.dataBase();
    await db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, Object?>>> fetchData(String table) async {
    final db = await DBHelper.dataBase();
    final data = await db.query(table);
    return data;
  }
}
