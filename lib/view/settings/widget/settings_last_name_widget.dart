import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';

class SettingsLastNameWidget extends StatelessWidget {
  final TextEditingController lastNameController;

  const SettingsLastNameWidget({Key key, this.lastNameController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(40)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Icon(Icons.person, color: FinanzappColorsLightMode.BACKGROUND_COLOR_8, size: ScreenUtil.getInstance().setWidth(100),),
          ),
          Container(
            width:  ScreenUtil.getInstance().setWidth(750),
            child: TextField(
              controller: lastNameController,
              style: FinanzappStyles.commonTextStyle3,
              decoration: InputDecoration(
                hintText: SettingsStrings.TEMP_LAST_NAME_HINT,
                hintStyle: FinanzappStyles.commonTextStyle3,
              ),
            ),
          ),
        ],
      ),
    );
  }

}