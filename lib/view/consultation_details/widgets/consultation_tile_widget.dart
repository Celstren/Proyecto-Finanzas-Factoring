import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';
import 'package:proyecto_finanzas/view/history/objects/receipt_object.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ConsultationTileWidget extends StatelessWidget {
  final ReceiptObject receiptObject;
  final Function selectReceiptObject;

  const ConsultationTileWidget({Key key, this.receiptObject, this.selectReceiptObject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () => selectReceiptObject(receiptObject),
      child: Container(
        height: ScreenUtil.getInstance().setHeight(300),
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().setWidth(50)),
        child: Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: FinanzappColorsLightMode.BACKGROUND_COLOR_8, width: ScreenUtil.getInstance().setHeight(.75))),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(receiptObject.receiptName.value.text, style: FinanzappStyles.commonTextStyle3,),
                  ),
                  Container(
                    width: ScreenUtil.getInstance().setWidth(600),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("${CalculationDetailsString.NET_AMOUNT}", style: FinanzappStyles.commonTextStyle1,),
                        Text("${receiptObject.amount}", style: FinanzappStyles.commonTextStyle1,),
                      ],
                    ),
                  ),
                  Container(
                    width: ScreenUtil.getInstance().setWidth(600),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("${CalculationDetailsString.EXPIRATION_DATE}", style: FinanzappStyles.commonTextStyle11,),
                        Text("${DateFormat("dd/MM/yyyy").format(receiptObject.expirationDate)}", style: FinanzappStyles.commonTextStyle11,),
                      ],
                    ),
                  ),
                  Container(
                    width: ScreenUtil.getInstance().setWidth(600),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("${CalculationDetailsString.DISCOUNT_DATE}", style: FinanzappStyles.commonTextStyle11,),
                        Text("${DateFormat("dd/MM/yyyy").format(receiptObject.discountDate)}", style: FinanzappStyles.commonTextStyle11,),
                      ],
                    ),
                  ),
                  Container(
                    width: ScreenUtil.getInstance().setWidth(600),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("${CalculationDetailsString.RATE}", style: FinanzappStyles.commonTextStyle11,),
                        Text("${receiptObject.factoringResultObject != null? "${(receiptObject.factoringResultObject.effectiveAnnualCostRate * 100).toStringAsFixed(2)}%" : "0.00%"}", style: FinanzappStyles.commonTextStyle11,),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().setWidth(50)),
                child: Icon(Icons.arrow_forward_ios, size: ScreenUtil.getInstance().setSp(40),),
              ),
            ],
          ),
        ),
      ),
    );
  }

}