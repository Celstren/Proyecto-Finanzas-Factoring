import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';
import 'package:proyecto_finanzas/view/history/objects/receipt_object.dart';

class ReciboDialogButtonsWidget extends StatefulWidget {
  final bool alreadyRegistered;
  final Function updateCarteras;
  final ReceiptObject recibo;
  final TextEditingController descriptionController;

  const ReciboDialogButtonsWidget(this.alreadyRegistered, this.updateCarteras, this.recibo, this.descriptionController);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ReciboDialogButtonsWidgetState();
  }
}

class _ReciboDialogButtonsWidgetState extends State<ReciboDialogButtonsWidget>{

  ReceiptObject cartera;
  bool isLoading = false;

  updateLoadingStatus(bool newStatus){
    setState(() {
      isLoading = newStatus;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(bottom: ScreenUtil.getInstance().setHeight(10)),
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().setWidth(10)),
      child: widget.alreadyRegistered? Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: (){
              print("SAVE");
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(30)),
              width: ScreenUtil.getInstance().setWidth(375),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().setSp(15))),
                color: FinanzappColorsLightMode.BACKGROUND_COLOR_5,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: FinanzappColorsLightMode.BACKGROUND_COLOR_7,
                    offset: Offset(0.0, 1.0),
                    blurRadius: 1.0,
                  ),
                ],
              ),
              child: Center(
                child: isLoading? Container(child: CircularProgressIndicator(strokeWidth: ScreenUtil.getInstance().setSp(10),), height: ScreenUtil.getInstance().setSp(34), width: ScreenUtil.getInstance().setSp(34),) : Text(HistoryStrings.HISTORY_DIALOG_SAVE, style: FinanzappStyles.commonTextStyle5,),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              print("DELETE");
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(30)),
              width: ScreenUtil.getInstance().setWidth(375),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().setSp(15))),
                color: FinanzappColorsLightMode.BACKGROUND_COLOR_4,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: FinanzappColorsLightMode.BACKGROUND_COLOR_7,
                    offset: Offset(0.0, 1.0),
                    blurRadius: 1.0,
                  ),
                ],
              ),
              child: Center(
                child: isLoading? Container(child: CircularProgressIndicator(strokeWidth: ScreenUtil.getInstance().setSp(10),), height: ScreenUtil.getInstance().setSp(34), width: ScreenUtil.getInstance().setSp(34),) : Text(HistoryStrings.HISTORY_DIALOG_DELETE, style: FinanzappStyles.commonTextStyle5,),
              ),
            ),
          ),
        ],
      ) : Center(
        child: GestureDetector(
          onTap: (){
            print("ADD");
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(30)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().setSp(15))),
              color: FinanzappColorsLightMode.BACKGROUND_COLOR_1,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: FinanzappColorsLightMode.BACKGROUND_COLOR_7,
                  offset: Offset(0.0, 1.0),
                  blurRadius: 1.0,
                ),
              ],
            ),
            child: Center(
              child: isLoading? Container(child: CircularProgressIndicator(strokeWidth: ScreenUtil.getInstance().setSp(10),), height: ScreenUtil.getInstance().setSp(34), width: ScreenUtil.getInstance().setSp(34),) : Text(HistoryStrings.HISTORY_DIALOG_ADD, style: FinanzappStyles.commonTextStyle5,),
            ),
          ),
        ),
      ),
    );
  }
}