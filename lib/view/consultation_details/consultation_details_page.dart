import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';
import 'package:proyecto_finanzas/view/consultation_details/widgets/consultation_tile_widget.dart';
import 'package:proyecto_finanzas/view/consultation_details/widgets/tir_widget.dart';
import 'package:proyecto_finanzas/view/factoring_calculator_view/factoring_calculator_page.dart';
import 'package:proyecto_finanzas/view/history/objects/consultation_object.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/view/history/objects/receipt_object.dart';

class ConsultationDetailsPage extends StatefulWidget {
  final ConsultationObject consultationObjectSelected;
  final Function addReceipt;
  final int index;

  const ConsultationDetailsPage({Key key, this.consultationObjectSelected, this.addReceipt, this.index}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ConsultationDetailsPageState();
  }

}

class _ConsultationDetailsPageState extends State<ConsultationDetailsPage> {

  selectReceiptObject(ReceiptObject receiptObject){
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(FactoringCalculatorStrings.TITLE.toUpperCase(), style: FinanzappStyles.titleStyle2,),
          ),
        ),
        body: FactoringCalculatorPage(receiptObject: receiptObject,),
      );
    }),);
  }

  @override
  Widget build(BuildContext context) {
    double totalAmount = 0;

    widget.consultationObjectSelected.receiptObjects.forEach((receipt){
      totalAmount += receipt.amount;
    });

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(CalculationDetailsString.TITLE.toUpperCase(), style: FinanzappStyles.titleStyle2,),
        ),
      ),
      backgroundColor: FinanzappColorsLightMode.MAIN_BACKGROUND_COLOR,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              TIRWidget(totalAmount: totalAmount, receipts: widget.consultationObjectSelected.receiptObjects,),
              Column(
                children: List.generate(widget.consultationObjectSelected.receiptObjects.length, (index) => ConsultationTileWidget(receiptObject: widget.consultationObjectSelected.receiptObjects[index], selectReceiptObject: selectReceiptObject,)),
              ),
            ],
          ),
        ),
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              widget.addReceipt(
                widget.index,
                new ReceiptObject(widget.consultationObjectSelected.receiptObjects.length + 1, 0, DateTime.now(), DateTime.now(),),
              );
            });
          },
          child: Icon(
            Icons.add,
            size: ScreenUtil.getInstance().setSp(80),
          ),
        )
    );
  }

}