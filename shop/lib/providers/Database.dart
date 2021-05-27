import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    print("Created 1");
    try {
      var databasesPath = await getDatabasesPath();
      await deleteDatabase(databasesPath);
      String path = join(databasesPath, 'usersession.db');
      return await openDatabase(path, version: 2,
          onCreate: (Database db, int version) async {
        await db.execute("""
          CREATE TABLE IF NOT EXISTS User ( 
          userId TEXT PRIMARY KEY,
          token TEXT,
          expiryDate TEXT
          );
          """);
      });
    } catch (error) {
      print(error);
    }
  }

  newUserSession(String userId, String token, String expiryDate) async {
    print("New User Session");
    try {
      final db = await database;
      var delete = await db.rawInsert( '''DELETE FROM User''');
      print("Deleted");
      var res = await db.rawInsert(''' 
    INSERT INTO User (
    userId,token,expiryDate
    ) VALUES (?,?,?)
    ''', [userId, token, expiryDate]);
      return res;
    } catch (error) {
      print(error);
    }
  }

  Future<dynamic> get getUserSession async {
    final db = await database;
    var res = await db.query("User");
    if (res.length == 0) {
      return null;
    } else {
      var resMap = res[0];
      return resMap.isNotEmpty ? resMap : null;
    }
  }
}
