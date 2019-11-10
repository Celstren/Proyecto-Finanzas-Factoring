import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';
import 'package:proyecto_finanzas/view/history/objects/consultation_object.dart';

class CarteraDialogButtonsWidget extends StatelessWidget {
  final bool alreadyRegistered;
  final Function saveCarteraInfo;
  final int index;
  final ConsultationObject consultationObject;
  final TextEditingController descriptionController;

  const CarteraDialogButtonsWidget(this.alreadyRegistered, this.saveCarteraInfo, this.index, this.consultationObject, this.descriptionController);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(bottom: ScreenUtil.getInstance().setHeight(10)),
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().setWidth(10)),
      child: alreadyRegistered? Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: (){
              consultationObject.descripcion = descriptionController.value.text;
              saveCarteraInfo(index, consultationObject);
              Navigator.pop(context);
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
                child: Text(HistoryStrings.HISTORY_DIALOG_SAVE, style: FinanzappStyles.commonTextStyle5,),
              ),
            ),
          ),
          Container(
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
              child: Text(HistoryStrings.HISTORY_DIALOG_DELETE, style: FinanzappStyles.commonTextStyle5,),
            ),
          ),
        ],
      ) : Center(
        child: GestureDetector(
          onTap: (){
            saveCarteraInfo(index, new ConsultationObject(DateTime.now(), [], descriptionController.value.text, 0, 0));
            Navigator.pop(context);
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
              child: Text(HistoryStrings.HISTORY_DIALOG_ADD, style: FinanzappStyles.commonTextStyle5,),
            ),
          ),
        ),
      ),
    );
  }

}