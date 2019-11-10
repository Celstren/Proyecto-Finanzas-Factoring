import 'dart:convert';

import 'package:proyecto_finanzas/model/connection/constant_api.dart';
import 'package:proyecto_finanzas/model/data_base/recibo_model/recibo.dart';
import 'package:proyecto_finanzas/model/data_base/shared_preference_data.dart';
import 'package:http/http.dart' as http;

class ReciboRequest {
  static Future<List<Recibo>> reciboRequestGetAllByCarteraId(int carteraId) async {
    String token = await SharedPreferenceData.getToken();
    String url = "${ConstantApi.ENVIRONMENT}${ConstantApi.GET_ALL_RECIBO_BY_CARTERA_ENDPOINT}$carteraId";
    var response = await http.get(url,
        headers: {
          "Authorization": "Token $token",
        });
    if (response.statusCode == 200){
      List<dynamic> results = jsonDecode(response.body);
      List<Recibo> recibos = [];
      results.forEach((result){
        recibos.add(Recibo.fromJson(result));
      });
      return recibos;
    }
    return [];
  }
}