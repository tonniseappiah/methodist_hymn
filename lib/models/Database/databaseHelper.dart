import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'models.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper; // Singleton databaseHelper
  static Database _database; // Singleton database

  // Named constructor to create instance of the DatabaseHelper
  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance(); // this is executed only once , singleton object
    }

    return _databaseHelper;
  }

  // Tables
  String languageIndexTable = 'language_index';
  String hymnsTable = 'hymns';
  String hymnsItemsTable = 'hymns_items';
  String authorsTable = 'authors';
  String colID = 'id';
  String colIndex = 'index';

  // Getting the database
  Future<Database> get database async {
    if (_database == null) {
      // Checking if the database is empty
      _database = await initializeDatabase(); // if database is empty call the database initialization function initializeDatabase()
    }

    return _database;
  }

  // Function for initializing the database if the database is empty and providing the directory for the database
  Future<Database> initializeDatabase() async {
    // Get the directory path for both android and ios to store database
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'realityhymn.db'); // database directory declaration

    var selectedDatabase =
        await openDatabase(path, version: 1, onCreate: _createDB);

    return selectedDatabase;
  }

  // Creating database table
  void _createDB(Database db, int newVersion) async {
    await db.execute('CREATE TABLE $languageIndexTable($colID INTEGER PRIMARY KEY AUTOINCREMENT, $colIndex INTEGER)');
    await db.execute('CREATE TABLE $hymnsTable( hymnsID INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, author TEXT)');
    await db.execute('CREATE TABLE $hymnsItemsTable( itemID INTEGER PRIMARY KEY AUTOINCREMENT, hymnsID INTEGER, items TEXT)');
    await db.execute('CREATE TABLE $authorsTable(authorID INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, description TEXT)');
    insertLanguageIndex(db);
  }

  // Fetch operation in the database
  Future getLanguageIndex() async {
    Database db = await this.database;
    int id = 1;

    var languageIndex = db.rawQuery('SELECT index FROM $languageIndexTable WHERE id = $id');

    return languageIndex;
  }

  // Insertion operation
  void insertLanguageIndex(Database db) async {
    String query = 'INSERT INTO $languageIndexTable (index) VALUES (0)';
    await db.transaction((transaction) async {
      return await transaction.rawInsert(query);
    });
  }

  //Update operation
  void updateLanguageIndex(LangIndexDB language) async {
    Database db = await this.database;
    int id = 1;

    String query = 'UPDATE $languageIndexTable SET index = ${language.index} WHERE id = $id';
    await db.transaction((transaction) async {
      return await transaction.rawUpdate(query);
    });
  }

  Future<List<Map<String, dynamic>>> getHymnMapList() async {
    Database db = await this.database;

    //		var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    var result = await db.query(hymnsTable,);
    return result;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'Note List' [ List<Note> ]
  Future<List<HymnsDB>> getHymnList() async {

    var hymnMapList = await getHymnMapList(); // Get 'Map List' from database
    int count = hymnMapList.length;         // Count the number of map entries in db table

    List<HymnsDB> hymnList = List<HymnsDB>();
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      hymnList.add(HymnsDB.fromMapObject(hymnMapList[i]));
    }

    return hymnList;
  }
}
