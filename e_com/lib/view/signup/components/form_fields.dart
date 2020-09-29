import 'package:e_com/util/constants/color_const.dart';
import 'package:e_com/util/constants/main_const.dart';
import 'package:e_com/util/constants/style.dart';

import 'package:e_com/view/signup/components/already_have_account.dart';
import 'package:e_com/view/signup/components/custom_text_field.dart';
import 'package:e_com/view/signup/components/sign_up_btn.dart';

import 'package:flutter/material.dart';

class FormFields extends StatefulWidget {
  final TextEditingController emailController, passController, cpassController;
  final VoidCallback onCheckBoxPress;
  final bool isChecked;

  FormFields({
    Key key,
    this.emailController,
    this.passController,
    this.cpassController,
    this.onCheckBoxPress,
    this.isChecked,
  }) : super(key: key);

  @override
  _FormFieldsState createState() => _FormFieldsState();
}

class _FormFieldsState extends State<FormFields> {
  bool isPassVisible = false, isChecked = false;
  final k = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextField(
          controller: widget.emailController,
          hintText: "Enter an email",
        ),
        SizedBox(height: kDefaultSpacer),
        CustomTextField(
          controller: widget.passController,
          hintText: "Enter a password",
          contentPadding: EdgeInsets.only(left: 10, top: 15),
          obscureText: true,
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.visibility_off,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: kDefaultSpacer),
        CustomTextField(
          controller: widget.cpassController,
          hintText: "Enter a confirm password",
          obscureText: true,
          contentPadding: EdgeInsets.only(left: 10, top: 15),
          suffixIcon: IconButton(
            splashColor: transparent,
            splashRadius: 1,
            onPressed: () {
              print("pressed");
            },
            icon: Icon(
              Icons.visibility_off,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: kDefaultSpacer),
        GestureDetector(
          onTap: widget.onCheckBoxPress,
          child: Row(
            children: [
              Checkbox(
                activeColor: kPrimaryColor,
                value: widget.isChecked,
                onChanged: (value) => widget.onCheckBoxPress(),
              ),
              Text(
                "I accept the terms and conditions",
                style: Style.black54,
              ),
            ],
          ),
        ),
        SizedBox(height: kDefaultSpacer),
        SignUpButton(),
        SizedBox(height: kDefaultSpacer),
        AlreadyHaveAccount(),
      ],
    );
  }
}
