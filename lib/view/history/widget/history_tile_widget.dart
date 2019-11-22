import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';
import 'package:proyecto_finanzas/model/data_base/cartera_model/cartera.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:intl/intl.dart';

class HistoryTileWidget extends StatelessWidget {

  final Cartera consultationObject;
  final Function selectConsultationObject;
  final Function displayCarteraDialog;
  final int index;

  const HistoryTileWidget({Key key, this.consultationObject, this.selectConsultationObject, this.displayCarteraDialog, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () => selectConsultationObject(consultationObject),
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
//                    child: Text("${HistoryStrings.NAME_OF_CONSULTATION}${consultationObject.index}", style: FinanzappStyles.commonTextStyle3,),
                    child: Text(consultationObject.descripcion, style: FinanzappStyles.commonTextStyle3,),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().setWidth(50)),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => displayCarteraDialog(true, index: index, consultationObject: consultationObject),
                      child: Container(
                        padding: EdgeInsets.only(right: ScreenUtil.getInstance().setWidth(50)),
                        child: Icon(Icons.edit, size: ScreenUtil.getInstance().setSp(40),),
                      ),
                    ),
                    Container(
                      child: Icon(Icons.arrow_forward_ios, size: ScreenUtil.getInstance().setSp(40),),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}