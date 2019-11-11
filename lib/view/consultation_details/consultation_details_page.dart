import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';
import 'package:proyecto_finanzas/model/data_base/cartera_model/cartera.dart';
import 'package:proyecto_finanzas/model/data_base/shared_preference_data.dart';
import 'package:proyecto_finanzas/view/consultation_details/widgets/consultation_tile_widget.dart';
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
  int yearDates = 360;
  int currencyType = 0;

  selectReceiptObject(ReceiptObject receiptObject){
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(FactoringCalculatorStrings.TITLE.toUpperCase(), style: FinanzappStyles.titleStyle2,),
          ),
        ),
        body: FactoringCalculatorPage(receiptObject: receiptObject, currentType: currencyType,),
      );
    }),);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setInitialData();

  }

  setInitialData(){
    SharedPreferenceData.getYearDates().then((_yearDates){
      if (mounted){
        setState(() {
          yearDates = _yearDates != null? _yearDates : 360;
        });
      }
    });
  }

  updateCurrencyType(){
    setState(() {
      setState(() {
        if (currencyType == 0){
          currencyType = 1;
        }else {
          currencyType = 0;
        }
        recibos.forEach((recibo){
          recibo = recibo.updateCurrency(currencyType);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double totalAmount = 0;

    recibos.forEach((receipt){
      totalAmount += receipt.amount;
    });

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(CalculationDetailsString.TITLE.toUpperCase(), style: FinanzappStyles.titleStyle2,),
        ),
        actions: <Widget>[
          Container(
            height: ScreenUtil.getInstance().setHeight(10),
            width: ScreenUtil.getInstance().setWidth(150),
            child: Center(
              child: GestureDetector(
                onTap: () => updateCurrencyType(),
                child: Icon(currencyType == 1? Icons.money_off : Icons.attach_money, size: ScreenUtil.getInstance().setSp(60),
              ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: FinanzappColorsLightMode.MAIN_BACKGROUND_COLOR,
      body: isLoading? Center(
        child: CircularProgressIndicator(),
      ) :
      SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              TIRWidget(totalAmount: totalAmount, receipts: recibos, yearDates: yearDates,),
              Column(
                children: List.generate(recibos.length, (index) => ConsultationTileWidget(receiptObject: recibos[index], selectReceiptObject: selectReceiptObject,)),
              ),
            ],
          ),
        ),
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              recibos.add(new ReceiptObject(recibos.length, 0, DateTime.now(), DateTime.now(), "Recibo N°${recibos.length + 1}", currencyType));
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