import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterButtonWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(150)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: FinanzappColorsLightMode.BACKGROUND_COLOR_7,
              borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().setSp(25))),
            ),
            padding: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(30)),
            width: ScreenUtil.getInstance().setWidth(800),
            child: Center(
              child: Text(RegisterStrings.REGISTER, style: FinanzappStyles.commonTextStyle9,),
            ),
          ),
        ],
      ),
    );
  }

}