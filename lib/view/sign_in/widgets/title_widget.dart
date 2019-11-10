import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInTitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(130)),
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: ScreenUtil.getInstance().setWidth(800),
                  child: Text(SignInStrings.TITLE, style: FinanzappStyles.commonTextStyle8, textAlign: TextAlign.center,),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(40)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Icon(Icons.assignment, size: ScreenUtil.getInstance().setSp(400), color: FinanzappColorsLightMode.BACKGROUND_COLOR_7,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}