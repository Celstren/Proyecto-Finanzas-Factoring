import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';

class ReciboDialogTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String hint;

  const ReciboDialogTextFieldWidget(this.controller, this.title, this.hint);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(bottom: ScreenUtil.getInstance().setHeight(50)),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(bottom: ScreenUtil.getInstance().setHeight(30)),
            child: Text(title, style: FinanzappStyles.commonTextStyle3,),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().setWidth(20)),
            child: TextField(
              controller: controller,
              style: FinanzappStyles.commonTextStyle1,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: FinanzappStyles.commonTextStyle1,
              ),
            ),
          ),
        ],
      ),
    );
  }

}