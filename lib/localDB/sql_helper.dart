import 'package:sqflite/sqflite.dart' as sql;
class SQLHelper {
  static Future<void> createTables(sql.Database db) async {
    await db.execute(
        '''CREATE TABLE user(
          email TEXT,
          token TEXT,
          refresh TEXT
          )''');

    // in settings add data through the sql_helper file insert method
    await db.execute(
        '''CREATE TABLE settings(
          id INTEGER PRIMARY KEY, 
          settingName TEXT, 
          status BOOLEAN
          )''');

    await db.execute(
        '''CREATE TABLE splashscreens(
          status BOOLEAN default false
          )''');

    await db.execute(
      '''CREATE TABLE localNotification(
        id INTEGER PRIMARY KEY, 
        title TEXT, desctription, 
        description TEXT,
        path TEXT default null,
        sendTime DATETIME,
        status BOOLEAN default false
        )''');

    await db.execute(
      '''CREATE TABLE apikey(
        id INTEGER PRIMARY KEY, 
        key TEXT, 
        value TEXT
        )''');
  }   
  static Future<sql.Database> db() async {
    return sql.openDatabase('mindcare.db', version: 1, onCreate: (db, version) async {
      await createTables(db);
    });
  } 

  static Future<void> insertNotification(String title, String description, DateTime sendTime) async {
    final db = await SQLHelper.db();
    await db.insert('localNotification', {
      'title': title,
      'description': description,
      'sendTime': sendTime.toIso8601String(),
    });
  }

  static Future<void> updateNotification(int id) async {
    final db = await SQLHelper.db();
    await db.update('localNotification', {
      'status': true,
    }, where: 'id = ?', whereArgs: [id]);
  }

  static Future<void> deleteNotification(int id) async {
    final db = await SQLHelper.db();
    await db.delete('localNotification', where: 'id = ?', whereArgs: [id]);
  }

  static Future<List<Map<String, dynamic>>> getNotifications() async {
    final db = await SQLHelper.db();
    return db.query('localNotification');
  }

  static Future<void> insertSetting(String settingName, bool status) async {
    final db = await SQLHelper.db();
    await db.insert('settings', {
      'settingName': settingName,
      'status': status,
    });
  }

  static Future<void> updateSetting(int id, bool status) async {
    final db = await SQLHelper.db();
    await db.update('settings', {
      'status': status,
    }, where: 'id = ?', whereArgs: [id]);
  }

  static Future<void> deleteSetting(int id) async {
    final db = await SQLHelper.db();
    await db.delete('settings', where: 'id = ?', whereArgs: [id]);
  }

  static Future<List<Map<String, dynamic>>> getSettings() async {
    final db = await SQLHelper.db();
    return db.query('settings');
  }

  static Future<void> insertSplashScreen(bool status) async {
    final db = await SQLHelper.db();
    await db.insert('splashscreens', {
      'status': status,
    },conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<void> updateSplashScreen(bool status) async {
    final db = await SQLHelper.db();
    await db.update('splashscreens', {
      'status': status,
    });
  }

  // static Future<void> deleteSplashScreen() async {
  //   final db = await SQLHelper.db();
  //   await db.delete('splashscreens');
  // }

  // static Future<List<Map<String, dynamic>>> getSplashScreen() async {
  //   final db = await SQLHelper.db();
  //   return db.query('splashscreens');
  // }

  static Future<void> insertUser(String email, String token) async {
    final db = await SQLHelper.db();
    await db.insert('user', {
      'email': email,
      'token': token,
    });
  }

  static Future<void> updateUser(String email, String token) async {
    final db = await SQLHelper.db();
    await db.update('user', {
      'token': token,
    }, where: 'email = ?', whereArgs: [email]);
  }

  static Future<void> deleteUser(String email) async {
    final db = await SQLHelper.db();
    await db.delete('user', where: 'email = ?', whereArgs: [email]);
  }

  static Future<List<Map<String, dynamic>>> getUser() async {
    final db = await SQLHelper.db();
    return db.query('user');
  }

  static Future<void> insertApiKey(String key, String value) async {
    final db = await SQLHelper.db();
    await db.insert('apikey', {
      'key': key,
      'value': value,
    });
  }

  static Future<void> updateApiKey(String key, String value) async {
    final db = await SQLHelper.db();
    await db.update('apikey', {
      'value': value,
    }, where: 'key = ?', whereArgs: [key]);
  }

  static Future<void> deleteApiKey(String key) async {
    final db = await SQLHelper.db();
    await db.delete('apikey', where: 'key = ?', whereArgs: [key]);
  }

  // static Future<void> deleteAll() async {
  //   final db = await SQLHelper.db();
  //   await db.delete('user');
  //   await db.delete('settings');
  //   await db.delete('splashscreens');
  //   await db.delete('localNotification');
  // }
}