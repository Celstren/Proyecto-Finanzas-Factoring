import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:proyecto_finanzas/model/connection/constant_api.dart';
import 'package:proyecto_finanzas/model/data_base/cartera_model/cartera.dart';
import 'package:proyecto_finanzas/model/data_base/shared_preference_data.dart';
import 'package:proyecto_finanzas/model/data_base/user_model/user.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';

class CarteraRequest {
  static Future<List<Cartera>> carteraRequestGetAllByUser() async {
    String token = await SharedPreferenceData.getToken();
    User user = await SharedPreferenceData.getUser();

    if (user != null && user.usuario != null){
      String url = "${ConstantApi.ENVIRONMENT}${ConstantApi.GET_ALL_CARTERA_BY_USER_ENDPOINT}${user.usuario}";
      var response = await http.get(url,
          headers: {
            "Authorization": "Token $token",
          });
      if (response.statusCode == 200){
        List<dynamic> results = jsonDecode(response.body);
        List<Cartera> carteras = [];
        results.forEach((result){
          carteras.add(Cartera.fromJson(result));
        });
        return carteras;
      }
    }
    return [];
  }

  static Future<bool> carteraRequestAddNewCartera(Cartera newCartera) async {
    String token = await SharedPreferenceData.getToken();

    String url = "${ConstantApi.ENVIRONMENT}${ConstantApi.SAVE_CARTERA_ENDPOINT}";
    var response = await http.post(url,
        body: newCartera.toJson(),
        headers: {
          "Authorization": "Token $token",
          "Content-Type": "application/x-www-form-urlencoded",
        });
    if (response.statusCode == 201){
      Fluttertoast.showToast(msg: HistoryStrings.SAVE_CARTERA_SUCCESS_MESSAGE, fontSize: ScreenUtil.getInstance().setSp(24));
      return true;
    } else {
      Fluttertoast.showToast(msg: HistoryStrings.SAVE_CARTERA_FAILED_ERROR_MESSAGE, fontSize: ScreenUtil.getInstance().setSp(24));
      return false;
    }
  }

  static Future<bool> carteraRequestUpdateCartera(Cartera updatedCartera) async {
    String token = await SharedPreferenceData.getToken();

    String url = "${ConstantApi.ENVIRONMENT}${ConstantApi.SAVE_CARTERA_ENDPOINT}${updatedCartera.id}/";
    var response = await http.put(url,
        body: updatedCartera.toJson(),
        headers: {
          "Authorization": "Token $token",
          "Content-Type": "application/x-www-form-urlencoded",
        });
    if (response.statusCode == 200){
      Fluttertoast.showToast(msg: HistoryStrings.UPDATE_CARTERA_SUCCESS_MESSAGE, fontSize: ScreenUtil.getInstance().setSp(24));
      return true;
    } else {
      Fluttertoast.showToast(msg: HistoryStrings.UPDATE_CARTERA_FAILED_ERROR_MESSAGE, fontSize: ScreenUtil.getInstance().setSp(24));
      return false;
    }
  }

  static Future<bool> carteraRequestDeleteCartera(int carteraId) async {
    String token = await SharedPreferenceData.getToken();

    String url = "${ConstantApi.ENVIRONMENT}${ConstantApi.SAVE_CARTERA_ENDPOINT}$carteraId/";
    var response = await http.delete(url,
        headers: {
          "Authorization": "Token $token",
          "Content-Type": "application/x-www-form-urlencoded",
        });
    if (response.statusCode == 204){
      Fluttertoast.showToast(msg: HistoryStrings.DELETE_CARTERA_SUCCESS_MESSAGE, fontSize: ScreenUtil.getInstance().setSp(24));
      return true;
    } else {
      Fluttertoast.showToast(msg: HistoryStrings.DELETE_CARTERA_FAILED_ERROR_MESSAGE, fontSize: ScreenUtil.getInstance().setSp(24));
      return false;
    }
  }
}