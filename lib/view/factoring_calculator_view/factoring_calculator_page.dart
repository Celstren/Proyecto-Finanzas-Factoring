import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/view/factoring_calculator_view/logic/factoring_calculator_logic.dart';
import 'package:proyecto_finanzas/view/factoring_calculator_view/objects/factoring_objects.dart';
import 'package:proyecto_finanzas/view/factoring_calculator_view/widgets/factoring_calculator_widgets/calculated_time_widget.dart';
import 'package:proyecto_finanzas/view/factoring_calculator_view/widgets/factoring_calculator_widgets/amount_widget.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:proyecto_finanzas/view/factoring_calculator_view/widgets/factoring_calculator_widgets/costs_widget.dart';
import 'package:proyecto_finanzas/view/factoring_calculator_view/widgets/factoring_calculator_widgets/date_picker_widget.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/view/factoring_calculator_view/widgets/factoring_calculator_widgets/factoring_calculator_buttons_widget.dart';
import 'package:proyecto_finanzas/view/factoring_calculator_view/widgets/factoring_calculator_widgets/factoring_divider_widget.dart';
import 'package:proyecto_finanzas/view/factoring_calculator_view/widgets/factoring_calculator_widgets/paymens_widget.dart';
import 'package:proyecto_finanzas/view/factoring_calculator_view/widgets/factoring_calculator_widgets/rate_type_options_widget.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_enums.dart';
import 'package:proyecto_finanzas/view/factoring_calculator_view/widgets/factoring_calculator_widgets/rate_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proyecto_finanzas/view/factoring_calculator_view/factoring_result_page.dart';
import 'package:proyecto_finanzas/view/history/objects/receipt_object.dart';

class FactoringCalculatorPage extends StatefulWidget{
  final ReceiptObject receiptObject;

  const FactoringCalculatorPage({Key key, this.receiptObject}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FactoringCalculatorPageState();
  }
}

class _FactoringCalculatorPageState extends State<FactoringCalculatorPage>{

//  MoneyMaskedTextController amountTextEditingController = MoneyMaskedTextController(leftSymbol: '\$ ', decimalSeparator: ".", thousandSeparator: ",");
//  MoneyMaskedTextController rateAmountController = MoneyMaskedTextController(rightSymbol: '%', decimalSeparator: ".", thousandSeparator: ",");
//  TextEditingController capitalizationAmountController = TextEditingController(text: "");
//  List<CostObject> costs = [];
//  List<PaymentObject> payments = [];
//  DateTime startDate = DateTime.now();
//  DateTime endDate = DateTime.now();
//  Rate rateSelected = Rate.NOMINAL_RATE;
//  FinanceDateEnum capitalizationPeriod = FinanceDateEnum.FINANCE_DAY;
//  FinanceDateEnum ratePeriod = FinanceDateEnum.FINANCE_DAY;
//  FactoringResultObject resultObject = FactoringResultObject(0, 0, 0, 0, 0, 0);
  ReceiptObject tempReceiptObject;
  bool showResult = false;

  updateStartDate(DateTime newStartDate){
    setState(() {
      tempReceiptObject.discountDate = newStartDate;
    });
  }

  updateEndDate(DateTime newEndDate){
    setState(() {
      tempReceiptObject.expirationDate = newEndDate;
    });
  }

  updateTypeSelected(Rate newRate){
    setState(() {
      tempReceiptObject.rateSelected = newRate;
    });
  }

  updateCapitalizationPeriod(FinanceDateEnum newCapitalizationPeriod){
    setState(() {
      tempReceiptObject.capitalizationPeriod = newCapitalizationPeriod;
    });
  }

  updateRatePeriod(FinanceDateEnum newRatePeriod){
    setState(() {
      tempReceiptObject.ratePeriod = newRatePeriod;
    });
  }

  deleteCostAt(int index){
    setState(() {
      tempReceiptObject.costs.removeAt(index);
    });
  }

  addCost(){
    setState(() {
      tempReceiptObject.costs.add(new CostObject(new TextEditingController(), new MoneyMaskedTextController(leftSymbol: '\$ ', decimalSeparator: ".", thousandSeparator: ",")));
    });
  }

  deletePaymentAt(int index){
    setState(() {
      tempReceiptObject.payments.removeAt(index);
    });
  }

  addPayment(){
    setState(() {
      tempReceiptObject.payments.add(new PaymentObject(new TextEditingController(), new MoneyMaskedTextController(leftSymbol: '\$ ', decimalSeparator: ".", thousandSeparator: ",")));
    });
  }

  bool validateCalculations(){
    if (tempReceiptObject.expirationDate.difference(tempReceiptObject.discountDate).inDays < 0){
      Fluttertoast.showToast(msg: FactoringCalculatorStrings.ERROR_MESSAGE1);
      return false;
    } else if (tempReceiptObject.rateAmountController.numberValue == 0){
      Fluttertoast.showToast(msg: FactoringCalculatorStrings.ERROR_MESSAGE2);
      return false;
    }
    return true;
  }

