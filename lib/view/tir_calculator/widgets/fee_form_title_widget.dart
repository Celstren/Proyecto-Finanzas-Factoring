import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeeFormTitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: ScreenUtil.getInstance().setHeight(100),
      decoration: BoxDecoration(
        color: FinanzappColorsLightMode.MAIN_THEME,
      ),
      child: Row(
        children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            child: Center(
              child: Text(
                MainViewStrings.FINANCE_YEAR,
                style: FinanzappStyles.commonTextStyle5,
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Center(
              child: Text(
                TIRCalculatorStrings.CHARGE,
                style: FinanzappStyles.commonTextStyle5,
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Center(
              child: Text(
                TIRCalculatorStrings.PAYMENT,
                style: FinanzappStyles.commonTextStyle5,
              ),
            ),
          ),
        ],
      ),
    );
  }

}