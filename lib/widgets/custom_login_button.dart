import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomLoginButton extends StatefulWidget {
  final buttonText;
  final submit;

  CustomLoginButton(this.buttonText, this.submit);

  @override
  CustomLoginButtonState createState() => CustomLoginButtonState();
}

class CustomLoginButtonState extends State<CustomLoginButton> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 5,
      onPressed: () {
        // ignore: unnecessary_statements
        widget.submit();
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
      padding: const EdgeInsets.all(0.0),
      child: Ink(
        decoration: const BoxDecoration(
          gradient:
              LinearGradient(colors: [Colors.deepPurpleAccent, Colors.purple]),
          borderRadius: BorderRadius.all(Radius.circular(80.0)),
        ),
        child: Container(
          constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
          // min sizes for Material buttons
          alignment: Alignment.center,
          child: Text(
            widget.buttonText,
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
