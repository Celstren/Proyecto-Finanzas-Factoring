import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';

class SignInButtonWidget extends StatelessWidget {
  final Function loginProcessFun;
  final bool isLoading;

  const SignInButtonWidget(this.loginProcessFun, this.isLoading,);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(70)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () => loginProcessFun(),
            child: Container(
              decoration: BoxDecoration(
                color: FinanzappColorsLightMode.BACKGROUND_COLOR_7,
                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().setSp(20))),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(35)),
                child: Container(
                  width: ScreenUtil.getInstance().setWidth(820),
                  child: Center(
                    child: this.isLoading? Container(
                      height: ScreenUtil.getInstance().setSp(42),
                      width: ScreenUtil.getInstance().setSp(42),
                      child: CircularProgressIndicator(backgroundColor: FinanzappColorsLightMode.MAIN_BACKGROUND_COLOR, strokeWidth: ScreenUtil.getInstance().setSp(5),),
                    ) : Text(SignInStrings.SIGN_IN, style: FinanzappStyles.commonTextStyle5,),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}