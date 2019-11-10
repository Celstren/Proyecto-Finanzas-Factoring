import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:proyecto_finanzas/model/connection/constant_api.dart';
import 'package:proyecto_finanzas/model/data_base/cartera_model/cartera.dart';
import 'package:proyecto_finanzas/model/data_base/shared_preference_data.dart';
import 'package:proyecto_finanzas/model/data_base/user_model/user.dart';

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
}