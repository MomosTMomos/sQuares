import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:squares/firebase_controller.dart';
import 'package:squares/widgets/custom_form_field_widget.dart';
import 'package:squares/widgets/custom_login_button.dart';

class FrontLoginWidget extends StatefulWidget {
  @override
  FrontLoginWidgetState createState() => FrontLoginWidgetState();
}

class FrontLoginWidgetState extends State<FrontLoginWidget> {
  var emailField = "";
  var passwordField = "";
  var loginResult = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.31),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(15)),
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.4,
          child: Center(
              child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Welcome to sQuares",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width / 50,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.075,
                      vertical: 7.5),
                  child: CustomFormFieldWidget(
                      'User',
                      'This field cannot be null.',
                      "Text",
                      updateEmailFormValue),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.075,
                      vertical: 7.5),
                  child: CustomFormFieldWidget(
                      'Password',
                      'This field cannot be null.',
                      "Password",
                      updatePasswordFormValue),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text("Forgot password? Recover it here!", style: TextStyle(color: Colors.white),)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.075,
                  ),
                  child: CustomLoginButton('LOGIN', submit),
                )
              ],
            ),
          )),
        ),
      ),
    );
  }

  updateEmailFormValue(value) {
    setState(() {
      emailField = value;
    });
  }

  updatePasswordFormValue(value) {
    setState(() {
      passwordField = value;
    });
  }

  submit() {
    FirebaseController firebaseController = FirebaseController();
    firebaseController.login(emailField, passwordField).then((value) => () {
          setState(() {
            loginResult = value;

            ///TODO Navigate to main page.
          });
        });
  }
}
