import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as pt;

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

  initDB() async {
    return await openDatabase(
        pt.join(await getDatabasesPath(), 'userSession.db'),
        version: 1, onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          '''
          CREATE TABLE users (userId TEXT PRIMARY KEY, token TEXT,expiryDate TEXT)
          ''');
    });
  }

  newUserSession(String userId,String token,String expiryDate) async {
    final db = await database;
    var res = await db.rawInsert(''' 
    INSERT INTO users(
    userId,token,expiryDate
    ) VALUES (?,?)
    ''',[userId,token,expiryDate]);
    return res;
  }
}
