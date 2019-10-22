import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';
import 'package:auto_size_text/auto_size_text.dart';

class GivenValueResultWidget extends StatelessWidget {
  final double givenValueAmount;

  const GivenValueResultWidget({Key key, this.givenValueAmount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(40)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: ScreenUtil.getInstance().setWidth(400),
            child: Text(FactoringCalculatorStrings.GIVEN_VALUE_RESULT, style: FinanzappStyles.commonTextStyle3,),
          ),
          Container(
            width: ScreenUtil.getInstance().setWidth(300),
            child: AutoSizeText("\$${givenValueAmount.toStringAsFixed(2)}", style: FinanzappStyles.commonTextStyle3, maxLines: 1, minFontSize: 3,),
          ),
        ],
      ),
    );
  }
}