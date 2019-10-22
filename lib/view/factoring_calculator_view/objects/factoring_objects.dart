import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';


class CostObject {
  final TextEditingController nameController;
  final MoneyMaskedTextController amountController;

  CostObject(this.nameController, this.amountController);
}

class PaymentObject {
  final TextEditingController nameController;
  final MoneyMaskedTextController amountController;

  PaymentObject(this.nameController, this.amountController);
}

class FactoringResultObject {
  final double discountRate;
  final double discountAmount;
  final double givenValue;
  final double receivedValue;
  final double netValue;
  final double effectiveAnnualCostRate;

  FactoringResultObject(this.discountRate, this.discountAmount, this.givenValue, this.receivedValue, this.effectiveAnnualCostRate, this.netValue);
}