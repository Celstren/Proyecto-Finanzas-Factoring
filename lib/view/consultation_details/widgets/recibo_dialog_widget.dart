import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/view/consultation_details/widgets/recibo_dialog_buttons_widget.dart';
import 'package:proyecto_finanzas/view/consultation_details/widgets/recibo_dialog_textfield_widget.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/view/history/objects/receipt_object.dart';

class ReciboDialogWidget extends StatefulWidget {
  final bool alreadyRegistered;
  final Function updateRecibos;
  final ReceiptObject recibo;

  const ReciboDialogWidget(this.alreadyRegistered, this.updateRecibos, {this.recibo});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ReciboDialogWidgetState();
  }

}

class _ReciboDialogWidgetState extends State<ReciboDialogWidget> {
  TextEditingController descriptionController = TextEditingController();

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
        width: ScreenUtil.getInstance().setWidth(900),
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().setWidth(20), vertical: ScreenUtil.getInstance().setHeight(20)),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                ReciboDialogTextFieldWidget(descriptionController, CalculationDetailsString.RECIBO_DIALOG_DESCRIPTION, CalculationDetailsString.RECIBO_DIALOG_DESCRIPTION_HINT),
                ReciboDialogButtonsWidget(widget.alreadyRegistered, widget.updateRecibos, widget.recibo, descriptionController),
              ],
            ),
          ),
        ),
      ),
    );
  }

}