import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';
import 'package:proyecto_finanzas/view/effective_rate/effective_rate_view.dart';
import 'package:proyecto_finanzas/view/factoring_calculator_view/factoring_calculator_page.dart';
import 'package:proyecto_finanzas/view/finanzapp_main/widgets/common_widgets.dart';
import 'package:proyecto_finanzas/view/history/history_page.dart';
import 'package:proyecto_finanzas/view/history/objects/receipt_object.dart';
import 'package:proyecto_finanzas/view/nominal_rate/nominal_rate_view.dart';
import 'package:proyecto_finanzas/view/see_equivalencies/see_equivalencies_view.dart';
import 'package:proyecto_finanzas/view/simple_rate/simple_rate_view.dart';
import 'package:proyecto_finanzas/view/tir_calculator/tir_calculator_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StateMainView();

}

class _StateMainView extends State<MainView>{



  Widget _currentView = HistoryPage();
  bool finishInitialLoading = false;

  //This method helps the app to update the state of the view after user selects an option from the drawer
  //It also helps to close the drawer
  updateStateWithNewView<T>(){
    setState(() {
      if (T == HistoryPage){
        _currentView = HistoryPage();
      } else if (T == SimpleRateView){
        _currentView = SimpleRateView();
      } else if (T == NominalRateView) {
        _currentView = NominalRateView();
      } else if (T == EffectiveRateView) {
        _currentView = EffectiveRateView();
      } else if (T == SeeEquivalenciesView){
        _currentView = SeeEquivalenciesView();
      } else if (T == TIRCalculatorView){
        _currentView = TIRCalculatorView();
      } else if (T == FactoringCalculatorPage){
        _currentView = FactoringCalculatorPage(receiptObject: new ReceiptObject(new TextEditingController(text: "Recibo por Honorario N°3"), 0, DateTime.now(), DateTime.now(),),);
      }
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(milliseconds: 400), (){}).then((_){
      setState(() {
        ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
        finishInitialLoading = true;
      });
    });

    // TODO: implement build
    return SafeArea(
      child: finishInitialLoading? Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(MainViewStrings.HISTORY.toUpperCase(), style: FinanzappStyles.titleStyle2,),
          ),
        ),
        drawer: Drawer(
          child: Container(
            decoration: BoxDecoration(
              color: FinanzappColorsLightMode.MAIN_THEME,
            ),
            child: Column(
              children: <Widget>[
                CommonWidgets.buildDrawerOptionWidget(name: MainViewStrings.MAIN_PAGE.toUpperCase(), onTapFun: (){updateStateWithNewView<HistoryPage>();}),
                CommonWidgets.buildDrawerOptionWidget(name: SimpleRateStrings.TITLE.toUpperCase(), onTapFun: (){updateStateWithNewView<SimpleRateView>();}),
                CommonWidgets.buildDrawerOptionWidget(name: NominalRateStrings.TITLE.toUpperCase(), onTapFun: (){updateStateWithNewView<NominalRateView>();}),
                CommonWidgets.buildDrawerOptionWidget(name: EffectiveRateStrings.TITLE.toUpperCase(), onTapFun: (){updateStateWithNewView<EffectiveRateView>();}),
                CommonWidgets.buildDrawerOptionWidget(name: SeeEquivalenciesStrings.TITLE.toUpperCase(), onTapFun: (){updateStateWithNewView<SeeEquivalenciesView>();}),
                CommonWidgets.buildDrawerOptionWidget(name: TIRCalculatorStrings.TITLE.toUpperCase(), onTapFun: (){updateStateWithNewView<TIRCalculatorView>();}),
                CommonWidgets.buildDrawerOptionWidget(name: FactoringCalculatorStrings.TITLE.toUpperCase(), onTapFun: (){updateStateWithNewView<FactoringCalculatorPage>();}),
              ],
            ),
          ),
        ),
        backgroundColor: FinanzappColorsLightMode.MAIN_BACKGROUND_COLOR,
        body: _currentView,
      ) : Scaffold(
        body: Container(),
      ),
    );
  }
}