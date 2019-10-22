import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';

class AmountWidget extends StatelessWidget {
  final TextEditingController controller;

  const AmountWidget({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(20), horizontal: ScreenUtil.getInstance().setWidth(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Text(FactoringCalculatorStrings.FEE_RECEIPT_AMOUNT, style: FinanzappStyles.commonTextStyle10,),
          ),
          Flexible(
              child: Container(
            height: ScreenUtil.getInstance().setHeight(80),
            decoration: BoxDecoration(
              color: FinanzappColorsLightMode.TEXT_COLOR_4,
              borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().setSp(5))),
            ),
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: ScreenUtil.getInstance().setWidth(40)),
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().setWidth(10)),
            child: TextField(
              controller: controller,
              style: FinanzappStyles.commonTextStyle5,
              keyboardType: TextInputType.number,
              decoration: InputDecoration.collapsed(hintText: null),
            ),
          ),
          ),
        ],
      ),
    );
  }

}