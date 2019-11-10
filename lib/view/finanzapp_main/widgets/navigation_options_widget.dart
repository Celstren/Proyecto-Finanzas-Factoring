import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';
import 'package:proyecto_finanzas/view/finanzapp_main/widgets/common_widgets.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/view/history/history_page.dart';
import 'package:proyecto_finanzas/view/settings/settings_view.dart';
import 'package:proyecto_finanzas/view/tir_calculator/tir_calculator_view.dart';

class NavigationOptionsWidget extends StatelessWidget {
  final Function updateView;

  const NavigationOptionsWidget(this.updateView);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        color: FinanzappColorsLightMode.MAIN_BACKGROUND_COLOR,
      ),
      padding: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(70)),
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CommonWidgets.buildDrawerOptionWidget<HistoryPage>(name: DrawerStrings.HISTORY, onTapFun: updateView, iconData: Icons.history),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CommonWidgets.buildDrawerOptionWidget<TIRCalculatorView>(name: DrawerStrings.CALCULATOR, onTapFun: updateView, iconData: Icons.filter_frames),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CommonWidgets.buildDrawerOptionWidget<SettingsView>(name: DrawerStrings.SETTINGS, onTapFun: updateView, iconData: Icons.settings),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CommonWidgets.buildDrawerOptionWidget<HistoryPage>(name: DrawerStrings.LOGOUT, onTapFun: updateView, iconData: Icons.arrow_back_ios, logout: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

}