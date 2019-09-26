import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';

class SimpleRateTile extends StatelessWidget {
  final String text;
  final String hint;
  final bool enabled;
  final TextEditingController controller;

  SimpleRateTile(this.text, this.hint, this.enabled, this.controller) : assert(text != null || hint != null || enabled != null || controller != null);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: ScreenUtil.getInstance().setHeight(200),
            width: ScreenUtil.getInstance().setWidth(300),
            child: Center(
              child: Text(this.text, style: FinanzappStyles.simpleTextBigFontStyle,),
            ),
          ),
          Container(
            height: ScreenUtil.getInstance().setHeight(200),
            width: ScreenUtil.getInstance().setWidth(700),
            child: TextField(
              enabled: !enabled,
              controller: controller,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                LengthLimitingTextInputFormatter(10),
                WhitelistingTextInputFormatter.digitsOnly,
              ],
              style: FinanzappStyles.simpleTextFieldStyle,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: FinanzappStyles.simpleTextFieldStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }

}