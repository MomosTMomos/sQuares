import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:squares/firebase_controller.dart';

import 'custom_form_field_widget.dart';
import 'custom_login_button.dart';

class BackRegisterWidget extends StatefulWidget {
  @override
  BackRegisterWidgetState createState() => BackRegisterWidgetState();
}

class BackRegisterWidgetState extends State<BackRegisterWidget> {
  var emailField = "";
  var passwordField = "";
  var passwordConfirmationField = "";
  var loginResult = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery
                .of(context)
                .size
                .width * 0.3),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(15)),
          height: MediaQuery
              .of(context)
              .size
              .height * 0.6,
          width: MediaQuery
              .of(context)
              .size
              .width * 0.5,
          child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Create an account",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery
                            .of(context)
                            .size
                            .width / 50,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery
                              .of(context)
                              .size
                              .width * 0.075,
                          vertical: 7.5),
                      child: CustomFormFieldWidget(
                          'User', 'This field cannot be null.', "Text",
                          updateEmailFormValue),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery
                              .of(context)
                              .size
                              .width * 0.075,
                          vertical: 7.5),
                      child: CustomFormFieldWidget(
                          'Password', 'This field cannot be null.', "Password",
                          updatePasswordFormValue),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery
                              .of(context)
                              .size
                              .width * 0.075,
                          vertical: 7.5),
                      child: CustomFormFieldWidget('Confirmation',
                          'This field cannot be null.', "Password-Confirmation",
                          updatePasswordConfirmaionFormValue),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery
                            .of(context)
                            .size
                            .width * 0.075,
                      ),
                      child: CustomLoginButton('REGISTER', submit),
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

  updatePasswordConfirmaionFormValue(value) {
    setState(() {
      passwordConfirmationField = value;
    });
  }

  submit() {
    if (passwordField == passwordConfirmationField) {
      FirebaseController firebaseController = FirebaseController();
      firebaseController.register(emailField, passwordField).then((value) => () {
        setState(() {
          loginResult = value;
        });
      });
    }

    if (loginResult) {
      final snackBar = SnackBar(
        content: Text('User registered with success!'),
      );

      // Find the Scaffold in the widget tree and use
      // it to show a SnackBar.
      Scaffold.of(context).showSnackBar(snackBar);
    }
  }
}
