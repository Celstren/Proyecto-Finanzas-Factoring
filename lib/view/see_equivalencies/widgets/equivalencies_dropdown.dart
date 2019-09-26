import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_enums.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';

class EquivalenciesDropdown extends StatelessWidget {
  final FinanceDateEnum valueSelected;
  final Function onChange;

  final List<FinanceDateEnum> financeDateList = [
    FinanceDateEnum.FINANCE_YEAR,
    FinanceDateEnum.SIX_MONTH_PERIOD,
    FinanceDateEnum.FOUR_MONTH_PERIOD,
    FinanceDateEnum.THREE_MONTH_PERIOD,
    FinanceDateEnum.TWO_MONTH_PERIOD,
    FinanceDateEnum.FINANCE_MONTH,
    FinanceDateEnum.FIFTEEN_DAY_PERIOD,
    FinanceDateEnum.FINANCE_DAY
  ];

  EquivalenciesDropdown({@required this.valueSelected, @required this.onChange}) : assert(valueSelected != null || onChange != null);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
//        color: FinanzappColorsLightMode.MAIN_THEME,
      border: Border.all(color: FinanzappColorsLightMode.MAIN_THEME),
        borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().setSp(10))),
      ),
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().setWidth(20)),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          child: DropdownButton<FinanceDateEnum>(
            isExpanded: true,
            value: valueSelected,
            style: FinanzappStyles.dropDownStyle,
            hint: Text(MainViewStrings.FINANCE_YEAR, style: FinanzappStyles.dropDownStyle,),
            items: financeDateList.map<DropdownMenuItem<FinanceDateEnum>>(
                    (FinanceDateEnum value){
                  return DropdownMenuItem<FinanceDateEnum>(
                    value: value,
                    child: Container(
                      child: Text(value.name, style: FinanzappStyles.dropDownStyle,),
                    ),
                  );
                }
            ).toList(),
            onChanged: (value){
              onChange(value);
            },
          ),
        ),
      ),
    );
  }

}