  onCalculateFun(){
    if (validateCalculations()){
      bool isNominalRate = tempReceiptObject.rateSelected == Rate.NOMINAL_RATE;
      if (isNominalRate){


        double capitalizationDays =  FinanceDateEnum.getFinanceDateFromId(1, tempReceiptObject.capitalizationPeriod.id).toFinanceDay(isExact: false).value;
        //Day Net difference
        //int difDays = endDate.difference(startDate).inDays;

        int difDays = peruStandardDaysDifferenceConversion(tempReceiptObject.discountDate, tempReceiptObject.expirationDate);

        double m = FinanceDateEnum.getFinanceDateFromId(1, tempReceiptObject.ratePeriod.id).toFinanceDay(isExact: false).value / capitalizationDays;
        double n = difDays / capitalizationDays;


        tempReceiptObject.factoringResultObject = calculateResults(tempReceiptObject.costs, tempReceiptObject.payments, tempReceiptObject.rateAmountController.numberValue / 100, m, n, isNominalRate, tempReceiptObject.amountTextEditingController.numberValue, difDays);
      } else {
        //Day Net difference
        //int difDays = endDate.difference(startDate).inDays;

        int difDays = peruStandardDaysDifferenceConversion(tempReceiptObject.discountDate, tempReceiptObject.expirationDate);

        double m = FinanceDateEnum.getFinanceDateFromId(1, tempReceiptObject.ratePeriod.id).toFinanceDay(isExact: false).value;

        tempReceiptObject.factoringResultObject = calculateResults(tempReceiptObject.costs, tempReceiptObject.payments, tempReceiptObject.rateAmountController.numberValue / 100, m, 1.0, isNominalRate, tempReceiptObject.amountTextEditingController.numberValue, difDays);
      }
//      widget.receiptObject.amount = amountTextEditingController.numberValue;
//      widget.receiptObject.factoringResultObject = resultObject;
//      widget.receiptObject.discountDate = startDate;
//      widget.receiptObject.expirationDate = endDate;
//      widget.receiptObject.amountTextEditingController = amountTextEditingController;
//      widget.receiptObject.rateAmountController = rateAmountController;
//      widget.receiptObject.capitalizationAmountController = capitalizationAmountController;
//      widget.receiptObject.costs = costs;
//      widget.receiptObject.payments = payments;
//      widget.receiptObject.rateSelected = rateSelected;
//      widget.receiptObject.capitalizationPeriod = capitalizationPeriod;
//      widget.receiptObject.ratePeriod = ratePeriod;

      updateCalculator(true);
    }
  }

  onClearFun(){
    setState(() {
//      amountTextEditingController = MoneyMaskedTextController(leftSymbol: '\$ ', decimalSeparator: ".", thousandSeparator: ",");
//      rateAmountController = MoneyMaskedTextController(rightSymbol: '%', decimalSeparator: ".", thousandSeparator: ",");
//      capitalizationAmountController = TextEditingController(text: "");
//      costs = [];
//      payments = [];
//      startDate = DateTime.now();
//      endDate = DateTime.now();
//      rateSelected = Rate.NOMINAL_RATE;
//      capitalizationPeriod = FinanceDateEnum.FINANCE_DAY;
//      ratePeriod = FinanceDateEnum.FINANCE_DAY;
//      resultObject =
      widget.receiptObject.clear();
    });
  }

  updateCalculator(bool newValue){
    setState(() {
      showResult = !showResult;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tempReceiptObject.receiptName = widget.receiptObject.receiptName;
    tempReceiptObject.amount = widget.receiptObject.amount;
    tempReceiptObject.expirationDate = widget.receiptObject.expirationDate;
    tempReceiptObject.discountDate = widget.receiptObject.discountDate;
    tempReceiptObject.factoringResultObject = widget.receiptObject.factoringResultObject;
    tempReceiptObject.amountTextEditingController = widget.receiptObject.amountTextEditingController;
    tempReceiptObject.rateAmountController = widget.receiptObject.rateAmountController;
    tempReceiptObject.capitalizationAmountController = widget.receiptObject.capitalizationAmountController;
    tempReceiptObject.costs = widget.receiptObject.costs;
    tempReceiptObject.payments = widget.receiptObject.payments;
    tempReceiptObject.rateSelected = widget.receiptObject.rateSelected;
    tempReceiptObject.capitalizationPeriod = widget.receiptObject.capitalizationPeriod;
    tempReceiptObject.ratePeriod = widget.receiptObject.ratePeriod;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return !showResult? Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FactoringDividerWidget(text: FactoringCalculatorStrings.AMOUNT,),
            AmountWidget(controller: tempReceiptObject.amountTextEditingController,),
            FactoringDividerWidget(text: FactoringCalculatorStrings.TIME,),
            DatePickerWidget(date: tempReceiptObject.discountDate, title: FactoringCalculatorStrings.START_DATE, updateDate: updateStartDate,),
            DatePickerWidget(date: tempReceiptObject.expirationDate, title: FactoringCalculatorStrings.END_DATE, updateDate: updateEndDate,),
            CalculatedTimeWidget(daysAmount: tempReceiptObject.expirationDate.difference(tempReceiptObject.discountDate).inDays,),
            FactoringDividerWidget(text: FactoringCalculatorStrings.RATE,),
            RateTypeOptionsWidget(typeSelected: tempReceiptObject.rateSelected, updateTypeSelected: updateTypeSelected,),
            RateWidget(rate: tempReceiptObject.rateSelected, rateAmountController: tempReceiptObject.rateAmountController, capitalizationPeriod: tempReceiptObject.capitalizationPeriod, ratePeriod: tempReceiptObject.ratePeriod, onCapitalizationChange: updateCapitalizationPeriod, onRateChange: updateRatePeriod,),
            FactoringDividerWidget(text: FactoringCalculatorStrings.COSTS,),
            CostsWidget(costs: tempReceiptObject.costs, onAddFun: addCost, onDeleteFun: deleteCostAt,),
            FactoringDividerWidget(text: FactoringCalculatorStrings.PAYMENTS,),
            PaymentsWidget(payments: tempReceiptObject.payments, onAddFun: addPayment, onDeleteFun: deletePaymentAt,),
            FactoringCalculatorButtonsWidget(onCalculateFun: onCalculateFun, onClearFun: onClearFun,),
          ],
        ),
      ),
    ) : FactoringResultPage(resultObject: tempReceiptObject.factoringResultObject, goBackFun: updateCalculator,);
  }

}