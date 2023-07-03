import 'package:medreminder/Reminder/models/remind.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper{
  static Database? _db;
  static final int _version = 1;
  static final String _tableName = "Reminder";

  static Future<void> initDb()async{
    if (_db != null){
      return;
    }

    try {
      String _path = await getDatabasesPath() + 'reminder.db';
      _db = await openDatabase(
        _path,
        version: _version,
        onCreate: (db, version){
          print("Creating a new one");
          return db.execute(
            "CREATE TABLE $_tableName("
                "id INTEGER PRIMARY KEY AUTOINCREMENT, "
                "title STRING, dose TEXT, date STRING, "
                "startTime STRING, endTime STRING, "
                "repeat STRING, "
                "color INTEGER, "
                "isCompleted INTEGER)",
          );
        },
      );
    } catch (e){
      print(e);
    }
  }

  static Future <int> insert(Remind? remind) async{
    print("insert function called");
    return await _db?.insert(_tableName, remind!.toJson())??1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    print("query function called");
    return await _db!.query(_tableName);
  }

  static delete(Remind remind) async {
    return await _db!.delete(_tableName, where: 'id=?', whereArgs: [remind.id]);
  }

  static update(int id) async{
    return await _db!.rawUpdate('''
      UPDATE reminder
      SET isCompleted = ?
      WHERE id = ?
    ''', [1, id]);
  }

}