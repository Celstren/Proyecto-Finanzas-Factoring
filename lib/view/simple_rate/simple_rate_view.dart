import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_enums.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';
import 'package:proyecto_finanzas/view/simple_rate/widgets/simple_rate_tile.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class SimpleRateView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SimpleRateState();

}

class _SimpleRateState extends State<SimpleRateView> {

  var costTextController = MoneyMaskedTextController(leftSymbol: '\$ ', decimalSeparator: ".", thousandSeparator: ",");
  var stockTextController = MoneyMaskedTextController(leftSymbol: '\$ ', decimalSeparator: ".", thousandSeparator: ",");
  var rateTextController = MoneyMaskedTextController(leftSymbol: '% ', decimalSeparator: ".");

  SimpleRateEnum valueSelected = SimpleRateEnum.STOCK;

  List<SimpleRateEnum> simpleRateEnumList = [
    SimpleRateEnum.COST,
    SimpleRateEnum.RATE,
    SimpleRateEnum.STOCK
  ];

  double result = 0.0;

  updateStateWithEvent(Function event){
    setState(() {
      event();
    });
  }

  calculateMissingValue(){
    if (valueSelected.id == SimpleRateEnum.COST.id){
      costTextController.updateValue(stockTextController.numberValue / (1 + ((rateTextController.numberValue != 0? rateTextController.numberValue : 1) / 100)));
    } else if (valueSelected.id == SimpleRateEnum.RATE.id){
      rateTextController.updateValue(((stockTextController.numberValue - costTextController.numberValue) / (costTextController.numberValue != 0? costTextController.numberValue : 1)) * 100);
    } else {
      stockTextController.updateValue(costTextController.numberValue * (1 + (rateTextController.numberValue / 100)));
    }
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: ScreenUtil.getInstance().setHeight(200),
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().setWidth(50)),
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(10)),
                  child: Text(SimpleRateStrings.CALCULATE_VALUE_OF, style: FinanzappStyles.simpleTextFieldStyle,),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    decoration: BoxDecoration(
//                      color: FinanzappColorsLightMode.SIMPLE_TEXT_WHITE_COLOR,
                      border: Border.all(color: FinanzappColorsLightMode.MAIN_THEME),
                      borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().setSp(10))),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().setWidth(50)),
                    margin: EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().setWidth(30)),
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        child: DropdownButton<SimpleRateEnum>(
                          isExpanded: true,
                          value: valueSelected,
                          style: FinanzappStyles.dropDownStyle,
                          hint: Text(MainViewStrings.FINANCE_YEAR, style: FinanzappStyles.dropDownStyle,),
                          items: simpleRateEnumList.map<DropdownMenuItem<SimpleRateEnum>>(
                                  (SimpleRateEnum value){
                                return DropdownMenuItem<SimpleRateEnum>(
                                  value: value,
                                  child: Container(
                                    child: Text(value.name, style: FinanzappStyles.dropDownStyle,),
                                  ),
                                );
                              }
                          ).toList(),
                          onChanged: (value){
                            setState(() {
                              valueSelected = value;
                              if (valueSelected.id == SimpleRateEnum.COST.id){
                                costTextController = MoneyMaskedTextController(leftSymbol: '\$ ', decimalSeparator: ".", thousandSeparator: ",");
                              } else if (valueSelected.id == SimpleRateEnum.RATE.id){
                                rateTextController = MoneyMaskedTextController(leftSymbol: '% ', decimalSeparator: ".");
                              } else {
                                stockTextController = MoneyMaskedTextController(leftSymbol: '\$ ', decimalSeparator: ".", thousandSeparator: ",");
                              }
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SimpleRateTile(SimpleRateStrings.COST, SimpleRateStrings.DEFAULT_VALUE, valueSelected.id == SimpleRateEnum.COST.id, costTextController),
          SimpleRateTile(SimpleRateStrings.RATE, SimpleRateStrings.DEFAULT_VALUE, valueSelected.id == SimpleRateEnum.RATE.id, rateTextController),
          SimpleRateTile(SimpleRateStrings.STOCK, SimpleRateStrings.DEFAULT_VALUE, valueSelected.id == SimpleRateEnum.STOCK.id, stockTextController),
          Container(
            child: Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().setWidth(250)),
                padding: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(40)),
                child: FlatButton(
                  highlightColor: Colors.lightBlueAccent,
                  splashColor: Colors.lightBlue,
                  color: Colors.blueGrey,
                  child: Center(
                    child: Text(SimpleRateStrings.CALCULATE.toUpperCase(), style: FinanzappStyles.simpleWhiteTextFieldBigFontStyle,),
                  ),
                  onPressed: (){
                    calculateMissingValue();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}