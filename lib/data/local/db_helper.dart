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
