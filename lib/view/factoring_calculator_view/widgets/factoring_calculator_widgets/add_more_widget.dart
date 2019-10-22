import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';

class AddMoreWidget extends StatelessWidget {
  final Function onAddFun;

  const AddMoreWidget({Key key, this.onAddFun}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: ScreenUtil.getInstance().setWidth(350),
      child: GestureDetector(
        onTap: () => onAddFun(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().setWidth(50), vertical: ScreenUtil.getInstance().setHeight(25)),
          decoration: BoxDecoration(
            color: FinanzappColorsLightMode.BACKGROUND_COLOR_1,
            borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().setSp(10))),
          ),
          child: Center(
            child: Text(FactoringCalculatorStrings.ADD_MORE, style: FinanzappStyles.commonTextStyle5,),
          ),
        ),
      ),
    );
  }

}