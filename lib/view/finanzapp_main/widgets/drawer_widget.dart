import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';
import 'package:proyecto_finanzas/model/data_base/user_model/user.dart';
import 'package:proyecto_finanzas/view/finanzapp_main/widgets/navigation_options_widget.dart';
import 'package:proyecto_finanzas/view/finanzapp_main/widgets/profile_widget.dart';

class DrawerWidget extends StatelessWidget {
  final Function updateStateWithNewView;
  final User user;

  const DrawerWidget(this.updateStateWithNewView, this.user);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        color: FinanzappColorsLightMode.MAIN_THEME,
      ),
      child: Column(
        children: <Widget>[
          ProfileWidget(user),
          Flexible(child: NavigationOptionsWidget(updateStateWithNewView),)
//          CommonWidgets.buildDrawerOptionWidget(name: MainViewStrings.MAIN_PAGE.toUpperCase(), onTapFun: (){updateStateWithNewView<HistoryPage>();}),
//          CommonWidgets.buildDrawerOptionWidget(name: SimpleRateStrings.TITLE.toUpperCase(), onTapFun: (){updateStateWithNewView<SimpleRateView>();}),
//          CommonWidgets.buildDrawerOptionWidget(name: NominalRateStrings.TITLE.toUpperCase(), onTapFun: (){updateStateWithNewView<NominalRateView>();}),
//          CommonWidgets.buildDrawerOptionWidget(name: EffectiveRateStrings.TITLE.toUpperCase(), onTapFun: (){updateStateWithNewView<EffectiveRateView>();}),
//          CommonWidgets.buildDrawerOptionWidget(name: SeeEquivalenciesStrings.TITLE.toUpperCase(), onTapFun: (){updateStateWithNewView<SeeEquivalenciesView>();}),
//          CommonWidgets.buildDrawerOptionWidget(name: TIRCalculatorStrings.TITLE.toUpperCase(), onTapFun: (){updateStateWithNewView<TIRCalculatorView>();}),
//          CommonWidgets.buildDrawerOptionWidget(name: FactoringCalculatorStrings.TITLE.toUpperCase(), onTapFun: (){updateStateWithNewView<FactoringCalculatorPage>();}),
        ],
      ),
    );
  }

}