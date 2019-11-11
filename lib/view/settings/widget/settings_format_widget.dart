import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';

class SettingsFormatWidget extends StatelessWidget {
  final Function updateYearDatesFormat;
  final bool peruStandard;

  const SettingsFormatWidget(this.updateYearDatesFormat, this.peruStandard);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(40)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Text(SettingsStrings.DISABLE_PERU_STANDARD, style: FinanzappStyles.commonTextStyle3,),
          ),
          GestureDetector(
            onTap: () => updateYearDatesFormat(!peruStandard),
            child: Container(
              child: Icon(Icons.check_circle_outline, size: ScreenUtil.getInstance().setSp(80), color: peruStandard? FinanzappColorsLightMode.BACKGROUND_COLOR_1 : FinanzappColorsLightMode.BACKGROUND_COLOR_7,),
            ),
          ),
        ],
      ),
    );
  }

}