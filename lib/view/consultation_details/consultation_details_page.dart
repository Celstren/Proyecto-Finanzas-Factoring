import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_enums.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';
import 'package:proyecto_finanzas/model/data_base/cartera_model/cartera.dart';
import 'package:proyecto_finanzas/model/data_base/recibo_model/recibo_request.dart';
import 'package:proyecto_finanzas/view/consultation_details/widgets/consultation_tile_widget.dart';
import 'package:proyecto_finanzas/view/consultation_details/widgets/recibo_dialog_widget.dart';
import 'package:proyecto_finanzas/view/consultation_details/widgets/tir_widget.dart';
import 'package:proyecto_finanzas/view/factoring_calculator_view/factoring_calculator_page.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/view/history/objects/receipt_object.dart';

class ConsultationDetailsPage extends StatefulWidget {
  final Cartera carteraSelected;
  const ConsultationDetailsPage(this.carteraSelected);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ConsultationDetailsPageState();
  }

}

class _ConsultationDetailsPageState extends State<ConsultationDetailsPage> {
  List<ReceiptObject> recibos = [];
  bool isLoading = false;

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

  updateLoadingState(bool newLoadingState){
    setState(() {
      isLoading = newLoadingState;
    });
  }

  updateRecibos(){
    updateLoadingState(true);
    ReciboRequest.reciboRequestGetAllByCarteraId(widget.carteraSelected.id).then((result){
      for (int i = 0; i < result.length; i++){
        ReceiptObject obj = new ReceiptObject.fromRecibo(result[i], i);
        recibos.add(obj);
      }
      updateLoadingState(false);
    });
  }

  displayReciboDialog(bool alreadyRegistered){
    showDialog(
        context: context,
      builder: (context){
          return ReciboDialogWidget(alreadyRegistered, updateRecibos);
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateRecibos();
  }

  @override
  Widget build(BuildContext context) {
    double totalAmount = 0;

//    widget.consultationObjectSelected.receiptObjects.forEach((receipt){
//      totalAmount += receipt.amount;
//    });

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(CalculationDetailsString.TITLE.toUpperCase(), style: FinanzappStyles.titleStyle2,),
        ),
      ),
      backgroundColor: FinanzappColorsLightMode.MAIN_BACKGROUND_COLOR,
      body: isLoading? Center(
        child: CircularProgressIndicator(),
      ) :
      SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              TIRWidget(totalAmount: totalAmount, receipts: recibos,),
              Column(
                children: List.generate(recibos.length, (index) => ConsultationTileWidget(receiptObject: recibos[index], selectReceiptObject: selectReceiptObject,)),
              ),
            ],
          ),
        ),
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => displayReciboDialog(false),
          child: Icon(
            Icons.add,
            size: ScreenUtil.getInstance().setSp(80),
          ),
        )
    );
  }

}