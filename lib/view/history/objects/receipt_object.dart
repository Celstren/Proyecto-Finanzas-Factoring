import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_enums.dart';
import 'package:proyecto_finanzas/view/factoring_calculator_view/objects/factoring_objects.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class ReceiptObject {
  TextEditingController receiptName;
  double amount;
  DateTime expirationDate;
  DateTime discountDate;
  FactoringResultObject factoringResultObject = FactoringResultObject(0, 0, 0, 0, 0, 0);
  MoneyMaskedTextController amountTextEditingController = MoneyMaskedTextController(leftSymbol: '\$ ', decimalSeparator: ".", thousandSeparator: ",");
  MoneyMaskedTextController rateAmountController = MoneyMaskedTextController(rightSymbol: '%', decimalSeparator: ".", thousandSeparator: ",");
  TextEditingController capitalizationAmountController = TextEditingController(text: "");
  List<CostObject> costs = [];
  List<PaymentObject> payments = [];
  Rate rateSelected = Rate.EFFECTIVE_RATE;
  FinanceDateEnum capitalizationPeriod = FinanceDateEnum.FINANCE_DAY;
  FinanceDateEnum ratePeriod = FinanceDateEnum.FINANCE_DAY;

  ReceiptObject(this.receiptName, this.amount, this.expirationDate, this.discountDate);

  clear(){
    factoringResultObject = FactoringResultObject(0, 0, 0, 0, 0, 0);
    amountTextEditingController = MoneyMaskedTextController(leftSymbol: '\$ ', decimalSeparator: ".", thousandSeparator: ",");
    rateAmountController = MoneyMaskedTextController(rightSymbol: '%', decimalSeparator: ".", thousandSeparator: ",");
    capitalizationAmountController = TextEditingController(text: "");
    costs = [];
    payments = [];
  }
}