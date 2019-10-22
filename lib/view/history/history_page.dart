import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/view/consultation_details/consultation_details_page.dart';
import 'package:proyecto_finanzas/view/history/history_tile_widget/history_tile_widget.dart';
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

  final List<ConsultationObject> consultationObjects = [
    new ConsultationObject(
      new TextEditingController(text: "Consulta N°1"),
      3,
      DateTime.now(),
      [
        ReceiptObject(new TextEditingController(text: "Recibo por Honorario N°3"), 0, DateTime.now(), DateTime.now(),),
      ],
    ),
  ];

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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: List.generate(
                  consultationObjects.length,
                      (index) => HistoryTileWidget(
                    consultationObject: consultationObjects[index],
                    selectConsultationObject: selectConsultationObject,
                        index: index,
                  )),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => addConsultation(
            new ConsultationObject(
              new TextEditingController(text: "Consulta N°1"),
              3,
              DateTime.now(),
              [
                ReceiptObject(new TextEditingController(text: "Recibo por Honorario N°3"), 0, DateTime.now(), DateTime.now(),),
              ],
            ),
          ),
          child: Icon(
            Icons.add,
            size: ScreenUtil.getInstance().setSp(80),
          ),
        ),
      ),
    );
  }
}
