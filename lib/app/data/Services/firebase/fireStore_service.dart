import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zeldesk/app/Modules/Login/controller/get_login_instance.dart';
import 'package:zeldesk/app/data/Models/complaint_model.dart';
import 'package:zeldesk/app/data/Models/user_model.dart';
import 'package:zeldesk/app/data/Services/firebase/auth_services.dart';

class FireStoreService {
  //* SINGELTON
  //?====================================
  static final FireStoreService _singleton = FireStoreService._internal();
  factory FireStoreService() {
    return _singleton;
  }
  FireStoreService._internal();

  //* INITILIZING FIREBASE FIELDS
  //?====================================
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference _complaints =
      FirebaseFirestore.instance.collection('Complaints');

//?=====================================================================
//*=================== User Side Queries //////////////////////////////
//?=====================================================================

  //! ADD USER DETAILS
  Future<bool> addUserDetial(UserModel model, String uid) async {
    try {
      model.id = uid;
      await _users.doc(uid).set(model.toMap());
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  //! GET USER
  Future getUser() async {
    try {
      String uid = await AuthServices().getCurrentUserID();
      var documentReference = await _users.doc(uid).get();

      if (documentReference.data() == null) {
        print("is null");
      }

      return GetLoginUserInstance.instance.user =
          UserModel.fromMap(documentReference.data() as Map<String, dynamic>);
    } on Exception catch (e) {
      return e.toString();
    }
  }
//?=====================================================================
//*=================== Complaint Side Queries //////////////////////////////
//?=====================================================================

  //! ADD A NEW CUSTOMER COMPLAINT
  Future<String> addComplaintDetial(ComplaintModel model) async {
    String res = '';
    try {
      final complaintDoc = _complaints.doc();
      model.complaint_id = complaintDoc.id;
      print(model.complaint_id);
      await complaintDoc.set(model.toMap());

      return res = "Sucess";
    } catch (e) {
      print(e.toString());
      return res = "Some error has occured";
    }
  }

  //! GET ALL CUSTOMERS COMPLAINT

  Future getAllComplaints() async {
    try {
      late QuerySnapshot<Object?> complaints;
      complaints =
          await _complaints.orderBy('created_at', descending: false).get();

      List<ComplaintModel> complaintsList = [];
      for (var i = 0; i < complaints.docs.length; i++) {
        ComplaintModel complaint = ComplaintModel.fromMap(
            complaints.docs[i].data() as Map<String, dynamic>);

        complaintsList.add(complaint);
      }

      return complaintsList;
    } catch (e) {
      return e.toString();
    }
  }

  //! DELETE COMPLAINT
  Future? deleteComplaint(String id) {
    _complaints
        .doc(id) // <-- Doc ID to be deleted.
        .delete() // <-- Delete
        .then((_) => "Deleted")
        .catchError((error) {
      print(error);
      return "Error";
    });
  }
}
