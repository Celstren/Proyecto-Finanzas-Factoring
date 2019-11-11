import 'dart:math';

import 'package:proyecto_finanzas/view/history/objects/receipt_object.dart';

double calculateConsultationTIR(double initialOutlay, List<ReceiptObject> receipts, int yearDates, {int limit = 100}){
  double vat = 0.0;

  double maxValue = 10e4;
  double minValue = 10e-4;
  double optimalValue = 10e-10;

  double tir = (maxValue + minValue) / 2;

  vat = calculateVAN(initialOutlay, receipts, minValue, yearDates);
  if (vat.abs() <= optimalValue){ return minValue; }

  vat = calculateVAN(initialOutlay, receipts, maxValue, yearDates);
  if (vat.abs() <= optimalValue){ return maxValue; }

  vat = calculateVAN(initialOutlay, receipts, tir, yearDates);
  if (vat.abs() <= optimalValue){ return tir; }

  while(limit > 0 && vat.abs() > optimalValue){

    double vatWithMax = calculateVAN(initialOutlay, receipts, maxValue, yearDates);

    if (vatWithMax * vat < 0){ minValue = tir; }
    else { maxValue = tir; }

    print(tir);

    tir = (maxValue + minValue) / 2;

    vat = calculateVAN(initialOutlay, receipts, tir, yearDates);

    limit--;
  }


  return tir * 100;
}

double calculateVAN(double initialOutlay, List<ReceiptObject> receipts, double tir, int yearDates){
  double receiptsTotal = 0.0;

  receipts.forEach((receipt){
    receiptsTotal += receipt.factoringResultObject.receivedValue / pow(1+tir, receipt.expirationDate.difference(receipt.discountDate).inDays / yearDates);
  });

  return initialOutlay - receiptsTotal;
}