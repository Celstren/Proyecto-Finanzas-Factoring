import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/view/history/objects/receipt_object.dart';

class ConsultationObject {
  final TextEditingController consultationName;
  final int factoringCalculationQuantity;
  final DateTime date;
  final List<ReceiptObject> receiptObjects;

  ConsultationObject(this.consultationName, this.factoringCalculationQuantity, this.date, this.receiptObjects,);
}