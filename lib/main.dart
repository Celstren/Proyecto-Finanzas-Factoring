import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_colors.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/view/finanzapp_main/main_view.dart';

void main(){
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: MainViewStrings.MAIN_TITLE,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: FinanzappColorsLightMode.MAIN_THEME,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: MainView(),
    );
  }
}
