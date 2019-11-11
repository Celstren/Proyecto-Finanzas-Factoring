import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';


class CostObject {
  TextEditingController nameController;
  MoneyMaskedTextController amountController;

  CostObject(this.nameController, this.amountController);
}

class PaymentObject {
  TextEditingController nameController;
  MoneyMaskedTextController amountController;

  PaymentObject(this.nameController, this.amountController);
}

class FactoringResultObject {
  double discountRate;
  double discountAmount;
  double givenValue;
  double receivedValue;
  double netValue;
  double effectiveAnnualCostRate;

  FactoringResultObject(this.discountRate, this.discountAmount, this.givenValue, this.receivedValue, this.effectiveAnnualCostRate, this.netValue);
}