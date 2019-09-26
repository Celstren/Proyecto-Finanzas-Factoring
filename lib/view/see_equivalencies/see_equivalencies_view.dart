import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/date_constants.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_enums.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';
import 'package:proyecto_finanzas/view/see_equivalencies/widgets/equivalencies_dropdown.dart';
import 'package:proyecto_finanzas/view/see_equivalencies/widgets/equivalencies_list.dart';

class SeeEquivalenciesView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SeeEquivalenciesState();

}

class _SeeEquivalenciesState extends State<SeeEquivalenciesView> {
  FinanceDateEnum financeDateValueSelected = FinanceDateEnum.FINANCE_YEAR;
  FinanceDateEnum newFinanceDateValueSelected = FinanceDateEnum.FINANCE_YEAR;
  FinanceDateEnum targetFinanceDateValueSelected = FinanceDateEnum.FINANCE_YEAR;

  dynamic financeDateSelected = FinanceYear(value: 1);
  dynamic newFinanceDateSelected = FinanceYear(value: 1);

  double quantityOfNewFinanceDateSelected = 1.0, calculatedEquivalency = 1.0;

  TextEditingController newQuantityOfNewFinanceDateSelected = TextEditingController(text: '1');

  bool isExact = false;

  String calculatedResult = "";

  onDefaultEquivalenceSelection(FinanceDateEnum value){
    assert(value != null);
    setState(() {
      financeDateValueSelected = value;
      financeDateSelected = FinanceDateEnum.getFinanceDateFromId(1, value.id);
    });
  }

  onNewEquivalenceSelection(FinanceDateEnum value){
    assert(value != null);
    setState(() {
      newFinanceDateValueSelected = value;
      setDataToNewEquivalence();
      calculateEquivalency();

    });
  }

  setDataToNewEquivalence(){
    newFinanceDateSelected = FinanceDateEnum.getFinanceDateFromId(quantityOfNewFinanceDateSelected, newFinanceDateValueSelected.id);
  }

  onTargetEquivalenceSelection(FinanceDateEnum value){
    assert(value != null);
    setState(() {
      targetFinanceDateValueSelected = value;
      calculateEquivalency();

    });
  }

