import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';
import 'package:proyecto_finanzas/view/effective_rate/effective_rate_view.dart';
import 'package:proyecto_finanzas/view/finanzapp_main/widgets/common_widgets.dart';
import 'package:proyecto_finanzas/view/nominal_rate/nominal_rate_view.dart';
import 'package:proyecto_finanzas/view/see_equivalencies/see_equivalencies_view.dart';
import 'package:proyecto_finanzas/view/simple_rate/simple_rate_view.dart';

class MainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StateMainView();

}

class _StateMainView extends State<MainView>{

  Widget _currentView = Container();


  updateStateWithNewView<T>(){
    setState(() {
      if (T == SimpleRateView){
        _currentView = SimpleRateView();
      } else if (T == NominalRateView) {
        _currentView = NominalRateView();
      } else if (T == EffectiveRateView) {
        _currentView = EffectiveRateView();
      } else if (T == SeeEquivalenciesView){
        _currentView = SeeEquivalenciesView();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(MainViewStrings.MAIN_TITLE.toUpperCase(), style: FinanzappStyles.titleStyle,),
          ),
        ),
        drawer: Drawer(
          child: Container(
            decoration: BoxDecoration(
              color: FinanzappColorsLightMode.MAIN_THEME,
            ),
            child: Column(
              children: <Widget>[
                CommonWidgets.buildDrawerOptionWidget(name: SimpleRateStrings.TITLE.toUpperCase(), onTapFun: (){updateStateWithNewView<SimpleRateView>();}),
                CommonWidgets.buildDrawerOptionWidget(name: NominalRateStrings.TITLE.toUpperCase(), onTapFun: (){updateStateWithNewView<NominalRateView>();}),
                CommonWidgets.buildDrawerOptionWidget(name: EffectiveRateStrings.TITLE.toUpperCase(), onTapFun: (){updateStateWithNewView<EffectiveRateView>();}),
                CommonWidgets.buildDrawerOptionWidget(name: SeeEquivalenciesStrings.TITLE.toUpperCase(), onTapFun: (){updateStateWithNewView<SeeEquivalenciesView>();}),
              ],
            ),
          ),
        ),
        backgroundColor: FinanzappColorsLightMode.MAIN_BACKGROUND_COLOR,
        body: _currentView,
      ),
    );
  }
}