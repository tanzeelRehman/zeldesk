import 'package:zeldesk/app/data/Models/user_model.dart';

import '../../../data/Models/user_model.dart';

class GetLoginUserInstance {
  late UserModel? user;

  GetLoginUserInstance._();
  static GetLoginUserInstance? _loginUserInstance;

  static GetLoginUserInstance get instance {
    if (_loginUserInstance != null) {
      return _loginUserInstance!;
    } else {
      _loginUserInstance = GetLoginUserInstance._();
      return _loginUserInstance!;
    }
  }
}
