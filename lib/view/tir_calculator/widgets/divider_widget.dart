import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DividerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(30), horizontal: ScreenUtil.getInstance().setWidth(10),),
      child: Row(
        children: <Widget>[
          Container(
            child: Text(TIRCalculatorStrings.FORM_TITLE, style: FinanzappStyles.commonTextStyle1,),
          ),
          Flexible(fit: FlexFit.tight, child: Divider(
            height: ScreenUtil.getInstance().setHeight(10),
            thickness: ScreenUtil.getInstance().setSp(5),
          ),
          ),
        ],
      ),
    );
  }

}