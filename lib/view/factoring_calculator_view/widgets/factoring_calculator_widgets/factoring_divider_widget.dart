import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';

class FactoringDividerWidget extends StatelessWidget {
  final String text;

  const FactoringDividerWidget({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(60)),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: ScreenUtil.getInstance().setWidth(10)),
            margin: EdgeInsets.only(right: ScreenUtil.getInstance().setWidth(20)),
            child: Text(text, style: FinanzappStyles.commonTextStyle6,),
          ),
          Flexible(
            fit: FlexFit.tight,
              child: Divider(
                color: FinanzappColorsLightMode.TEXT_COLOR_4,
              ),
          )
        ],
      ),
    );
  }

}