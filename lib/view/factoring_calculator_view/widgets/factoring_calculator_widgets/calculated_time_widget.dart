import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalculatedTimeWidget extends StatelessWidget {
  final int daysAmount;

  const CalculatedTimeWidget({Key key, this.daysAmount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(50)),
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().setWidth(10)),
      child: Row(
        children: <Widget>[
          Container(
            child: Text(FactoringCalculatorStrings.DAYS_AMOUNT, style: FinanzappStyles.commonTextStyle10,),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Center(
              child: Text(MainViewStrings.financeDayCount(daysAmount.toDouble()), style: FinanzappStyles.commonTextStyle3,),
            ),
          ),
        ],
      ),
    );
  }
}