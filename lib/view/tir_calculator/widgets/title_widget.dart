import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';

class TitleWidget extends StatelessWidget {
  final String text;

  const TitleWidget({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(40)),
      child: Center(child: Text(text, style: FinanzappStyles.titleStyle2,),),
    );
  }

}