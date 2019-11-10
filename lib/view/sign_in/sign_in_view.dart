import 'package:flutter/material.dart';
import 'package:proyecto_finanzas/model/data_base/user_model/user_request.dart';
import 'package:proyecto_finanzas/view/register/register_view.dart';
import 'package:proyecto_finanzas/view/sign_in/widgets/forget_password_widget.dart';
import 'package:proyecto_finanzas/view/sign_in/widgets/no_member_widget.dart';
import 'package:proyecto_finanzas/view/sign_in/widgets/password_field_widget.dart';
import 'package:proyecto_finanzas/view/sign_in/widgets/sign_in_button_widget.dart';
import 'package:proyecto_finanzas/view/sign_in/widgets/title_widget.dart';
import 'package:proyecto_finanzas/view/sign_in/widgets/username_field_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proyecto_finanzas/helpers/finanzapp_strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInView extends StatefulWidget {
  final Function loginSuccessFun;

  const SignInView(this.loginSuccessFun);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SignInState();
  }

}

class _SignInState extends State<SignInView> {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordIsObscure = true;
  bool isLoading = false;

  displayPassword(){
    setState(() {
      passwordIsObscure = !passwordIsObscure;
    });
  }

  displayCreateAccount(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterView()));
  }

  loginProcessFun(){
    String trimmedMail = mailController.value.text.trimLeft().trimRight();
    String password = passwordController.value.text;
    if (trimmedMail.isNotEmpty && password.isNotEmpty){
      setState(() {
        isLoading = true;
      });
      UserRequest.userRequestLogin(trimmedMail, password).then((success){
        if (success){
          UserRequest.getCurrentUserRequest().then((success){
            if (success){
              Fluttertoast.showToast(msg: SignInStrings.LOGIN_SUCCESS_MESSAGE, fontSize: ScreenUtil.getInstance().setSp(24));
              widget.loginSuccessFun();
            } else {
              setState(() {
                isLoading = false;
              });
            }
          });
        } else {
          setState(() {
            isLoading = false;
          });
        }
      });
    } else if (trimmedMail.isEmpty){
      Fluttertoast.showToast(msg: SignInStrings.MAIL_EMPTY_ERROR_MESSAGE, fontSize: ScreenUtil.getInstance().setHeight(24));
    } else if (password.isEmpty){
      Fluttertoast.showToast(msg: SignInStrings.PASSWORD_EMPTY_ERROR_MESSAGE, fontSize: ScreenUtil.getInstance().setHeight(24));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SignInTitleWidget(),
              UsernameFieldWidget(mailController: mailController,),
              PasswordFieldWidget(passwordController: passwordController, displayPassword: displayPassword, passwordIsObscure: passwordIsObscure,),
              ForgetPasswordWidget(),
              SignInButtonWidget(loginProcessFun, isLoading),
              NoMemberWidget(createNewAccountFunction: displayCreateAccount,),
            ],
          ),
        ),
      ),
    );
  }

}