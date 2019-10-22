import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_enums.dart';

class RateTypeButtonWidget extends StatelessWidget {
  final String title;
  final Function updateTypeSelected;
  final bool isSelected;
  final Rate rate;

  const RateTypeButtonWidget(
      {Key key,
      this.title,
      this.updateTypeSelected,
      this.isSelected,
      this.rate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () => updateTypeSelected(rate),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(20), horizontal: ScreenUtil.getInstance().setWidth(50),),
        decoration: BoxDecoration(
            color: isSelected
                ? FinanzappColorsLightMode.BACKGROUND_COLOR_7
                : FinanzappColorsLightMode.MAIN_BACKGROUND_COLOR,
            border: isSelected? null : Border.all(color: FinanzappColorsLightMode.BACKGROUND_COLOR_7, width: ScreenUtil.getInstance().setSp(1)),
            borderRadius: BorderRadius.all(
                Radius.circular(ScreenUtil.getInstance().setSp(10)))),
        child: Center(
          child: Text(
            title,
            style: isSelected
                ? FinanzappStyles.commonTextStyle5
                : FinanzappStyles.commonTextStyle10,
          ),
        ),
      ),
    );
  }
}
