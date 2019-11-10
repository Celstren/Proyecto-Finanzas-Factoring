import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';
import 'package:proyecto_finanzas/model/data_base/user_model/user.dart';

class ProfileWidget extends StatelessWidget {
  final User user;

  const ProfileWidget(this.user);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(100), horizontal: ScreenUtil.getInstance().setWidth(40)),
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: ScreenUtil.getInstance().setSp(250),
                  width: ScreenUtil.getInstance().setSp(250),
                  decoration: BoxDecoration(
                    color: FinanzappColorsLightMode.BACKGROUND_COLOR_9,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.person, color: FinanzappColorsLightMode.BACKGROUND_COLOR_8,
                      size: ScreenUtil.getInstance().setSp(200),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("${user.nombres} ${user.apellidos}", style: FinanzappStyles.commonTextStyle5,),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(DrawerStrings.TEMP_MAIL, style: FinanzappStyles.commonTextStyle5,),
              ],
            ),
          ),
        ],
      ),
    );
  }

}