import 'dart:io';

import 'package:flutter/material.dart';
import 'package:interactive/core/storageService/folder.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper  {
  String? dbBaseURL;
  setBaseURL(dbURL){
    dbBaseURL = dbURL;

  }
  static DatabaseHelper? _databaseHelper; // Singleton DatabaseHelper
  static Database? _database;
  Folder folder = Folder(); // Singleton Data// base

  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper


  factory DatabaseHelper() {
    _databaseHelper ??= DatabaseHelper._createInstance();
    return _databaseHelper!;
  }

  Future<Database> get database async {
    String savePath = await folder.createDBDirectory();
    if (await File(savePath).exists()) {
      _database = await openDatabase(savePath, version: 1,onUpgrade: _upgradeDB,onDowngrade: onDatabaseDowngradeDelete);
      return _database!;
    } else {
      _database = await initializeDatabase();
      return _database!;
    }
  }

  Future<Database> initializeDatabase() async {
    String path = await folder.createDBDirectory();
    var restaurantDatabase = await openDatabase(
        path, version: 1,onCreate: _createDb);
    return restaurantDatabase;
  }


  void _createDb(Database db, int newVersion) async {

    await db.execute('CREATE TABLE IF NOT EXISTS UserDB( primeKey INTEGER PRIMARY KEY, uid TEXT, firstName TEXT, secondName TEXT, mobileNumber TEXT , email TEXT, signIn TEXT)');
    await db.execute('CREATE TABLE IF NOT EXISTS ModuleStatusDB( primeKey INTEGER PRIMARY KEY, courseKey TEXT, courseModuleName TEXT, courseModuleKey TEXT, courseModuleDuration TEXT , courseModuleWatchTime TEXT, courseModuleWatchStatus TEXT)');
    await db.execute('CREATE TABLE IF NOT EXISTS BookMarkDB( primeKey INTEGER PRIMARY KEY, courseKey TEXT, courseModuleName TEXT, courseModuleKey TEXT, courseModuleDuration TEXT , courseModuleBookMarkTime TEXT)');
  }

  Future<void> removeDatabase() async {
    String path = await folder.createDBDirectory();
    debugPrint(path);
    deleteDatabase(path);
  }

  // UPGRADE DATABASE TABLES
  void _upgradeDB(Database db, int oldVersion, int newVersion) async {
    if(oldVersion == 1) {
      debugPrint("In DB upgrade");
    }
  }

}