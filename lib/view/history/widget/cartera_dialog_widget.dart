import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/view/history/objects/consultation_object.dart';

import 'cartera_dialog_buttons_widget.dart';
import 'cartera_dialog_textfield_widget.dart';

class CarteraDialogWidget extends StatefulWidget {
  final bool alreadyRegistered;
  final Function saveCarteraInfo;
  final int index;
  final ConsultationObject consultationObject;

  const CarteraDialogWidget(this.alreadyRegistered, this.saveCarteraInfo, {this.index = -1, this.consultationObject});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CarteraDialogWidgetState();
  }

}

class _CarteraDialogWidgetState extends State<CarteraDialogWidget> {
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.alreadyRegistered){
      descriptionController = TextEditingController(text: widget.consultationObject.descripcion);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      title: Container(
        width: ScreenUtil.getInstance().setWidth(900),
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().setWidth(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(20)),
                child: Center(
                  child: Icon(Icons.close, size: ScreenUtil.getInstance().setSp(80),),
                ),
              ),
            ),
          ],
        ),
      ),
      content: Container(
//        height: ScreenUtil.getInstance().setHeight(900),
        width: ScreenUtil.getInstance().setWidth(900),
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().setWidth(20), vertical: ScreenUtil.getInstance().setHeight(20)),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                CarteraDialogTextFieldWidget(descriptionController, HistoryStrings.HISTORY_DIALOG_DESCRIPTION, HistoryStrings.HISTORY_DIALOG_DESCRIPTION_HINT),
                CarteraDialogButtonsWidget(widget.alreadyRegistered, widget.saveCarteraInfo, widget.index, widget.consultationObject, descriptionController),
              ],
            ),
          ),
        ),
      ),
    );
  }

}