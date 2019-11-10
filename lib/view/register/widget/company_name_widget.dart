import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';

class CompanyNameWidget extends StatelessWidget {
  final TextEditingController companyNameController;

  const CompanyNameWidget({Key key, this.companyNameController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(40)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: ScreenUtil.getInstance().setWidth(40),),
            child: Icon(Icons.business, color: FinanzappColorsLightMode.BACKGROUND_COLOR_8, size: ScreenUtil.getInstance().setWidth(100),),
          ),
          Container(
            width:  ScreenUtil.getInstance().setWidth(750),
            child: TextField(
              controller: companyNameController,
              style: FinanzappStyles.commonTextStyle3,
              decoration: InputDecoration(
                hintText: RegisterStrings.COMPANY_NAME_HINT,
                hintStyle: FinanzappStyles.commonTextStyle3,
              ),
            ),
          ),
        ],
      ),
    );
  }

}