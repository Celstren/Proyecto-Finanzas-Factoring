import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';

class TIRButtonWidget extends StatelessWidget {
  final Function calculateTIRFun;

  const TIRButtonWidget({Key key, this.calculateTIRFun}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: ScreenUtil.getInstance().setWidth(500),
      height: ScreenUtil.getInstance().setHeight(150),
      margin: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(40), horizontal: ScreenUtil.getInstance().setWidth(40)),
      decoration: BoxDecoration(
          color: FinanzappColorsLightMode.BACKGROUND_COLOR_5,
          borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().setSp(10)))
      ),
      child: FlatButton(
        splashColor: FinanzappColorsLightMode.BACKGROUND_COLOR_6,
        onPressed: () => calculateTIRFun(),
        child: Center(
          child: Text(TIRCalculatorStrings.CALCULATE_TIR, style: FinanzappStyles.commonTextStyle4,),
        ),
      ),
    );
  }
}