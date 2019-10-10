import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class InitialOutlayWidget extends StatelessWidget {
  final MoneyMaskedTextController initialOutlayTextEditingController;

  const InitialOutlayWidget({Key key, this.initialOutlayTextEditingController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(20), horizontal: ScreenUtil.getInstance().setWidth(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Text(TIRCalculatorStrings.INITIAL_OUTLAY, style: FinanzappStyles.commonTextStyle1,),
          ),
          Container(
            width: ScreenUtil.getInstance().setWidth(600),
            height: ScreenUtil.getInstance().setHeight(80),
            decoration: BoxDecoration(
              color: FinanzappColorsLightMode.TEXT_COLOR_4,
              borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().setSp(5))),
            ),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().setWidth(10)),
            child: TextField(
              controller: initialOutlayTextEditingController,
              style: FinanzappStyles.commonTextStyle5,
              decoration: InputDecoration.collapsed(hintText: null),
            ),
          ),
        ],
      ),
    );
  }

}