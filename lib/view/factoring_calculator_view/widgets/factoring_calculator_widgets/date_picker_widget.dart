import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatelessWidget {

  final DateTime date;
  final String title;
  final Function updateDate;

  const DatePickerWidget({Key key, this.date, this.title, this.updateDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    displayDatePicker(){
      showDatePicker(
          context: context,
          initialDate: date,
          firstDate: DateTime(1800),
          lastDate: DateTime(2100)).then((datePicked){
            if (datePicked != null){
              updateDate(datePicked);
            }
      });
    }

    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(vertical: ScreenUtil.getInstance().setHeight(20), horizontal: ScreenUtil.getInstance().setWidth(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Text(title, style: FinanzappStyles.commonTextStyle10,),
          ),
          GestureDetector(
            onTap: () => displayDatePicker(),
            child: Container(
              height: ScreenUtil.getInstance().setHeight(80),
              width: ScreenUtil.getInstance().setWidth(400),
              decoration: BoxDecoration(
                color: FinanzappColorsLightMode.TEXT_COLOR_4,
                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().setSp(5))),
              ),
              alignment: Alignment.centerLeft,
              child: Center(
                child: Text(
                  date != null? DateFormat("dd/MM/yyyy").format(date) : DateFormat("dd/MM/yyyy").format(DateTime.now()),
                  style: FinanzappStyles.commonTextStyle5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}