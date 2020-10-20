import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:squares/pages/home_page.dart';
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
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          return Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1),
              child: ConstrainedBox(
                constraints: new BoxConstraints(maxHeight: 400, maxWidth: 400),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(15)),
                  height: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? MediaQuery.of(context).size.height * 0.7
                      : MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Center(
                      child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Welcome to sQuares",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize:
                                MediaQuery.of(context).size.width / 100 + 15,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.075,
                              vertical: 7.5),
                          child: CustomFormFieldWidget(
                              'User',
                              'This field cannot be null.',
                              "Text",
                              updateEmailFormValue),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.075,
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
                              child: Text(
                                "Forgot password? Recover it here!",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.075,
                          ),
                          child: CustomLoginButton('LOGIN', submit),
                        )
                      ],
                    ),
                  )),
                ),
              ),
            ),
          );
        });
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

  submit() async {
    await Firebase.initializeApp();
    FirebaseAuth auth = FirebaseAuth.instance;
    var registerError = false;
    var error = "";

    if (passwordField.length > 5) {
      try {
        await auth.signInWithEmailAndPassword(
            email: emailField, password: passwordField);
      } catch (e) {
        print(e);
        error = e.message.toString();
        registerError = true;
      }
    }

    if (!registerError) {
      final snackBar = SnackBar(
        content: Text('User logged with sucess!'),
      );
      Scaffold.of(context).showSnackBar(snackBar);
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      final snackBar = SnackBar(
        content: Text(error),
      );

      Scaffold.of(context).showSnackBar(snackBar);
    }
  }
}
