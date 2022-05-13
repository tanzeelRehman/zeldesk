import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeldesk/app/data/Models/user_model.dart';
import 'package:zeldesk/app/data/Services/firebase/fireStore_service.dart';
import 'package:zeldesk/app/Widgets/custom_dialog.dart';
import 'package:zeldesk/routes/routes.dart';

class AuthServices {
  //* SINGELTON
  //?====================================
  static final AuthServices _singleton = AuthServices._internal();
  factory AuthServices() {
    return _singleton;
  }
  AuthServices._internal();

  //* INITILIZING FIREBASE FIELDS
  //?====================================
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late UserCredential _user;

  //* CREATE USER WITH EMAIL AND PASSWORD
  //?====================================

  Future<String> createUserWithEmailAndPass({
    required email,
    required password,
    required UserModel model,
  }) async {
    String result;
    try {
      //! AUTHENTICATION
      _user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      //! ADDING DATA IN USER COLLECTION
      var isUserDocumentAdded =
          await FireStoreService().addUserDetial(model, _user.user!.uid);

      if (_user != null && isUserDocumentAdded == true) {
        return result = "Sucess";
      }
    } catch (error) {
      if (error is FirebaseAuthException) {
        return error.message!;
      }

      return error.toString();
    }
    return result = "Some error has occured";
  }

  //* LOGIN USER WITH EMAIL AND PASSWORD
  //?====================================
  Future loginUser({
    required String email,
    required String password,
  }) async {
    String res = '';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        //! logging in user with email and password
        _user = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      }
      return true;
    } catch (error) {
      if (error is FirebaseAuthException) {
        print(error.message);
        return error.message!;
      }
      print(error.toString());
      return error.toString();
    }
  }

  //! GET CURENT USER ID
  Future<String> getCurrentUserID() async {
    return _auth.currentUser!.uid.toString();
  }

  Future logout() async {
    print("logging out");
    await _auth.signOut().then((value) => Get.offAndToNamed(Routes.LOGIN));
  }
}
