import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/model/data_base/cartera_model/cartera.dart';
import 'package:proyecto_finanzas/model/data_base/cartera_model/cartera_request.dart';
import 'package:proyecto_finanzas/view/consultation_details/consultation_details_page.dart';
import 'package:proyecto_finanzas/view/history/widget/cartera_dialog_widget.dart';
import 'package:proyecto_finanzas/view/history/widget/history_tile_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HistoryPageState();
  }
}

class _HistoryPageState extends State<HistoryPage> {
  Cartera carteraSelected;
  bool isLoading = true;

  List<Cartera> consultationObjects = [];

//  addConsultation(ConsultationObject consultationObject) {
//    setState(() {
//      consultationObjects.add(consultationObject);
//    });
//  }
//
//  addReceiptToConsultation(int index, ReceiptObject newReceiptObject){
//    consultationObjects[index].receiptObjects.add(newReceiptObject);
//  }
//
  selectConsultationObject(Cartera objectSelected){
    Navigator.push(context, MaterialPageRoute(builder: (context) => ConsultationDetailsPage(objectSelected)),);
  }

  saveCarteraInfo(){
    setState(() {
      consultationObjects = [];
      updateCurrentCarteras();
    });
  }

  displayCarteraDialog(bool alreadyRegistered, {int index = -1,Cartera consultationObject}){
    showDialog(
        context: context,
        builder: (context){
          return CarteraDialogWidget(alreadyRegistered, saveCarteraInfo, index: index, consultationObject: consultationObject,);
        }
    );
  }

  updateLoadingState(bool newLoadingState){
    setState(() {
      isLoading = newLoadingState;
    });
  }

  updateCurrentCarteras(){
    updateLoadingState(true);
    CarteraRequest.carteraRequestGetAllByUser().then((carteras){
      if(mounted){
        setState(() {
          carteras.forEach((cartera){
            consultationObjects.add(cartera);
          });
          updateLoadingState(false);
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateCurrentCarteras();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Scaffold(
        body: !isLoading? SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(bottom: ScreenUtil.getInstance().setHeight(200)),
            child: Column(
              children: List.generate(
                  consultationObjects.length,
                      (index) => HistoryTileWidget(
                    consultationObject: consultationObjects[index],
                    selectConsultationObject: selectConsultationObject,
                        index: index,
                        displayCarteraDialog: displayCarteraDialog,
                  ),
              ),
            ),
          ),
        ) : Center(
          child: CircularProgressIndicator(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => displayCarteraDialog(false),
          child: Icon(
            Icons.add,
            size: ScreenUtil.getInstance().setSp(80),
          ),
        ),
      ),
    );
  }
}
