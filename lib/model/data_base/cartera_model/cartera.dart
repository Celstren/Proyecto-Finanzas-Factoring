// To parse this JSON data, do
//
//     final cartera = carteraFromJson(jsonString);

import 'dart:convert';

Cartera carteraFromJson(String str) => Cartera.fromJson(json.decode(str));

String carteraToJson(Cartera data) => json.encode(data.toJson());

class Cartera {
  int id;
  String descripcion;
  double importeActual;
  double tir;
  DateTime date;
  int cantidadRecibos;
  int usuario;

  Cartera({
    this.id,
    this.descripcion,
    this.importeActual,
    this.tir,
    this.date,
    this.cantidadRecibos,
    this.usuario,
  });

  factory Cartera.fromJson(Map<String, dynamic> json) => Cartera(
    id: json["id"],
    descripcion: json["descripcion"],
    importeActual: double.parse(json["importe_actual"]),
    tir: double.parse(json["tir"]),
    usuario: json["usuario"],
  );

  Map<String, dynamic> toJson() => {
    "descripcion": descripcion,
    "importe_actual": importeActual.toString(),
    "tir": tir.toString(),
    "usuario": usuario.toString(),
  };

  static Map<String, dynamic> toGetAllRequest(int userId) => {
    "usuario": userId,
  };
}
