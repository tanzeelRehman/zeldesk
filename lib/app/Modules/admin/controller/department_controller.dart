import 'package:get/get.dart';
import 'package:zeldesk/app/data/Models/department_model.dart';
import 'package:zeldesk/app/data/Models/user_model.dart';
import 'package:zeldesk/app/data/Services/firebase/fireStore_service.dart';

class DepartmentController extends GetxController {
  @override
  void onInit() {
    getAllUsers();
    getAllDepartments();
    print("Getting all employees");
    super.onInit();
  }

  //! GET ALL USER
  late List<UserModel> employeeList;
  bool employeeListIsLoading = true;
  Future<void> getAllUsers() async {
    print("i am here");
    var result = await FireStoreService().getAllUsers();

    print("Getting all complaints");

    if (result is List<UserModel>) {
      employeeList = result;
      employeeListIsLoading = false;
      update();
    } else {
      Get.defaultDialog(title: result);
    }
  }

  //! UPDATING IS SELECTED CHECKBOX
  List<String> deptEmployeesList = [];
  void updateCheckbox(int index) {
    employeeList[index].isSelected = !employeeList[index].isSelected;
    if (deptEmployeesList.contains(employeeList[index].id)) {
      deptEmployeesList.remove(employeeList[index].id);
    } else {
      deptEmployeesList.add(employeeList[index].id!);
    }

    update();
  }

  //! CREATE A DEPARTMENT
  createNewDepartment({
    required String name,
  }) async {
    var result = await FireStoreService().createDepartment(DepartmentModel(
        departmentName: name, departmentEmployees: deptEmployeesList));
    if (result == "Sucess") {
      Get.defaultDialog(title: "Sucess");
    } else {
      Get.defaultDialog(title: result.toString());
    }
  }

  //! GET ALL DEPARTMENTS
  late List<DepartmentModel> departmentList;
  bool departmentListIsLoading = true;
  Future<void> getAllDepartments() async {
    print("i am here");
    var result = await FireStoreService().getAllDepartments();

    print("Getting all departments");
    print(result.toString());
    if (result is List<DepartmentModel>) {
      departmentList = result;
      departmentListIsLoading = false;
      update();
    } else {
      Get.defaultDialog(title: result);
    }
  }
}
