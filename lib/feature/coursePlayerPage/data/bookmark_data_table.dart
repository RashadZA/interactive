import 'package:flutter/material.dart';
import 'package:interactive/core/storageService/local_db.dart';
import 'package:interactive/feature/coursePlayerPage/model/module_model.dart';
import 'package:sqflite/sqflite.dart';

class BookMarkDataFromDatabase{

  String bookMarkDB = "BookMarkDB";
  String courseKey = "courseKey";
  String courseModuleName = "courseModuleName";
  String courseModuleKey = "courseModuleKey";
  String courseModuleDuration = "courseModuleDuration";
  String courseModuleBookMarkTime = "courseModuleBookMarkTime";

  Future getBookMarkDetails() async {
    Database db = await DatabaseHelper().database;
    dynamic result = await db.query(bookMarkDB);
    debugPrint("BookMark List: $result");
    return result;
  }

  Future getBookMarkDetailsAccordingToModuleKey({required String moduleKey}) async {
    Database db = await DatabaseHelper().database;
    dynamic result = await db.query(bookMarkDB,where: 'courseModuleKey = \'$moduleKey\'');
    debugPrint("BookMark According To ModuleKey List: $result");
    return result;
  }

  Future insertBookMarkData({required ModuleModel moduleModel, required String moduleDuration, required String moduleBookMarkTime,}) async {
    Database db = await DatabaseHelper().database;
    var row = {
      courseKey : moduleModel.courseKey,
      courseModuleName: moduleModel.courseModuleName,
      courseModuleKey: moduleModel.courseModuleKey,
      courseModuleDuration: moduleDuration,
      courseModuleBookMarkTime: moduleBookMarkTime,
    };
    debugPrint("Before Inserting BookMark Data: $row");
    dynamic result = await db.insert(bookMarkDB, row,conflictAlgorithm: ConflictAlgorithm.replace);
    debugPrint("After Inserting BookMark Data: $result");
    getBookMarkDetails();
    return result;
  }


  Future deleteBookMarkListTable()async{
    Database db = await DatabaseHelper().database;
    await db.delete(bookMarkDB);
  }



}