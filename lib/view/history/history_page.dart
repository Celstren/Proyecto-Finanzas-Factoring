import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/model/data_base/cartera_model/cartera_request.dart';
import 'package:proyecto_finanzas/view/consultation_details/consultation_details_page.dart';
import 'package:proyecto_finanzas/view/history/widget/cartera_dialog_widget.dart';
import 'package:proyecto_finanzas/view/history/widget/history_tile_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/view/history/objects/consultation_object.dart';
import 'package:proyecto_finanzas/view/history/objects/receipt_object.dart';

class HistoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HistoryPageState();
  }
}

class _HistoryPageState extends State<HistoryPage> {
  ConsultationObject consultationObjectSelected;
  bool isLoading = true;

  List<ConsultationObject> consultationObjects = [];

  addConsultation(ConsultationObject consultationObject) {
    setState(() {
      consultationObjects.add(consultationObject);
    });
  }

  addReceiptToConsultation(int index, ReceiptObject newReceiptObject){
    consultationObjects[index].receiptObjects.add(newReceiptObject);
  }

  selectConsultationObject(ConsultationObject objectSelected, int index){
    Navigator.push(context, MaterialPageRoute(builder: (context) => ConsultationDetailsPage(consultationObjectSelected: objectSelected, addReceipt: addReceiptToConsultation, index: index,)),);
  }

  saveCarteraInfo(int index, ConsultationObject consultationObject){
    setState(() {
      if (index != -1){
        consultationObjects[index] = consultationObject;
      } else {
        consultationObjects.add(consultationObject);
      }
    });
  }

  displayCarteraDialog(bool alreadyRegistered, {int index = -1,ConsultationObject consultationObject}){
    showDialog(
        context: context,
        builder: (context){
          return CarteraDialogWidget(alreadyRegistered, saveCarteraInfo, index: index, consultationObject: consultationObject,);
        }
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CarteraRequest.carteraRequestGetAllByUser().then((carteras){
      if(mounted){
        setState(() {
          carteras.forEach((cartera){
            consultationObjects.add(new ConsultationObject(DateTime.now(), [], cartera.descripcion, cartera.importeActual, cartera.tir));
          });
          isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Scaffold(
        body: !isLoading? SingleChildScrollView(
          child: Container(
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
