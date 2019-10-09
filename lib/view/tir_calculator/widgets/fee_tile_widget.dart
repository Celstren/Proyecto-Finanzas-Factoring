import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';
import 'package:proyecto_finanzas/view/tir_calculator/objects/fee_object.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';

class FeeTileWidget extends StatelessWidget {
  final FeeObject feeObject;

  const FeeTileWidget({Key key, this.feeObject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: FinanzappColorsLightMode.MAIN_THEME, width: ScreenUtil.getInstance().setSp(1))),
      ),
      height: ScreenUtil.getInstance().setHeight(100),
      child: Row(
        children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            child: Center(
              child: TextField(
                controller: feeObject.timeController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.numberWithOptions(),
                inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                style: FinanzappStyles.commonTextStyle1,
                decoration: InputDecoration.collapsed(hintText: TIRCalculatorStrings.TIME_HINT, hintStyle: FinanzappStyles.commonTextStyle1,),
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Center(
              child: TextField(
                controller: feeObject.chargeController,
                textAlign: TextAlign.center,
                style: FinanzappStyles.commonTextStyle1,
                decoration: InputDecoration.collapsed(),
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Center(
              child: TextField(
                controller: feeObject.paymentController,
                textAlign: TextAlign.center,
                style: FinanzappStyles.commonTextStyle1,
                decoration: InputDecoration.collapsed(),
              ),
            ),
          ),
        ],
      ),
    );
  }

}