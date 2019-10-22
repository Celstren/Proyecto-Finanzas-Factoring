import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';
import 'package:proyecto_finanzas/view/factoring_calculator_view/objects/factoring_objects.dart';

class CostWidget extends StatelessWidget {
  final int index;
  final CostObject cost;
  final Function deleteAtFun;

  const CostWidget({Key key, this.cost, this.deleteAtFun, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: ScreenUtil.getInstance().setHeight(150),
      padding: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(20), horizontal: ScreenUtil.getInstance().setWidth(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: ScreenUtil.getInstance().setWidth(600),
            child: TextField(
              controller: cost.nameController,
              style: FinanzappStyles.commonTextStyle10,
              decoration: InputDecoration(hintText: FactoringCalculatorStrings.COST_HINT),
            ),
          ),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: FinanzappColorsLightMode.TEXT_COLOR_4,
                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().setSp(5))),
              ),
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: ScreenUtil.getInstance().setWidth(40)),
              padding: EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().setWidth(10)),
              child: TextField(
                controller: cost.amountController,
                style: FinanzappStyles.commonTextStyle5,
                keyboardType: TextInputType.number,
                decoration: InputDecoration.collapsed(hintText: null),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => deleteAtFun(index),
            child: Center(
              child: Icon(Icons.delete, size: ScreenUtil.getInstance().setSp(100),),
            ),
          ),
        ],
      ),
    );
  }

}