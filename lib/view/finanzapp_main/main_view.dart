import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';
import 'package:proyecto_finanzas/model/data_base/shared_preference_data.dart';
import 'package:proyecto_finanzas/model/data_base/user_model/user.dart';
import 'package:proyecto_finanzas/view/effective_rate/effective_rate_view.dart';
import 'package:proyecto_finanzas/view/factoring_calculator_view/factoring_calculator_page.dart';
import 'package:proyecto_finanzas/view/finanzapp_main/widgets/drawer_widget.dart';
import 'package:proyecto_finanzas/view/history/history_page.dart';
import 'package:proyecto_finanzas/view/history/objects/receipt_object.dart';
import 'package:proyecto_finanzas/view/nominal_rate/nominal_rate_view.dart';
import 'package:proyecto_finanzas/view/see_equivalencies/see_equivalencies_view.dart';
import 'package:proyecto_finanzas/view/settings/settings_view.dart';
import 'package:proyecto_finanzas/view/sign_in/sign_in_view.dart';
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
  bool loggedIn = false;
  String appBarTitle = MainViewStrings.HISTORY.toUpperCase();
  User user;

  doLogoutFun(){
    SharedPreferenceData.cleanData();
    loggedIn = false;
  }

  //This method helps the app to update the state of the view after user selects an option from the drawer
  //It also helps to close the drawer
  updateStateWithNewView<T>(bool loggedOut){
    setState(() {
      if (loggedOut){
        doLogoutFun();
      } else {
        if (T == HistoryPage){
          appBarTitle = MainViewStrings.HISTORY;
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
          appBarTitle = MainViewStrings.CALCULATOR;
          _currentView = TIRCalculatorView();
        } else if (T == FactoringCalculatorPage){
          _currentView = FactoringCalculatorPage(receiptObject: new ReceiptObject(0, 0, DateTime.now(), DateTime.now(), "", 0),);
        } else if (T == SettingsView){
          appBarTitle = MainViewStrings.SETTINGS;
          _currentView = SettingsView();
        } else {
          _currentView = HistoryPage();
        }
      }
    });
    Navigator.pop(context);
  }

  loginSuccessFun(){
    setState(() {
      loggedIn = true;
    });
  }

  Widget _buildMainView(){
    if (finishInitialLoading){
      if (loggedIn){
        getCurrentUser();
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Center(
                child: Text(appBarTitle, style: FinanzappStyles.titleStyle2,),
              ),
            ),
            drawer: Drawer(
              child: DrawerWidget(updateStateWithNewView, user),
            ),
            backgroundColor: FinanzappColorsLightMode.MAIN_BACKGROUND_COLOR,
            body: _currentView,
          ),
        );
      } else {
        return SafeArea(
          child: Scaffold(
            backgroundColor: FinanzappColorsLightMode.MAIN_BACKGROUND_COLOR,
            body: SignInView(loginSuccessFun),
          ),
        );
      }
    }
    return SafeArea(
      child: Scaffold(
        body: Container(),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferenceData.getToken().then((token){
      if (token != null && token.isNotEmpty){
        setState(() {
          loggedIn = true;
        });
      }
    });
  }

  getCurrentUser() {
    SharedPreferenceData.getUser().then((_user){
      setState(() {
        user = _user;
      });
    });
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
    return _buildMainView();
  }
}