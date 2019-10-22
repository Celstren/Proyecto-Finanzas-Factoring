import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoBackButtonWidget extends StatelessWidget {
  final Function goBackFun;

  const GoBackButtonWidget({Key key, this.goBackFun}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () => goBackFun(false),
      child: Container(
        decoration: BoxDecoration(
          color: FinanzappColorsLightMode.BACKGROUND_COLOR_6,
          borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().setSp(20))),
        ),
        padding: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(40),),
        margin: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(40)),
        width: ScreenUtil.getInstance().setWidth(400),
        child: Center(
          child: Text(FactoringCalculatorStrings.GO_BACK, style: FinanzappStyles.commonTextStyle9,),
        ),
      ),
    );
  }

}