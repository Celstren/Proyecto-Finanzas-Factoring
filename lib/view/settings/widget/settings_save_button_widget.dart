import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';

class SettingsSaveButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(100)),
      child: Center(
        child: Container(
          height: ScreenUtil.getInstance().setHeight(120),
          decoration: BoxDecoration(
            color: FinanzappColorsLightMode.BACKGROUND_COLOR_7,
            borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().setSp(10))),
          ),
          child: Center(
            child: Text(SettingsStrings.SAVE, style: FinanzappStyles.commonTextStyle5,),
          ),
        ),
      ),
    );
  }

}