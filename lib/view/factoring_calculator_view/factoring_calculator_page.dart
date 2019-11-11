import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/model/data_base/shared_preference_data.dart';
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
  final int currentType;

  const FactoringCalculatorPage({Key key, this.receiptObject, this.currentType = 0}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FactoringCalculatorPageState();
  }
}

class _FactoringCalculatorPageState extends State<FactoringCalculatorPage>{

  MoneyMaskedTextController amountTextEditingController = MoneyMaskedTextController(leftSymbol: '\$ ', decimalSeparator: ".", thousandSeparator: ",");
  MoneyMaskedTextController rateAmountController = MoneyMaskedTextController(rightSymbol: '%', decimalSeparator: ".", thousandSeparator: ",");
  List<CostObject> costs = [];
  List<PaymentObject> payments = [];
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  Rate rateSelected = Rate.NOMINAL_RATE;
  FinanceDateEnum capitalizationPeriod = FinanceDateEnum.FINANCE_DAY;
  FinanceDateEnum ratePeriod = FinanceDateEnum.FINANCE_DAY;
  FactoringResultObject resultObject = FactoringResultObject(0, 0, 0, 0, 0, 0);
  bool showResult = false;
  int yearDates = 360;
  int currencyType = 0;

  setInitialData(){
    SharedPreferenceData.getYearDates().then((_yearDate){
      SharedPreferenceData.getCurrencySelected().then((_currencyType){
        if (mounted){
          setState(() {
            yearDates = _yearDate != null? _yearDate : 360;
            currencyType = _currencyType != null? _currencyType : 0;
          });
        }
      });
    });
  }

  updateStartDate(DateTime newStartDate){
    setState(() {
      startDate = newStartDate;
    });
  }

  updateEndDate(DateTime newEndDate){
    setState(() {
      endDate = newEndDate;
    });
  }

  updateTypeSelected(Rate newRate){
    setState(() {
      rateSelected = newRate;
    });
  }

  updateCapitalizationPeriod(FinanceDateEnum newCapitalizationPeriod){
    setState(() {
      capitalizationPeriod = newCapitalizationPeriod;
    });
  }

  updateRatePeriod(FinanceDateEnum newRatePeriod){
    setState(() {
      ratePeriod = newRatePeriod;
    });
  }

  deleteCostAt(int index){
    setState(() {
      costs.removeAt(index);
    });
  }

  addCost(){
    setState(() {
      costs.add(new CostObject(new TextEditingController(), new MoneyMaskedTextController(leftSymbol: '\$ ', decimalSeparator: ".", thousandSeparator: ",")));
    });
  }

  deletePaymentAt(int index){
    setState(() {
      payments.removeAt(index);
    });
  }

  addPayment(){
    setState(() {
      payments.add(new PaymentObject(new TextEditingController(), new MoneyMaskedTextController(leftSymbol: '\$ ', decimalSeparator: ".", thousandSeparator: ",")));
    });
  }

  bool validateCalculations(){
    if (endDate.difference(startDate).inDays < 0){
      Fluttertoast.showToast(msg: FactoringCalculatorStrings.ERROR_MESSAGE1);
      return false;
    } else if (rateAmountController.numberValue == 0){
      Fluttertoast.showToast(msg: FactoringCalculatorStrings.ERROR_MESSAGE2);
      return false;
    }
    return true;
  }

  onCalculateFun(){
    if (validateCalculations()){
      bool isNominalRate = rateSelected == Rate.NOMINAL_RATE;
      if (isNominalRate){


        double capitalizationDays =  FinanceDateEnum.getFinanceDateFromId(1, capitalizationPeriod.id).toFinanceDay(isExact: false).value;
        //Day Net difference
        //int difDays = endDate.difference(startDate).inDays;

        int difDays = endDate.difference(startDate).inDays;

        double m = FinanceDateEnum.getFinanceDateFromId(1, ratePeriod.id).toFinanceDay(isExact: false).value / capitalizationDays;
        double n = difDays / capitalizationDays;


        resultObject = calculateResults(costs, payments, rateAmountController.numberValue / 100, m, n, isNominalRate, amountTextEditingController.numberValue, difDays);
      } else {
        //Day Net difference
        //int difDays = endDate.difference(startDate).inDays;

        int difDays = endDate.difference(startDate).inDays;

        double m = FinanceDateEnum.getFinanceDateFromId(1, ratePeriod.id).toFinanceDay(isExact: false).value;

        resultObject = calculateResults(costs, payments, rateAmountController.numberValue / 100, m, 1.0, isNominalRate, amountTextEditingController.numberValue, difDays);
      }
      widget.receiptObject.amount = amountTextEditingController.numberValue;
      widget.receiptObject.factoringResultObject = resultObject;
      widget.receiptObject.discountDate = startDate;
      widget.receiptObject.expirationDate = endDate;
      widget.receiptObject.amountTextEditingController = amountTextEditingController;
      widget.receiptObject.rateAmountController = rateAmountController;
      widget.receiptObject.costs = costs;
      widget.receiptObject.payments = payments;
      widget.receiptObject.rateSelected = rateSelected;
      widget.receiptObject.capitalizationPeriod = capitalizationPeriod;
      widget.receiptObject.ratePeriod = ratePeriod;

      updateCalculator(true);
    }
  }

