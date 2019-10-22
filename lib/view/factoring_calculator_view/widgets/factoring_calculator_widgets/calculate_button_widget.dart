import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';

class CalculateButtonWidget extends StatelessWidget {
  final Function onCalculateFun;

  const CalculateButtonWidget({Key key, this.onCalculateFun}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () => onCalculateFun(),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(50)),
        padding: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(25)),
        width: ScreenUtil.getInstance().setWidth(450),
        decoration: BoxDecoration(
          color: FinanzappColorsLightMode.BACKGROUND_COLOR_3,
          borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().setSp(10))),
        ),
        child: Center(
          child: Text(FactoringCalculatorStrings.CALCULATE, style: FinanzappStyles.commonTextStyle5,),
        ),
      ),
    );
  }
}