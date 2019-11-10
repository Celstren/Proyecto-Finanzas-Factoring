import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';

class SettingsFormatWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(40)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Text(SettingsStrings.ENABLE_PERU_STANDARD, style: FinanzappStyles.commonTextStyle3,),
          ),
          Container(
            child: Icon(Icons.check_circle_outline, size: ScreenUtil.getInstance().setSp(80),),
          ),
        ],
      ),
    );
  }

}