  onClearFun(){
    setState(() {
      amountTextEditingController = MoneyMaskedTextController(leftSymbol: '\$ ', decimalSeparator: ".", thousandSeparator: ",");
      rateAmountController = MoneyMaskedTextController(rightSymbol: '%', decimalSeparator: ".", thousandSeparator: ",");
      costs = [];
      payments = [];
      startDate = DateTime.now();
      endDate = DateTime.now();
      rateSelected = Rate.NOMINAL_RATE;
      capitalizationPeriod = FinanceDateEnum.FINANCE_DAY;
      ratePeriod = FinanceDateEnum.FINANCE_DAY;
      resultObject = null;
      widget.receiptObject.clear();
    });
  }

  updateCalculator(bool newValue){
    setState(() {
      showResult = !showResult;
    });
  }

  double calculateVariation(double amount, double variation){
    return double.parse((amount * variation).toStringAsFixed(2));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    endDate = widget.receiptObject.expirationDate;
    startDate = widget.receiptObject.discountDate;
    resultObject = widget.receiptObject.factoringResultObject;
    rateSelected = widget.receiptObject.rateSelected;
    capitalizationPeriod = widget.receiptObject.capitalizationPeriod;
    ratePeriod = widget.receiptObject.ratePeriod;
    if (widget.currentType == 0){
      amountTextEditingController = MoneyMaskedTextController(leftSymbol: '\$ ', decimalSeparator: ".", thousandSeparator: ",", initialValue: widget.receiptObject.amountTextEditingController.numberValue);
    } else {
      amountTextEditingController = MoneyMaskedTextController(leftSymbol: 's/. ', decimalSeparator: ".", thousandSeparator: ",", initialValue: widget.receiptObject.amountTextEditingController.numberValue);
    }
    rateAmountController.updateValue(widget.receiptObject.rateAmountController.numberValue);
    widget.receiptObject.costs.forEach((cost){
      costs.add(cost);
    });
    widget.receiptObject.payments.forEach((payment){
      payments.add(payment);
    });
    currencyType = widget.currentType;
    setInitialData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return !showResult? Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FactoringDividerWidget(text: FactoringCalculatorStrings.AMOUNT,),
            AmountWidget(controller: amountTextEditingController,),
            FactoringDividerWidget(text: FactoringCalculatorStrings.TIME,),
            DatePickerWidget(date: startDate, title: FactoringCalculatorStrings.START_DATE, updateDate: updateStartDate,),
            DatePickerWidget(date: endDate, title: FactoringCalculatorStrings.END_DATE, updateDate: updateEndDate,),
            CalculatedTimeWidget(daysAmount: endDate.difference(startDate).inDays,),
            FactoringDividerWidget(text: FactoringCalculatorStrings.RATE,),
            RateTypeOptionsWidget(typeSelected: rateSelected, updateTypeSelected: updateTypeSelected,),
            RateWidget(rate: rateSelected, rateAmountController: rateAmountController, capitalizationPeriod: capitalizationPeriod, ratePeriod: ratePeriod, onCapitalizationChange: updateCapitalizationPeriod, onRateChange: updateRatePeriod,),
            FactoringDividerWidget(text: FactoringCalculatorStrings.COSTS,),
            CostsWidget(costs: costs, onAddFun: addCost, onDeleteFun: deleteCostAt,),
            FactoringDividerWidget(text: FactoringCalculatorStrings.PAYMENTS,),
            PaymentsWidget(payments: payments, onAddFun: addPayment, onDeleteFun: deletePaymentAt,),
            FactoringCalculatorButtonsWidget(onCalculateFun: onCalculateFun, onClearFun: onClearFun,),
          ],
        ),
      ),
    ) : FactoringResultPage(resultObject: resultObject, goBackFun: updateCalculator,);
  }

}