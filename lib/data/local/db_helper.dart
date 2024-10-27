import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  static const String locationHistoryDB = "location_history.db";

  static const String locationSearchHistoryTable = "location_search_history";

  static const String columnId = "id";
  static const String columnLocation = "location";
  static const String columnLatitude = "latitude";
  static const String columnLongitude = "longitude";
  static const String columnTimestamp = "timestamp";

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), locationHistoryDB);
    return await openDatabase(
      path,
      version: 1,
    );
  }

  Future<void> createLocationSearchHistoryTable() async {
    final db = await database;
    await db.execute('''
      CREATE TABLE IF NOT EXISTS $locationSearchHistoryTable (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnLocation TEXT NOT NULL,
        $columnLatitude REAL NOT NULL,
        $columnLongitude REAL NOT NULL,
        $columnTimestamp DATETIME DEFAULT CURRENT_TIMESTAMP
      )
    ''');
  }

  Future<void> insertOrUpdateLocation(
      String location, double latitude, double longitude) async {
    final db = await DatabaseHelper().database;

    // Check if record exists
    final existing = await db.query(
      locationSearchHistoryTable,
      where: '$columnLatitude = ? AND $columnLongitude = ?',
      whereArgs: [latitude, longitude],
    );

    if (existing.isNotEmpty) {
      // Update existing record
      await db.update(
        locationSearchHistoryTable,
        {
          columnLocation: location,
          columnTimestamp: DateTime.now().toString(),
        },
        where: '$columnLatitude = ? AND $columnLongitude = ?',
        whereArgs: [latitude, longitude],
      );
    } else {
      // Insert new record
      await db.insert(locationSearchHistoryTable, {
        columnLocation: location,
        columnLatitude: latitude,
        columnLongitude: longitude,
        columnTimestamp: DateTime.now().toString(),
      });
    }
  }

  Future<List<Map<String, dynamic>>> fetchLocationHistory() async {
    final db = await DatabaseHelper().database;
    return await db.query(
      locationSearchHistoryTable,
      orderBy: '$columnTimestamp DESC',
    );
  }

  Future<void> deleteLocation(double latitude, double longitude) async {
    final db = await DatabaseHelper().database;

    await db.delete(
      locationSearchHistoryTable,
      where: '$columnLatitude = ? AND $columnLongitude = ?',
      whereArgs: [latitude, longitude],
    );
  }
}

// import 'dart:io';

// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';

// class DBHelper {
//   DBHelper._();

//   static final DBHelper getInstance = DBHelper._();

//   static const String locationSearchHistoryTable = "location_search_history";
//   static const String columnSNo = "s_no";
//   static const String columnLocation = "location";
//   static const String columnLatitude = "latitude";
//   static const String columnLongitude = "longitude";
//   static const String columnTimestamp = "timestamp";

//   Database? myDB;

//   Future<Database> getDB() async {
//     myDB ??= await openDB();
//     return myDB!;
//   }

//   Future<Database> openDB() async {
//     Directory appDir = await getApplicationDocumentsDirectory();
//     String dbPath = join(appDir.path, "locationDB.db");
//     return await openDatabase(
//       dbPath,
//       onCreate: (db, version) {
//         db.execute(
//             "create table $locationSearchHistoryTable ($columnSNo integer primary key autoincrement, $columnLocation text, $columnLatitude text primary key, $columnLongitude text primary key)");
//       },
//       version: 1,
//     );
//   }

//   Future<bool> addLocation({required location}) async {
//     var db = await getDB();
//     int noOfRowsAffected = await db.insert(locationSearchHistoryTable, {
//       columnLocation: location,
//     });
//     return noOfRowsAffected > 0;
//   }

//   Future<List<Map<String, dynamic>>> fetchAllLocations() async {
//     var db = await getDB();
//     List<Map<String, dynamic>> mData =
//         await db.query(locationSearchHistoryTable);
//     return mData;
//   }
// }
