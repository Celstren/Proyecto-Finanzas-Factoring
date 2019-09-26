import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';

class CommonWidgets {
  static Widget buildDrawerOptionWidget({String name = "", Function onTapFun}){
    return GestureDetector(
      onTap: () => onTapFun != null? onTapFun() : null,
      child: Container(
        height: ScreenUtil.getInstance().setHeight(200),
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(10)),
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().setWidth(40)),
        child: Text(name, style: FinanzappStyles.drawerOptionStyle,),
      ),
    );
  }
}