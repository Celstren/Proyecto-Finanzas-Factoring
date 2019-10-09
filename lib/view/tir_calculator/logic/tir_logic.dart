import 'dart:math';

import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/view/tir_calculator/objects/fee_object.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';

double calculateTIR(double initialOutlay, List<FeeObject> fees, {int limit = 100}){
  double vat = 0.0;

  double maxValue = 10e4;
  double minValue = 10e-4;
  double optimalValue = 10e-10;

  double tir = (maxValue + minValue) / 2;

  vat = calculateVAN(initialOutlay, fees, minValue);
  print("Valor de la VAT con el mínimo $vat");
  if (vat.abs() <= optimalValue){ return minValue; }

  vat = calculateVAN(initialOutlay, fees, maxValue);
  print("Valor de la VAT con el máximo $vat");
  if (vat.abs() <= optimalValue){ return maxValue; }

  vat = calculateVAN(initialOutlay, fees, tir);
  print("Valor de la VAT con el posible tir $vat");
  if (vat.abs() <= optimalValue){ return tir; }

  while(limit > 0 && vat.abs() > optimalValue){

    double vatWithMax = calculateVAN(initialOutlay, fees, maxValue);

    if (vatWithMax * vat < 0){ minValue = tir; }
    else { maxValue = tir; }

    tir = (maxValue + minValue) / 2;

    vat = calculateVAN(initialOutlay, fees, tir);

    limit--;
  }


  return tir * 100;
}

double calculateVAN(double initialOutlay, List<FeeObject> fees, double tir){
  double feesTotal = 0.0;

  fees.forEach((fee){
    feesTotal += fee.getUtility() / pow(1+tir, fee.getTime());
  });

  return initialOutlay - feesTotal;
}

bool validateOperation(double initialOutlay, List<FeeObject> fees){

  if (initialOutlay < 0){
    Fluttertoast.showToast(msg: TIRCalculatorStrings.INVALID_INITIAL_OUTLAY, fontSize: ScreenUtil.getInstance().setSp(36), backgroundColor: FinanzappColorsLightMode.MAIN_THEME);
    return false;
  }

  if (fees.isEmpty){
    Fluttertoast.showToast(msg: TIRCalculatorStrings.EMPTY_FEES_LIST, fontSize: ScreenUtil.getInstance().setSp(36), backgroundColor: FinanzappColorsLightMode.MAIN_THEME);
    return false;
  }

  for (int i = 0; i < fees.length; i++){
    if (fees[i].getUtility() < 0){
      Fluttertoast.showToast(msg: "${TIRCalculatorStrings.NEGATIVE_UTILITY}${i + 1}", fontSize: ScreenUtil.getInstance().setSp(36), backgroundColor: FinanzappColorsLightMode.MAIN_THEME);
      return false;
    }

    try {
      double.parse(fees[i].timeController.value.text);
    } catch(e) {
      Fluttertoast.showToast(msg: "${TIRCalculatorStrings.INVALID_TIME}${i + 1}", fontSize: ScreenUtil.getInstance().setSp(36), backgroundColor: FinanzappColorsLightMode.MAIN_THEME);
      return false;
    }
  }

  return true;
}