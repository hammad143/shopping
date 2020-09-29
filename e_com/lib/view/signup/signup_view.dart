import 'package:device_preview/device_preview.dart';
import 'package:e_com/util/constants/color_const.dart';
import 'package:e_com/util/constants/main_const.dart';
import 'package:e_com/view/responsive_setup/device_size_config.dart';
import 'package:e_com/view/responsive_setup/device_type_layout.dart';
import 'package:e_com/view/responsive_setup/local_widget_builder.dart';
import 'package:e_com/view/signup/components/custom_text_field.dart';
import 'package:e_com/view/signup/components/form_fields.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController email = TextEditingController(),
      pass = TextEditingController(),
      cpass = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    print(email.text);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 0, horizontal: kDefaultPadding),
        child: DeviceTypeLayout(
          landscape: Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: DeviceSizeConfig.widgetScaleFactor * 80,
                child: _signupImage(),
              ),
              Expanded(
                  child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: FormFields(
                  emailController: email,
                  passController: pass,
                  cpassController: cpass,
                  onCheckBoxPress: onCheckBoxPress,
                  isChecked: isChecked,
                ),
              )),
            ],
          ),
          portrait: Column(
            children: [
              //sign up image
              _signupImage(),
              //Form Fields
              FormFields(
                emailController: email,
                passController: pass,
                cpassController: cpass,
                onCheckBoxPress: onCheckBoxPress,
                isChecked: isChecked,
              ),
              //spacer
            ],
          ),
        ),
      ),
    );
  }

  onCheckBoxPress() {
    setState(() => isChecked = !isChecked);
  }

  Widget _signupImage({String image = "assets/onboard/5.png"}) {
    return Image.asset(image);
  }
}

class PasswordField extends StatefulWidget {
  final TextEditingController _passController;
  final String hintText;
  PasswordField({TextEditingController passwordController, this.hintText = ""})
      : _passController = passwordController;
  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: DeviceSizeConfig.widgetScaleFactor * 10,
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultPadding * 2),
        color: kPrimaryColor,
      ),
      child: TextField(
        style: TextStyle(color: Colors.white),
        controller: widget._passController,
        obscureText: _isVisible,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 15, top: 15),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.white),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          suffixIcon: IconButton(
            onPressed: showPass,
            icon: _isVisible
                ? Icon(Icons.visibility_off)
                : Icon(Icons.visibility),
            color: Colors.white,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
        ),
      ),
    );
  }

  showPass() => setState(() {
        _isVisible = !_isVisible;
      });
}
