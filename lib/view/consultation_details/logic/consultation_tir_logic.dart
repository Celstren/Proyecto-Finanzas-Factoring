import 'dart:math';

import 'package:proyecto_finanzas/view/factoring_calculator_view/logic/factoring_calculator_logic.dart';
import 'package:proyecto_finanzas/view/history/objects/receipt_object.dart';

double calculateConsultationTIR(double initialOutlay, List<ReceiptObject> receipts, {int limit = 100}){
  double vat = 0.0;

  double maxValue = 10e4;
  double minValue = 10e-4;
  double optimalValue = 10e-10;

  double tir = (maxValue + minValue) / 2;

  vat = calculateVAN(initialOutlay, receipts, minValue);
  if (vat.abs() <= optimalValue){ return minValue; }

  vat = calculateVAN(initialOutlay, receipts, maxValue);
  if (vat.abs() <= optimalValue){ return maxValue; }

  vat = calculateVAN(initialOutlay, receipts, tir);
  if (vat.abs() <= optimalValue){ return tir; }

  while(limit > 0 && vat.abs() > optimalValue){

    double vatWithMax = calculateVAN(initialOutlay, receipts, maxValue);

    if (vatWithMax * vat < 0){ minValue = tir; }
    else { maxValue = tir; }

    tir = (maxValue + minValue) / 2;

    vat = calculateVAN(initialOutlay, receipts, tir);

    limit--;
  }


  return tir * 100;
}

double calculateVAN(double initialOutlay, List<ReceiptObject> receipts, double tir){
  double receiptsTotal = 0.0;

  receipts.forEach((receipt){
    receiptsTotal += receipt.factoringResultObject.receivedValue / pow(1+tir, peruStandardDaysDifferenceConversion(receipt.discountDate, receipt.expirationDate) / 360);
  });

  return initialOutlay - receiptsTotal;
}