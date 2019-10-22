import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/view/factoring_calculator_view/widgets/factoring_calculator_widgets/rate_type_button_widget.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_enums.dart';

class RateTypeOptionsWidget extends StatelessWidget {
  final Rate typeSelected;
  final Function updateTypeSelected;

  const RateTypeOptionsWidget({Key key, this.typeSelected, this.updateTypeSelected,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RateTypeButtonWidget(title: FactoringCalculatorStrings.NOMINAL_RATE, updateTypeSelected: updateTypeSelected, isSelected: typeSelected == Rate.NOMINAL_RATE, rate:  Rate.NOMINAL_RATE,),
          RateTypeButtonWidget(title: FactoringCalculatorStrings.EFFECTIVE_RATE, updateTypeSelected: updateTypeSelected, isSelected: typeSelected == Rate.EFFECTIVE_RATE, rate:  Rate.EFFECTIVE_RATE,),
        ],
      ),
    );
  }
}