import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/model/data_base/shared_preference_data.dart';
import 'package:proyecto_finanzas/view/settings/widget/last_update_widget.dart';
import 'package:proyecto_finanzas/view/settings/widget/settings_first_name_widget.dart';
import 'package:proyecto_finanzas/view/settings/widget/settings_format_widget.dart';
import 'package:proyecto_finanzas/view/settings/widget/settings_last_name_widget.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/view/settings/widget/settings_mail_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SettingsViewState();
  }
}

class _SettingsViewState extends State<SettingsView> {

  TextEditingController firstNameController = TextEditingController(text: SettingsStrings.TEMP_FIRST_NAME);
  TextEditingController lastNameController = TextEditingController(text: SettingsStrings.TEMP_LAST_NAME);
  TextEditingController mailController = TextEditingController(text: SettingsStrings.TEMP_MAIL);
  bool peruStandard = true;

  int currencyTypeSelected = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setInitialData();
  }

  setInitialData(){
    SharedPreferenceData.getUser().then((_user){
      SharedPreferenceData.getYearDates().then((yearDates){
        SharedPreferenceData.getCurrencySelected().then((currencyType){
          setState(() {
            firstNameController = TextEditingController(text: _user.nombres);
            lastNameController = TextEditingController(text:  _user.apellidos);
            peruStandard = yearDates == 360;
            currencyTypeSelected = currencyType != null? currencyType : 0;
          });
        });
      });
    });
  }

  updateYearDatesFormat(bool peruStandardEnabled){
    setState(() {
      peruStandard = peruStandardEnabled;
      if (peruStandardEnabled){
        SharedPreferenceData.setYearDates(360);
      } else {
        SharedPreferenceData.setYearDates(365);
      }
    });
  }

  updateCurrencyTypeSelected(int newValue){
    setState(() {
      currencyTypeSelected = newValue;
      SharedPreferenceData.setCurrencySelected(newValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().setWidth(100)),
          child: Column(
            children: <Widget>[
              SettingsFirstNameWidget(firstNameController: firstNameController,),
              SettingsLastNameWidget(lastNameController: lastNameController,),
              SettingsMailWidget(mailController: mailController,),
              SettingsFormatWidget(updateYearDatesFormat, peruStandard),
              LastUpdateWidget(),
//              SettingsCurrencyWidget(currencyTypeSelected, updateCurrencyTypeSelected),
//              SettingsSaveButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }

}