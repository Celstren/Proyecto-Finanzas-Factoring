import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/view/tir_calculator/logic/tir_logic.dart';
import 'package:proyecto_finanzas/view/tir_calculator/objects/fee_object.dart';
import 'package:proyecto_finanzas/view/tir_calculator/widgets/divider_widget.dart';
import 'package:proyecto_finanzas/view/tir_calculator/widgets/fee_buttons_widget.dart';
import 'package:proyecto_finanzas/view/tir_calculator/widgets/fee_form_widget.dart';
import 'package:proyecto_finanzas/view/tir_calculator/widgets/initial_outlay_widget.dart';
import 'package:proyecto_finanzas/view/tir_calculator/widgets/tir_button_widget.dart';
import 'package:proyecto_finanzas/view/tir_calculator/widgets/tir_result_widget.dart';
import 'package:proyecto_finanzas/view/tir_calculator/widgets/title_widget.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class TIRCalculatorView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TIRCalculatorState();

}

class TIRCalculatorState extends State<TIRCalculatorView> {
  final MoneyMaskedTextController initialOutlayTextEditingController = MoneyMaskedTextController(leftSymbol: '\$ ', decimalSeparator: ".", thousandSeparator: ",");
  List<FeeObject> feeObjects = [];
  double _tir = 0.00;

  addFee(){
    setState(() {
      feeObjects.add(
        FeeObject(TextEditingController(), MoneyMaskedTextController(leftSymbol: '\$ ', decimalSeparator: ".", thousandSeparator: ","), MoneyMaskedTextController(leftSymbol: '\$ ', decimalSeparator: ".", thousandSeparator: ","))
      );
    });
  }

  removeFee(){
    setState(() {
      if (feeObjects.isNotEmpty){
        feeObjects.removeLast();
      }
    });
  }

  doCalculateTIRFun(){
    if (validateOperation(initialOutlayTextEditingController.numberValue, feeObjects)){
      setState(() {
        _tir = calculateTIR(initialOutlayTextEditingController.numberValue, feeObjects,);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            TitleWidget(text: TIRCalculatorStrings.TITLE,),
            InitialOutlayWidget(initialOutlayTextEditingController: initialOutlayTextEditingController,),
            DividerWidget(),
            FeeFormWidget(feeObjects: feeObjects,),
            FeeButtonsWidget(addFeeFun: addFee, removeFeeFun: removeFee,),
            TIRButtonWidget(calculateTIRFun: doCalculateTIRFun,),
            TIRResultWidget(tirResult: "% ${_tir.toStringAsFixed(2)}",),
          ],
        ),
      ),
    );
  }

}