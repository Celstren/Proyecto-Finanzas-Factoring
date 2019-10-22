import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/view/factoring_calculator_view/widgets/factoring_calculator_widgets/calculate_button_widget.dart';
import 'package:proyecto_finanzas/view/factoring_calculator_view/widgets/factoring_calculator_widgets/clear_button_widget.dart';

class FactoringCalculatorButtonsWidget extends StatelessWidget {
  final Function onCalculateFun;
  final Function onClearFun;

  const FactoringCalculatorButtonsWidget({Key key, this.onCalculateFun, this.onClearFun}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CalculateButtonWidget(onCalculateFun: onCalculateFun,),
          ClearButtonWidget(onClearFun: onClearFun,),
        ],
      ),
    );
  }

}