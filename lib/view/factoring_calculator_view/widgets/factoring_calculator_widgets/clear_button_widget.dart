import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';

class ClearButtonWidget extends StatelessWidget {
  final Function onClearFun;

  const ClearButtonWidget({Key key, this.onClearFun}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () => onClearFun(),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(50)),
        padding: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(25)),
        width: ScreenUtil.getInstance().setWidth(450),
        decoration: BoxDecoration(
          color: FinanzappColorsLightMode.BACKGROUND_COLOR_5,
          borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().setSp(10))),
        ),
        child: Center(
          child: Text(FactoringCalculatorStrings.CLEAR, style: FinanzappStyles.commonTextStyle5,),
        ),
      ),
    );
  }

}