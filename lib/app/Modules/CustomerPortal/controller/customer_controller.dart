import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'package:zeldesk/app/Modules/Login/controller/get_login_instance.dart';
import 'package:zeldesk/app/data/Models/complaint_model.dart';
import 'package:jiffy/jiffy.dart';
import 'package:zeldesk/app/data/Services/firebase/auth_services.dart';
import 'package:zeldesk/app/data/Services/firebase/fireStore_service.dart';

import '../../../Widgets/singlePopupMenuItem.dart';

class CustomerController extends GetxController {
  bool isLoading = true;
  //! GET CUSTOMER NAME
  get getCustomerName {
    return GetLoginUserInstance.instance.user!.name;
  }

  @override
  void onInit() {
    getAllComplaints();
    print(GetLoginUserInstance.instance.user!.user_permissions);

    super.onInit();
  }

  //! CREATE NEW COMPLAINT
  Future<String> createNewComplaint({
    required String subject,
    required String description,
  }) {
    DateTime currentTime = DateTime.now();
    //String formatedDateTime = Jiffy(currentTime).format('yyyy-MMMM-do, h:mm:ss a');

    var result = FireStoreService().addComplaintDetial(ComplaintModel(
        emp_id: "sLxMbYXn1acztDVCoLxOiJPbaic2",
        subject: subject,
        description: description,
        complainant: "Ijaz",
        created_at: currentTime,
        status: "Open"));
    getAllComplaints();
    update();
    return result;
  }

  late List<ComplaintModel> _complaintList;
  Future<List<ComplaintModel>?> getAllComplaints() async {
    print("i am here");
    var result = await FireStoreService().getAllComplaints();

    print("Getting all complaints");
    // print(result.toString());
    if (result is List<ComplaintModel>) {
      isLoading = false;

      update();
      return _complaintList = result;
    } else {
      Get.defaultDialog(title: result);
    }
  }

  void deleteComplaint(String id) async {
    var result = await FireStoreService().deleteComplaint(id);
    getAllComplaints();
    update();
  }

  List<ComplaintModel> getlist() => _complaintList;
  bool? getCreateTicketPermission() =>
      GetLoginUserInstance.instance.user!.user_permissions!['Create a ticket'];
  bool? getDeleteTicketPermission() =>
      GetLoginUserInstance.instance.user!.user_permissions!['Delete a ticket'];

  //! GET CUSTOMER POPUP MENU
  List<PopupMenuItem> get popupItems => [
        PopupMenuItem(
            child: SizedBox(
                width: 150,
                child: singlePopupMenuItem(
                  icon: Icons.person,
                  text: "Profile",
                ))),
        PopupMenuItem(
            onTap: () {
              print("tapped");
              AuthServices().logout();
            },
            child: SizedBox(
                width: 150,
                child: singlePopupMenuItem(
                  icon: Icons.logout,
                  text: "Logout",
                ))),
      ];
}
