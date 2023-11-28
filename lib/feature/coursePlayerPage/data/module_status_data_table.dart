import 'package:flutter/material.dart';
import 'package:interactive/core/storageService/local_db.dart';
import 'package:interactive/feature/coursePlayerPage/model/module_model.dart';
import 'package:sqflite/sqflite.dart';

class ModuleStatusDataFromDatabase{

  String moduleStatusDB = "ModuleStatusDB";
  String courseKey = "courseKey";
  String courseModuleName = "courseModuleName";
  String courseModuleKey = "courseModuleKey";
  String courseModuleDuration = "courseModuleDuration";
  String courseModuleWatchTime = "courseModuleWatchTime";
  String courseModuleWatchStatus = "courseModuleWatchStatus";

  Future getModuleStatusDetailsList() async {
    Database db = await DatabaseHelper().database;
    dynamic result;
    try{
      result = await db.query(moduleStatusDB);
      debugPrint("Module Status Details List: $result");
      return result;
    }on DatabaseException catch(e){
      debugPrint("Error : $e");
      return [];
    }
  }
  Future getModuleKeyList() async {
    Database db = await DatabaseHelper().database;
    dynamic result;
    try{
      result = await db.rawQuery("SELECT $courseModuleKey FROM $moduleStatusDB where $courseModuleWatchStatus = 'Done'");
      debugPrint("Module Key List: $result");
      return result;
    }on DatabaseException catch(e){
      debugPrint("Error : $e");
      return [];
    }
  }


  Future getModuleStatusDetails({required String moduleKey}) async {
    Database db = await DatabaseHelper().database;
    List result;
    try{
      result = await db.query(moduleStatusDB,where: 'courseModuleKey = \'$moduleKey\'');
      debugPrint("Module Status Details List: $result");
      return result.isEmpty ? null : result;
    }on DatabaseException catch(e){
      debugPrint("Error : $e");
      return null;
    }


  }

  Future makeDesitionForInsertOrUpdateDataInDatabase({required ModuleModel moduleModel, required String moduleDuration, required String moduleWatchTime, required String moduleWatchStatus}) async {
    dynamic result = await getModuleStatusDetails(moduleKey: moduleModel.courseModuleKey ?? "");
    if(result == null){
     await insertModuleStatusData(moduleModel: moduleModel, moduleDuration: moduleDuration, moduleWatchTime: moduleWatchTime, moduleWatchStatus: moduleWatchStatus);

    }else{
      await updateModuleStatusData(moduleModel: moduleModel, moduleDuration: moduleDuration, moduleWatchTime: moduleWatchTime, moduleWatchStatus: moduleWatchStatus);

       }

  }

  Future insertModuleStatusData({required ModuleModel moduleModel, required String moduleDuration, required String moduleWatchTime, required String moduleWatchStatus}) async {
    Database db = await DatabaseHelper().database;
    var row = {
      courseKey : moduleModel.courseKey,
      courseModuleName: moduleModel.courseModuleName,
      courseModuleKey: moduleModel.courseModuleKey,
      courseModuleDuration: moduleDuration,
      courseModuleWatchTime: moduleWatchTime,
      courseModuleWatchStatus: moduleWatchStatus
    };
    debugPrint("Before Inserting ModuleStatus Data: $row");
    dynamic result = await db.insert(moduleStatusDB, row,conflictAlgorithm: ConflictAlgorithm.replace);
    debugPrint("After Inserting ModuleStatus Data: $result");
    return result;
  }
  Future updateModuleStatusData({required ModuleModel moduleModel, required String moduleDuration, required String moduleWatchTime, required String moduleWatchStatus}) async {
    Database db = await DatabaseHelper().database;
    var row = {
      courseModuleDuration: moduleDuration,
      courseModuleWatchTime: moduleWatchTime,
      courseModuleWatchStatus: moduleWatchStatus
    };
    debugPrint("Before Updating ModuleStatus Data: $row");
    dynamic result = await db.update(moduleStatusDB, row,where: 'courseModuleKey = \'${moduleModel.courseModuleKey}\' and courseKey = \'${moduleModel.courseKey}\'');
    debugPrint("After Updating ModuleStatus Data: $result");
    return result;
  }

  Future deleteModuleStatusListTable()async{
    Database db = await DatabaseHelper().database;
    await db.delete(moduleStatusDB);
  }



}