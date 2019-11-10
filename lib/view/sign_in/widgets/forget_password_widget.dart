import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: ScreenUtil.getInstance().setWidth(820),
      margin: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(40)),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          child: Text(SignInStrings.FORGET_PASSWORD, style: FinanzappStyles.commonTextStyle1,),
        ),
      ),
    );
  }

}