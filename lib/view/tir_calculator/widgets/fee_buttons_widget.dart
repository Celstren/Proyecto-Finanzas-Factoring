import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';

class FeeButtonsWidget extends StatelessWidget {
  final Function addFeeFun;
  final Function removeFeeFun;

  const FeeButtonsWidget({Key key, this.addFeeFun, this.removeFeeFun}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: ScreenUtil.getInstance().setHeight(200),
      child: Row(
        children: <Widget>[
          Flexible(
              fit: FlexFit.tight,
              child: Center(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(40), horizontal: ScreenUtil.getInstance().setWidth(40)),
                  decoration: BoxDecoration(
                    color: FinanzappColorsLightMode.BACKGROUND_COLOR_1,
                    borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().setSp(10)))
                  ),
                  child: FlatButton(
                    splashColor: FinanzappColorsLightMode.BACKGROUND_COLOR_3,
                    onPressed: () => addFeeFun(),
                    child: Center(
                      child: Text(TIRCalculatorStrings.ADD_FEE, style: FinanzappStyles.commonTextStyle4,),
                    ),
                  ),
                ),
              ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(40), horizontal: ScreenUtil.getInstance().setWidth(40)),
                decoration: BoxDecoration(
                    color: FinanzappColorsLightMode.BACKGROUND_COLOR_2,
                    borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().setSp(10)))
                ),
                child: FlatButton(
                  splashColor: FinanzappColorsLightMode.BACKGROUND_COLOR_4,
                  onPressed: () => removeFeeFun(),
                  child: Center(
                    child: Text(TIRCalculatorStrings.REMOVE_FEE, style: FinanzappStyles.commonTextStyle4,),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}