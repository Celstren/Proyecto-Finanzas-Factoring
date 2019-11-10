import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:proyecto_finanzas/model/connection/constant_api.dart';
import 'package:proyecto_finanzas/model/data_base/shared_preference_data.dart';
import 'package:proyecto_finanzas/model/data_base/user_model/user.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';

class UserRequest {
  static Future<bool> userRequestLogin(String username, String password) async {
    var response = await http.post(ConstantApi.ENVIRONMENT + ConstantApi.LOGIN_ENDPOINT, body: User.toLoginRequest(username, password));

    if (response.statusCode == 200){
      Map<String, dynamic> result = jsonDecode(response.body);
      SharedPreferenceData.setToken(result["token"]);
      return true;
    } else {
      Fluttertoast.showToast(msg: SignInStrings.WRONG_CREDENTIALS_ERROR_MESSAGE, fontSize: ScreenUtil.getInstance().setSp(24));
    }
    return false;
  }

  static Future<bool> getCurrentUserRequest() async {
    String token = await SharedPreferenceData.getToken();

    var response = await http.get(ConstantApi.ENVIRONMENT + ConstantApi.USER_ENDPOINT,
        headers: {
          "Authorization": "Token $token",
        });

    if (response.statusCode == 200){
      Map<String, dynamic> result = jsonDecode(response.body);
      SharedPreferenceData.setUser(User.fromJson(result["info"]));
      return true;
    } else {
      Fluttertoast.showToast(msg: SignInStrings.NO_USER_FOUND_ERROR_MESSAGE, fontSize: ScreenUtil.getInstance().setSp(24));
      return false;
    }
  }
}