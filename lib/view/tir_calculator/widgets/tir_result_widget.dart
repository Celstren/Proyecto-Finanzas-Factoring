import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';

class TIRResultWidget extends StatelessWidget {
  final String tirResult;

  const TIRResultWidget({Key key, this.tirResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: ScreenUtil.getInstance().setHeight(200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: Center(
              child: Text(TIRCalculatorStrings.INTERNAL_RATE_RETURN_IRR, style: FinanzappStyles.commonTextStyle3,),
            ),
          ),
          Container(
            child: Center(
              child: Text(tirResult, style: FinanzappStyles.commonTextStyle3,),
            ),
          ),
        ],
      ),
    );
  }

}