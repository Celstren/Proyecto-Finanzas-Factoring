import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_enums.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';

class EquivalenceList extends StatelessWidget {
  final FinanceDateEnum financeDateValueSelected;

  final dynamic financeDateSelected;

  EquivalenceList({@required this.financeDateValueSelected, @required this.financeDateSelected}) : assert(financeDateValueSelected != null || financeDateSelected != null);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().setWidth(20), vertical: ScreenUtil.getInstance().setHeight(50)),
      child: Column(
        children: <Widget>[
          Container(
            height: ScreenUtil.getInstance().setHeight(70),
            alignment: Alignment.centerLeft,
            child: Text(SeeEquivalenciesStrings.DEFAULT_EQUIVALENCY_QUANTITY.toString() +
                " " + financeDateValueSelected.name.toLowerCase() +
                " " + SeeEquivalenciesStrings.EQUIVALENCE_TO +
                " " + MainViewStrings.financeYearCount(financeDateSelected.toFinanceYear().value).toLowerCase(),
              style: FinanzappStyles.commonTextStyle6,
            ),
          ),
          Container(
            height: ScreenUtil.getInstance().setHeight(70),
            alignment: Alignment.centerLeft,
            child: Text(SeeEquivalenciesStrings.DEFAULT_EQUIVALENCY_QUANTITY.toString() +
                " " + financeDateValueSelected.name.toLowerCase() +
                " " + SeeEquivalenciesStrings.EQUIVALENCE_TO +
                " " + MainViewStrings.sixMonthPeriodCount(financeDateSelected.toSixMonthPeriod().value).toLowerCase(),
              style: FinanzappStyles.commonTextStyle6,
            ),
          ),
          Container(
            height: ScreenUtil.getInstance().setHeight(70),
            alignment: Alignment.centerLeft,
            child: Text(SeeEquivalenciesStrings.DEFAULT_EQUIVALENCY_QUANTITY.toString() +
                " " + financeDateValueSelected.name.toLowerCase() +
                " " + SeeEquivalenciesStrings.EQUIVALENCE_TO +
                " " + MainViewStrings.fourMonthPeriodCount(financeDateSelected.toFourMonthPeriod().value).toLowerCase(),
              style: FinanzappStyles.commonTextStyle6,
            ),
          ),
          Container(
            height: ScreenUtil.getInstance().setHeight(70),
            alignment: Alignment.centerLeft,
            child: Text(SeeEquivalenciesStrings.DEFAULT_EQUIVALENCY_QUANTITY.toString() +
                " " + financeDateValueSelected.name.toLowerCase() +
                " " + SeeEquivalenciesStrings.EQUIVALENCE_TO +
                " " + MainViewStrings.threeMonthPeriodCount(financeDateSelected.toThreeMonthPeriod().value).toLowerCase(),
              style: FinanzappStyles.commonTextStyle6,),
          ),
          Container(
            height: ScreenUtil.getInstance().setHeight(70),
            alignment: Alignment.centerLeft,
            child: Text(SeeEquivalenciesStrings.DEFAULT_EQUIVALENCY_QUANTITY.toString() +
                " " + financeDateValueSelected.name.toLowerCase() +
                " " + SeeEquivalenciesStrings.EQUIVALENCE_TO +
                " " + MainViewStrings.twoMonthPeriodCount(financeDateSelected.toTwoMonthPeriod().value).toLowerCase(),
              style: FinanzappStyles.commonTextStyle6,),
          ),
          Container(
            height: ScreenUtil.getInstance().setHeight(70),
            alignment: Alignment.centerLeft,
            child: Text(SeeEquivalenciesStrings.DEFAULT_EQUIVALENCY_QUANTITY.toString() +
                " " + financeDateValueSelected.name.toLowerCase() +
                " " + SeeEquivalenciesStrings.EQUIVALENCE_TO +
                " " + MainViewStrings.financeMonthCount(financeDateSelected.toFinanceMonth().value).toLowerCase(),
              style: FinanzappStyles.commonTextStyle6,),
          ),
          Container(
            height: ScreenUtil.getInstance().setHeight(70),
            alignment: Alignment.centerLeft,
            child: Text(SeeEquivalenciesStrings.DEFAULT_EQUIVALENCY_QUANTITY.toString() +
                " " + financeDateValueSelected.name.toLowerCase() +
                " " + SeeEquivalenciesStrings.EQUIVALENCE_TO +
                " " + MainViewStrings.fifteenDayPeriodCount(financeDateSelected.toFifteenDayPeriod().value).toLowerCase(),
              style: FinanzappStyles.commonTextStyle6,),
          ),
          Container(
            height: ScreenUtil.getInstance().setHeight(70),
            alignment: Alignment.centerLeft,
            child: Text(SeeEquivalenciesStrings.DEFAULT_EQUIVALENCY_QUANTITY.toString() +
                " " + financeDateValueSelected.name.toLowerCase() +
                " " + SeeEquivalenciesStrings.EQUIVALENCE_TO +
                " " + MainViewStrings.financeDayCount(financeDateSelected.toFinanceDay().value).toLowerCase(),
              style: FinanzappStyles.commonTextStyle6,),
          ),
        ],
      ),
    );
  }

}