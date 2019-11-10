import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_styles.dart';
import 'package:proyecto_finanzas/view/register/widget/company_name_widget.dart';
import 'package:proyecto_finanzas/view/register/widget/first_name_widget.dart';
import 'package:proyecto_finanzas/view/register/widget/identification_widget.dart';
import 'package:proyecto_finanzas/view/register/widget/last_name_widget.dart';
import 'package:proyecto_finanzas/view/register/widget/mail_widget.dart';
import 'package:proyecto_finanzas/view/register/widget/password_widget.dart';
import 'package:proyecto_finanzas/view/register/widget/register_button_widget.dart';

class RegisterView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RegisterViewState();
  }

}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController identificationController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(RegisterStrings.NEW_ACCOUNT, style: FinanzappStyles.commonTextStyle9,),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                FirstNameWidget(firstNameController: firstNameController),
                LastNameWidget(lastNameController: lastNameController),
                IdentificationWidget(identificationController: identificationController,),
                MailWidget(mailController: mailController,),
                PasswordWidget(passwordController: passwordController,),
                CompanyNameWidget(companyNameController: companyNameController,),
                RegisterButtonWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

}