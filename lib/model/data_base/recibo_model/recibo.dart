// To parse this JSON data, do
//
//     final recibo = reciboFromJson(jsonString);

import 'dart:convert';

Recibo reciboFromJson(String str) => Recibo.fromJson(json.decode(str));

String reciboToJson(Recibo data) => json.encode(data.toJson());

class Recibo {
  int id;
  DateTime fechaDescuento;
  DateTime fechaVencimiento;
  String descripcion;
  int tipoPeriodoTasa;
  double valorTasa;
  int tipoTasa;
  double tasaDescuento;
  int tipoPeriodoCapitalizacion;
  int periodoCapitalizacion;
  double tasaCostesEfectiva;
  int cartera;

  Recibo({
    this.id,
    this.fechaDescuento,
    this.fechaVencimiento,
    this.descripcion,
    this.tipoPeriodoTasa,
    this.valorTasa,
    this.tipoTasa,
    this.tasaDescuento,
    this.tipoPeriodoCapitalizacion,
    this.periodoCapitalizacion,
    this.tasaCostesEfectiva,
    this.cartera,
  });

  factory Recibo.fromJson(Map<String, dynamic> json) => Recibo(
    id: json["id"],
    fechaDescuento: DateTime.parse(json["fecha_descuento"]),
    fechaVencimiento: DateTime.parse(json["fecha_vencimiento"]),
    descripcion: json["descripcion"],
    tipoPeriodoTasa: json["tipo_periodo_tasa"],
    valorTasa: double.parse(json["valor_tasa"]),
    tipoTasa: json["tipo_tasa"],
    tasaDescuento: double.parse(json["tasa_descuento"]),
    tipoPeriodoCapitalizacion: json["tipo_periodo_capitalizacion"],
    periodoCapitalizacion: json["periodo_capitalizacion"],
    tasaCostesEfectiva: double.parse(json["tasa_costes_efectiva"]),
    cartera: json["cartera"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fecha_descuento": "${fechaDescuento.year.toString().padLeft(4, '0')}-${fechaDescuento.month.toString().padLeft(2, '0')}-${fechaDescuento.day.toString().padLeft(2, '0')}",
    "fecha_vencimiento": "${fechaVencimiento.year.toString().padLeft(4, '0')}-${fechaVencimiento.month.toString().padLeft(2, '0')}-${fechaVencimiento.day.toString().padLeft(2, '0')}",
    "descripcion": descripcion,
    "tipo_periodo_tasa": tipoPeriodoTasa,
    "valor_tasa": valorTasa,
    "tipo_tasa": tipoTasa,
    "tasa_descuento": tasaDescuento,
    "tipo_periodo_capitalizacion": tipoPeriodoCapitalizacion,
    "periodo_capitalizacion": periodoCapitalizacion,
    "tasa_costes_efectiva": tasaCostesEfectiva,
    "cartera": cartera,
  };

  static Map<String, dynamic> toGetAllRecibosByCarteraIdRequest(int carteraId) => {
    "cartera": carteraId,
  };
}
