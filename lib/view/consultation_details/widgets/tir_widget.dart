import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/view/consultation_details/logic/consultation_tir_logic.dart';
import 'package:proyecto_finanzas/view/history/objects/receipt_object.dart';

class TIRWidget extends StatelessWidget{
  final List<ReceiptObject> receipts;
  final double totalAmount;

  const TIRWidget({Key key, this.receipts, this.totalAmount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double tir = 0.0;

    if (receipts.isNotEmpty){
      tir = calculateConsultationTIR(totalAmount, receipts);
    }

    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(100)),
      child: Center(
        child: Text("${CalculationDetailsString.INTERNAL_RATE_RETURN}${tir.toStringAsFixed(2)}%", style: FinanzappStyles.commonTextStyle3,),
      ),
    );
  }

}