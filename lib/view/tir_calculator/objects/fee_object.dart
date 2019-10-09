import 'package:flutter/cupertino.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class FeeObject {
  final TextEditingController timeController;
  final MoneyMaskedTextController chargeController;
  final MoneyMaskedTextController paymentController;

  FeeObject(this.timeController, this.chargeController, this.paymentController);

  double getTime(){
    try {
      return double.parse(timeController.value.text);
    } catch (e) {
      return 1;
    }
  }

  double getCharge() => chargeController.numberValue;
  double getPayment() => paymentController.numberValue;
  double getUtility() => chargeController.numberValue - paymentController.numberValue;
}