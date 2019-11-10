import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';

class SettingsCurrencyWidget extends StatelessWidget {
  final int currencyOptionSelected;
  final Function updateCurrencySelected;

  const SettingsCurrencyWidget(this.currencyOptionSelected, this.updateCurrencySelected);

  @override
  Widget build(BuildContext context) {

    BoxDecoration _selectedDecoration = BoxDecoration(
      color: FinanzappColorsLightMode.BACKGROUND_COLOR_1,
      borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().setSp(10))),
    );
    BoxDecoration _decoration = BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().setSp(10))),
      border: Border.all(color: FinanzappColorsLightMode.BACKGROUND_COLOR_7, width: ScreenUtil.getInstance().setSp(1)),
    );

    TextStyle _selectedTextStyle = FinanzappStyles.commonTextStyle5;
    TextStyle _textStyle = FinanzappStyles.commonTextStyle10;

    // TODO: implement build
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () => updateCurrencySelected(0),
            child: Container(
              height: ScreenUtil.getInstance().setHeight(100),
              width: ScreenUtil.getInstance().setWidth(400),
              decoration: currencyOptionSelected == 0? _selectedDecoration : _decoration,
              child: Center(
                child: Text(SettingsStrings.DOLLAR_CURRENCIES, style: currencyOptionSelected == 0? _selectedTextStyle : _textStyle,),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => updateCurrencySelected(1),
            child: Container(
              height: ScreenUtil.getInstance().setHeight(100),
              width: ScreenUtil.getInstance().setWidth(400),
              decoration: currencyOptionSelected == 1? _selectedDecoration : _decoration,
              child: Center(
                child: Text(SettingsStrings.PEN_CURRENCIES, style: currencyOptionSelected == 1? _selectedTextStyle : _textStyle,),
              ),
            ),
          ),
        ],
      ),
    );
  }

}