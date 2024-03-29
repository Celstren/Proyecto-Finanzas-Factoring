import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';
import 'package:proyecto_finanzas/model/data_base/cartera_model/cartera.dart';
import 'package:proyecto_finanzas/model/data_base/cartera_model/cartera_request.dart';
import 'package:proyecto_finanzas/model/data_base/shared_preference_data.dart';

class CarteraDialogButtonsWidget extends StatefulWidget {
  final bool alreadyRegistered;
  final Function updateCarteras;
  final Cartera consultationObject;
  final TextEditingController descriptionController;

  const CarteraDialogButtonsWidget(this.alreadyRegistered, this.updateCarteras, this.consultationObject, this.descriptionController);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CarteraDialogButtonsWidgetState();
  }
}

class _CarteraDialogButtonsWidgetState extends State<CarteraDialogButtonsWidget>{

  Cartera cartera = new Cartera();
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
    if (widget.consultationObject != null && widget.consultationObject.id != null){
      cartera.id = widget.consultationObject.id;
      cartera.descripcion = widget.consultationObject.descripcion;
      cartera.importeActual = widget.consultationObject.importeActual;
      cartera.tir = widget.consultationObject.tir;
      cartera.date = widget.consultationObject.date;
      cartera.cantidadRecibos = widget.consultationObject.cantidadRecibos;
      cartera.usuario = widget.consultationObject.usuario;
    }
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
              if (!isLoading){
                updateLoadingStatus(true);
                cartera.descripcion = widget.descriptionController.value.text;
                CarteraRequest.carteraRequestUpdateCartera(cartera).then((success){
                  if (success){
                    widget.updateCarteras();
                    Navigator.pop(context);
                  }
                  updateLoadingStatus(false);
                });
              }
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
              if (!isLoading){
                updateLoadingStatus(true);
                CarteraRequest.carteraRequestDeleteCartera(cartera.id).then((success){
                  if (success){
                    widget.updateCarteras();
                    Navigator.pop(context);
                  }
                  updateLoadingStatus(false);
                });
              }
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
            if (!isLoading){
              updateLoadingStatus(true);
              SharedPreferenceData.getUser().then((user){
                cartera = new Cartera(descripcion: widget.descriptionController.value.text, date: DateTime.now(), cantidadRecibos: 0, usuario: user.usuario, importeActual: 0, tir: 0);
                CarteraRequest.carteraRequestAddNewCartera(cartera).then((success){
                  if (success){
                    widget.updateCarteras();
                    Navigator.pop(context);
                  }
                  updateLoadingStatus(false);
                });
              });
            }
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