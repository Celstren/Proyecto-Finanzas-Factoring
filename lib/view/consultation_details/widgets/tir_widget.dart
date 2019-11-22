import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/view/consultation_details/logic/consultation_tir_logic.dart';
import 'package:proyecto_finanzas/view/consultation_details/widgets/tir_help_dialog.dart';
import 'package:proyecto_finanzas/view/history/objects/receipt_object.dart';

class TIRWidget extends StatelessWidget{
  final List<ReceiptObject> receipts;
  final double totalAmount;
  final int yearDates;

  const TIRWidget({Key key, this.receipts, this.totalAmount, this.yearDates}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double tir = 0.0;

    displayHelpDialog(){
      showDialog(
          context: context,
          builder: (context){
            return TIRHelpDialogWidget();
          }
      );
    }

    if (receipts.isNotEmpty){
      tir = calculateConsultationTIR(totalAmount, receipts, yearDates);
    }

    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(100)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("${CalculationDetailsString.INTERNAL_RATE_RETURN}${tir.toStringAsFixed(5)}%", style: FinanzappStyles.commonTextStyle3, textAlign: TextAlign.center,),
          GestureDetector(
            onTap: () => displayHelpDialog(),
            child: Container(
              margin: EdgeInsets.only(left: ScreenUtil.getInstance().setWidth(20)),
              child: Icon(
                Icons.help,
                size: ScreenUtil.getInstance().setSp(60),
              ),
            ),
          )
        ],
      ),
    );
  }

}