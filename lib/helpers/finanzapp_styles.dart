import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';

class FinanzappStyles {
  static TextStyle titleStyle = TextStyle(fontSize: ScreenUtil.getInstance().setSp(48));
  static TextStyle drawerOptionStyle = TextStyle(fontSize: ScreenUtil.getInstance().setSp(36), color: FinanzappColorsLightMode.SIMPLE_TEXT_WHITE_COLOR);
  static TextStyle simpleTextStyle = TextStyle(fontSize: ScreenUtil.getInstance().setSp(32), color: FinanzappColorsLightMode.MAIN_THEME);
  static TextStyle simpleTextBigFontStyle = TextStyle(fontSize: ScreenUtil.getInstance().setSp(64), color: FinanzappColorsLightMode.MAIN_THEME);
  static TextStyle simpleTextFieldStyle = TextStyle(fontSize: ScreenUtil.getInstance().setSp(48), color: FinanzappColorsLightMode.MAIN_THEME);
  static TextStyle simpleWhiteTextFieldBigFontStyle = TextStyle(fontSize: ScreenUtil.getInstance().setSp(64), color: FinanzappColorsLightMode.SIMPLE_TEXT_WHITE_COLOR);
  static TextStyle equivalenciesTextStyle = TextStyle(fontSize: ScreenUtil.getInstance().setSp(36), color: FinanzappColorsLightMode.MAIN_THEME, fontWeight: FontWeight.w700);
  static TextStyle equivalenciesResultStyle = TextStyle(fontSize: ScreenUtil.getInstance().setSp(64), color: FinanzappColorsLightMode.MAIN_THEME, fontWeight: FontWeight.w700);
  static TextStyle dropDownStyle = TextStyle(fontSize: ScreenUtil.getInstance().setSp(36), color: FinanzappColorsLightMode.MAIN_THEME);
}