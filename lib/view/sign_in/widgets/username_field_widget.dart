import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';

class UsernameFieldWidget extends StatelessWidget{
  final TextEditingController mailController;

  const UsernameFieldWidget({Key key, this.mailController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: ScreenUtil.getInstance().setHeight(150),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Icon(Icons.mail, color: FinanzappColorsLightMode.BACKGROUND_COLOR_7, size: ScreenUtil.getInstance().setWidth(70),),
          ),
          Container(
            margin: EdgeInsets.only(left: ScreenUtil.getInstance().setWidth(50)),
            width: ScreenUtil.getInstance().setWidth(700),
            child: TextField(
              style: FinanzappStyles.commonTextStyle3,
              controller: mailController,
              decoration: InputDecoration(
                hintText: SignInStrings.EMAIL_HINT,
                hintStyle: FinanzappStyles.commonTextStyle3,
              ),
            ),
          ),
        ],
      ),
    );
  }

}