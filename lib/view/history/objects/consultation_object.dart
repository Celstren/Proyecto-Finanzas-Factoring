import 'package:proyecto_finanzas/view/history/objects/receipt_object.dart';

class ConsultationObject {
  DateTime date;
  String descripcion;
  double importeActual;
  double tir;
  List<ReceiptObject> receiptObjects;

  ConsultationObject(this.date, this.receiptObjects, this.descripcion, this.importeActual, this.tir,);
}