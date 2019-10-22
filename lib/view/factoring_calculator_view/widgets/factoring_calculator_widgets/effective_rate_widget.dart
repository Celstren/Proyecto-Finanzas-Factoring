import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';

class EffectiveRateWidget extends StatelessWidget {
  final MoneyMaskedTextController rateAmountController;

  const EffectiveRateWidget({Key key, this.rateAmountController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: ScreenUtil.getInstance().setWidth(25)),
            child: Text(FactoringCalculatorStrings.RATE_AMOUNT, style: FinanzappStyles.commonTextStyle10,),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(25), horizontal: ScreenUtil.getInstance().setWidth(25),),
            padding: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(50), horizontal: ScreenUtil.getInstance().setWidth(75),),
            decoration: BoxDecoration(
              color: FinanzappColorsLightMode.BACKGROUND_COLOR_7,
              borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().setSp(10))),
            ),
            child: TextField(
              controller: rateAmountController,
              style: FinanzappStyles.commonTextStyle5,
              keyboardType: TextInputType.number,
              decoration: InputDecoration.collapsed(hintText: null),
            ),
          ),
        ],
      ),
    );
  }

}