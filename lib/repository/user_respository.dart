import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../utils/constants.dart';


final FirebaseFirestore _firestore = ConnectFirebase.firestore;
final CollectionReference _users = _firestore.collection('users');

class UserRepository{
  
  static Future<Response> addUser(UserModel user) async {
    Response response = Response();

    DocumentReference documentReference = _users.doc();

    await documentReference.set(user.toJson()).whenComplete(() {
      response.status = 200;
      response.message = "User added successfully";
    }).catchError((e){
      response.status = 400;
      response.message = "Something went wrong";
    }); 

    return response;
    // await FirebaseFirestore.instance.collection("users").add(user.toJson()).whenComplete(
    //   () => Get.snackbar("Success", "Your account has been created.",
    //       snackPosition: SnackPosition.BOTTOM,
    //       backgroundColor: Colors.brown,
    //       colorText: Colors.white) 
    // ).catchError((error,stackTrace){
    //   Get.snackbar("OOPS!", "Something went wrong.", 
    //       snackPosition: SnackPosition.BOTTOM,
    //       backgroundColor: Colors.brown,
    //       colorText: Colors.white);
    // });
  }

}
