import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_enums.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';
import 'package:proyecto_finanzas/view/factoring_calculator_view/widgets/factoring_calculator_widgets/factoring_equivalencies_dropdown.dart';

class PeriodsWidget extends StatelessWidget {
  final FinanceDateEnum ratePeriod;
  final Function onRateChange;

  const PeriodsWidget({Key key, this.ratePeriod, this.onRateChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: ScreenUtil.getInstance().setWidth(25)),
            child: Text(FactoringCalculatorStrings.PERIODS, style: FinanzappStyles.commonTextStyle10,),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(25), horizontal: ScreenUtil.getInstance().setWidth(25),),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().setSp(20))),
            ),
            child: FactoringEquivalenciesDropdown(valueSelected: ratePeriod, onChange: onRateChange,),
          ),
        ],
      ),
    );
  }

}