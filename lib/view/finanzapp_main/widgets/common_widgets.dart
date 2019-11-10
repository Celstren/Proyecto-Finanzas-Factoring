import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';

class CommonWidgets {
  static Widget buildDrawerOptionWidget<T>({String name = "", IconData iconData, Function onTapFun, bool logout = false}){
    return GestureDetector(
      onTap: () => onTapFun != null? onTapFun<T>(logout) : null,
      child: Container(
        height: ScreenUtil.getInstance().setHeight(150),
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().setWidth(60)),
        child: Row(
          children: <Widget>[
            iconData != null? Container(
              margin: EdgeInsets.only(right: ScreenUtil.getInstance().setWidth(60)),
              child: Icon(iconData, size: ScreenUtil.getInstance().setSp(80), color: FinanzappColorsLightMode.BACKGROUND_COLOR_7,),
            ) : Container(),
            Text(name, style: FinanzappStyles.commonTextStyle6,),
          ],
        ),
      ),
    );
  }
}