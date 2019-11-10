import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoMemberWidget extends StatelessWidget{
  final Function createNewAccountFunction;

  const NoMemberWidget({Key key, this.createNewAccountFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(60)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: ScreenUtil.getInstance().setWidth(10)),
            child: Text(SignInStrings.NO_MEMBER, style: FinanzappStyles.commonTextStyle10,),
          ),
          Container(
            child: GestureDetector(
              onTap: () => createNewAccountFunction(),
              child: Text(SignInStrings.REGISTER, style: FinanzappStyles.commonTextStyle6,),
            ),
          ),
        ],
      ),
    );
  }

}