  calculateEquivalency(){
    if (targetFinanceDateValueSelected.id == FinanceDateEnum.SIX_MONTH_PERIOD.id){
      calculatedEquivalency = newFinanceDateSelected.toSixMonthPeriod(isExact: isExact).value;
      calculatedResult = MainViewStrings.sixMonthPeriodCount(calculatedEquivalency).toUpperCase();
    } else if (targetFinanceDateValueSelected.id == FinanceDateEnum.FOUR_MONTH_PERIOD.id){
      calculatedEquivalency = newFinanceDateSelected.toFourMonthPeriod(isExact: isExact).value;
      calculatedResult = MainViewStrings.fourMonthPeriodCount(calculatedEquivalency).toUpperCase();
    } else if (targetFinanceDateValueSelected.id == FinanceDateEnum.THREE_MONTH_PERIOD.id){
      calculatedEquivalency = newFinanceDateSelected.toThreeMonthPeriod(isExact: isExact).value;
      calculatedResult = MainViewStrings.threeMonthPeriodCount(calculatedEquivalency).toUpperCase();
    } else if (targetFinanceDateValueSelected.id == FinanceDateEnum.TWO_MONTH_PERIOD.id){
      calculatedEquivalency = newFinanceDateSelected.toTwoMonthPeriod(isExact: isExact).value;
      calculatedResult = MainViewStrings.twoMonthPeriodCount(calculatedEquivalency).toUpperCase();
    } else if (targetFinanceDateValueSelected.id == FinanceDateEnum.FINANCE_MONTH.id){
      calculatedEquivalency = newFinanceDateSelected.toFinanceMonth(isExact: isExact).value;
      calculatedResult = MainViewStrings.financeMonthCount(calculatedEquivalency).toUpperCase();
    } else if (targetFinanceDateValueSelected.id == FinanceDateEnum.FIFTEEN_DAY_PERIOD.id){
      calculatedEquivalency = newFinanceDateSelected.toFifteenDayPeriod(isExact: isExact).value;
      calculatedResult = MainViewStrings.fifteenDayPeriodCount(calculatedEquivalency).toUpperCase();
    } else if (targetFinanceDateValueSelected.id == FinanceDateEnum.FINANCE_DAY.id){
      calculatedEquivalency = newFinanceDateSelected.toFinanceDay(isExact: isExact).value;
      calculatedResult = MainViewStrings.financeDayCount(calculatedEquivalency).toUpperCase();
    } else if (targetFinanceDateValueSelected.id == FinanceDateEnum.FINANCE_YEAR.id){
      calculatedEquivalency = newFinanceDateSelected.toFinanceYear(isExact: isExact).value;
      calculatedResult = MainViewStrings.financeYearCount(calculatedEquivalency).toUpperCase();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: ScreenUtil.getInstance().setHeight(50),
        horizontal: ScreenUtil.getInstance().setWidth(10),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: ScreenUtil.getInstance().setHeight(100),
              padding: EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().setWidth(10)),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().setWidth(10)),
                    alignment: Alignment.centerLeft,
                    child: Text(SeeEquivalenciesStrings.BASED_ON_VALUE_SELECTED, style: FinanzappStyles.simpleTextStyle,),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: EquivalenciesDropdown(valueSelected: financeDateValueSelected, onChange: onDefaultEquivalenceSelection),
                  ),
                ],
              ),
            ),
            EquivalenceList(financeDateValueSelected: financeDateValueSelected, financeDateSelected: financeDateSelected),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: ScreenUtil.getInstance().setWidth(700),
                          height: ScreenUtil.getInstance().setHeight(150),
                          padding: EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().setWidth(40)),
                          child: Center(
                            child: TextField(
                              controller: newQuantityOfNewFinanceDateSelected,
                              keyboardType: TextInputType.numberWithOptions(decimal: true),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10),
                                WhitelistingTextInputFormatter.digitsOnly,
                              ],
                              style: FinanzappStyles.simpleTextFieldStyle,
                              decoration: InputDecoration(
                                hintText: SeeEquivalenciesStrings.NEW_EQUIVALENCY_QUANTITY_HINT,
                                hintStyle: FinanzappStyles.simpleTextFieldStyle,
                              ),
                              onChanged: (value){
                                setState(() {
                                  if (value.isNotEmpty){
                                    try {
                                      quantityOfNewFinanceDateSelected = double.parse(value);
                                      setDataToNewEquivalence();
                                      calculateEquivalency();
                                    } catch (e){
                                      quantityOfNewFinanceDateSelected = 1.0;
                                      newQuantityOfNewFinanceDateSelected = TextEditingController(text: '1');
                                    }
                                  } else {
                                    calculatedResult = "";
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: EquivalenciesDropdown(valueSelected: newFinanceDateValueSelected, onChange: onNewEquivalenceSelection),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: ScreenUtil.getInstance().setWidth(700),
                          height: ScreenUtil.getInstance().setHeight(150),
                          padding: EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().setWidth(40)),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            SeeEquivalenciesStrings.CALCULATE_EQUIVALENCY_TO,
                            style: FinanzappStyles.simpleTextFieldStyle,
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: EquivalenciesDropdown(valueSelected: targetFinanceDateValueSelected, onChange: onTargetEquivalenceSelection),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(ScreenUtil.getInstance().setHeight(50)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        isExact = !isExact;
                        calculateEquivalency();
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(ScreenUtil.getInstance().setSp(10)),
                      decoration: BoxDecoration(
                        color: isExact? FinanzappColorsLightMode.SIMPLE_TEXT_GREEN_COLOR : FinanzappColorsLightMode.SIMPLE_TEXT_RED_COLOR,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.check,
                        color: FinanzappColorsLightMode.SIMPLE_TEXT_WHITE_COLOR,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(ScreenUtil.getInstance().setSp(10)),
                    child: Text(SeeEquivalenciesStrings.IS_EXACT, style: FinanzappStyles.simpleTextFieldStyle,),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(80)),
              child: Center(
                child: Text(calculatedResult, style: FinanzappStyles.equivalenciesResultStyle,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}