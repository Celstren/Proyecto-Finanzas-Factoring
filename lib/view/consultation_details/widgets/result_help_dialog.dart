import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';

class ResultHelpDialogWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      title: Container(
        width: ScreenUtil.getInstance().setWidth(400),
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().setWidth(20), vertical: ScreenUtil.getInstance().setHeight(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              child: Center(
                child: Text(CalculationDetailsString.RESULT_HELP_DIALOG_TITLE, style: FinanzappStyles.commonTextStyle3,textAlign: TextAlign.center),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(20)),
                child: Center(
                  child: Icon(Icons.close, size: ScreenUtil.getInstance().setSp(80),),
                ),
              ),
            ),
          ],
        ),
      ),
      content: Container(
        height: ScreenUtil.getInstance().setHeight(1000),
        width: ScreenUtil.getInstance().setWidth(400),
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().setSp(80)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(CalculationDetailsString.RESULT_HELP_DIALOG_DISCOUNT, style: FinanzappStyles.commonTextStyle1, textAlign: TextAlign.justify,),
            Text(CalculationDetailsString.RESULT_HELP_DIALOG_NET_VALUE, style: FinanzappStyles.commonTextStyle1, textAlign: TextAlign.justify,),
            Text(CalculationDetailsString.RESULT_HELP_DIALOG_RECEIVED_VALUE, style: FinanzappStyles.commonTextStyle1, textAlign: TextAlign.justify,),
            Text(CalculationDetailsString.RESULT_HELP_DIALOG_GIVEN_VALUE, style: FinanzappStyles.commonTextStyle1, textAlign: TextAlign.justify,),
            Text(CalculationDetailsString.RESULT_HELP_DIALOG_TCEA, style: FinanzappStyles.commonTextStyle1, textAlign: TextAlign.justify,),
          ],
        ),
      ),
    );
  }

}