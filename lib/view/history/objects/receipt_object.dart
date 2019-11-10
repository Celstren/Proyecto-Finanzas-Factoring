import 'package:proyecto_finanzas/helpers/finanzapp_enums.dart';
import 'package:proyecto_finanzas/model/data_base/recibo_model/recibo.dart';
import 'package:proyecto_finanzas/view/factoring_calculator_view/objects/factoring_objects.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class ReceiptObject {
  int index;
  String descripcion;
  double amount;
  DateTime expirationDate;
  DateTime discountDate;
  FactoringResultObject factoringResultObject = FactoringResultObject(0, 0, 0, 0, 0, 0);
  MoneyMaskedTextController amountTextEditingController = MoneyMaskedTextController(leftSymbol: '\$ ', decimalSeparator: ".", thousandSeparator: ",");
  MoneyMaskedTextController rateAmountController = MoneyMaskedTextController(rightSymbol: '%', decimalSeparator: ".", thousandSeparator: ",");
  List<CostObject> costs = [];
  List<PaymentObject> payments = [];
  Rate rateSelected = Rate.EFFECTIVE_RATE;
  FinanceDateEnum capitalizationPeriod = FinanceDateEnum.FINANCE_DAY;
  FinanceDateEnum ratePeriod = FinanceDateEnum.FINANCE_DAY;

  ReceiptObject(this.index, this.amount, this.expirationDate, this.discountDate);

  clear(){
    factoringResultObject = FactoringResultObject(0, 0, 0, 0, 0, 0);
    amountTextEditingController = MoneyMaskedTextController(leftSymbol: '\$ ', decimalSeparator: ".", thousandSeparator: ",");
    rateAmountController = MoneyMaskedTextController(rightSymbol: '%', decimalSeparator: ".", thousandSeparator: ",");
    costs = [];
    payments = [];
  }

  factory ReceiptObject.fromRecibo(Recibo recibo, int index){
    ReceiptObject receiptObject = new ReceiptObject(index, 1000, recibo.fechaVencimiento, recibo.fechaDescuento);
    receiptObject.descripcion = recibo.descripcion;
    receiptObject.factoringResultObject = new FactoringResultObject(recibo.tasaDescuento, receiptObject.amount * recibo.tasaDescuento, 0, 0, recibo.tasaCostesEfectiva, 0);

    switch(recibo.tipoPeriodoCapitalizacion){
      case 1: receiptObject.capitalizationPeriod = FinanceDateEnum.FINANCE_DAY; break;
      case 2: receiptObject.capitalizationPeriod = FinanceDateEnum.FIFTEEN_DAY_PERIOD; break;
      case 3: receiptObject.capitalizationPeriod = FinanceDateEnum.FINANCE_MONTH; break;
      case 4: receiptObject.capitalizationPeriod = FinanceDateEnum.TWO_MONTH_PERIOD; break;
      case 5: receiptObject.capitalizationPeriod = FinanceDateEnum.THREE_MONTH_PERIOD; break;
      case 6: receiptObject.capitalizationPeriod = FinanceDateEnum.FOUR_MONTH_PERIOD; break;
      case 7: receiptObject.capitalizationPeriod = FinanceDateEnum.SIX_MONTH_PERIOD; break;
      case 8: receiptObject.capitalizationPeriod = FinanceDateEnum.FINANCE_YEAR; break;
      default: receiptObject.capitalizationPeriod = FinanceDateEnum.FINANCE_DAY; break;
    }

    switch(recibo.tipoPeriodoTasa){
      case 1: receiptObject.ratePeriod = FinanceDateEnum.FINANCE_DAY; break;
      case 2: receiptObject.ratePeriod = FinanceDateEnum.FIFTEEN_DAY_PERIOD; break;
      case 3: receiptObject.ratePeriod = FinanceDateEnum.FINANCE_MONTH; break;
      case 4: receiptObject.ratePeriod = FinanceDateEnum.TWO_MONTH_PERIOD; break;
      case 5: receiptObject.ratePeriod = FinanceDateEnum.THREE_MONTH_PERIOD; break;
      case 6: receiptObject.ratePeriod = FinanceDateEnum.FOUR_MONTH_PERIOD; break;
      case 7: receiptObject.ratePeriod = FinanceDateEnum.SIX_MONTH_PERIOD; break;
      case 8: receiptObject.ratePeriod = FinanceDateEnum.FINANCE_YEAR; break;
      default: receiptObject.ratePeriod = FinanceDateEnum.FINANCE_DAY; break;
    }

    switch(recibo.tipoTasa){
      case 1: receiptObject.rateSelected = Rate.EFFECTIVE_RATE; break;
      case 2: receiptObject.rateSelected = Rate.NOMINAL_RATE; break;
      default: receiptObject.rateSelected = Rate.EFFECTIVE_RATE; break;
    }

    return receiptObject;
  }
}