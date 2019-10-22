import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';
import 'package:proyecto_finanzas/view/history/objects/consultation_object.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:intl/intl.dart';

class HistoryTileWidget extends StatelessWidget {

  final ConsultationObject consultationObject;
  final Function selectConsultationObject;
  final int index;

  const HistoryTileWidget({Key key, this.consultationObject, this.selectConsultationObject, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () => selectConsultationObject(consultationObject, index),
      child: Container(
        height: ScreenUtil.getInstance().setHeight(300),
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().setWidth(50)),
        child: Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: FinanzappColorsLightMode.BACKGROUND_COLOR_8, width: ScreenUtil.getInstance().setHeight(.75))),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(consultationObject.consultationName.value.text, style: FinanzappStyles.commonTextStyle3,),
                  ),
                  Container(
                    child: Text("${HistoryStrings.NUMBER_OF_FACTORING_CALCULATIONS}${consultationObject.factoringCalculationQuantity}", style: FinanzappStyles.commonTextStyle1,),
                  ),
                  Container(
                    child: Text("${HistoryStrings.DATE}${DateFormat("dd/MM/yyyy - hh:mm aa").format(consultationObject.date)}", style: FinanzappStyles.commonTextStyle11,),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().setWidth(50)),
                child: Icon(Icons.arrow_forward_ios, size: ScreenUtil.getInstance().setSp(40),),
              ),
            ],
          ),
        ),
      ),
    );
  }

}