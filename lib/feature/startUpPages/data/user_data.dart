import 'package:flutter/material.dart';
import 'package:interactive/core/storageService/local_db.dart';
import 'package:interactive/core/widgets/user_model.dart';
import 'package:sqflite/sqflite.dart';

class UserDataFromDatabase{

  String userDB = "UserDB";
  String uid = "uid";
  String firstName = "firstName";
  String secondName = "secondName";
  String mobileNumber = "mobileNumber";
  String email = "email";
  String signIn = "signIn";

  Future getUserDetails() async {
    Database db = await DatabaseHelper().database;
    dynamic result = await db.query(userDB);
    debugPrint("Users List: $result");
    return result;
  }


  Future insertUserData({required UserModel user, required String signInStatus}) async {
    Database db = await DatabaseHelper().database;
    var row = {
      uid : user.uid,
      firstName: user.firstName,
      secondName: user.secondName,
      mobileNumber: user.mobileNumber,
      email: user.email,
      signIn: signInStatus
    };
    debugPrint("Before Inserting User: $row");
    dynamic result = await db.insert(userDB, row,conflictAlgorithm: ConflictAlgorithm.replace);
    debugPrint("After Inserting User: $result");
    return result;
  }

  Future updateUserSignINStatusData({required String userEmail, required String signInStatus}) async {
    Database db = await DatabaseHelper().database;
    var row = {
      signIn: signInStatus,
    };
    debugPrint("Before Updating ModuleStatus Data: $row");
    dynamic result = await db.update(userDB, row,where: 'email = \'$userEmail\'');
    debugPrint("After Updating ModuleStatus Data: $result");
    getUserDetails();
    return result;
  }


  Future deleteUsersListTable()async{
    Database db = await DatabaseHelper().database;
    await db.delete(userDB);
  }



}