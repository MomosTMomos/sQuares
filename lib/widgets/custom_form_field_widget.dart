import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomFormFieldWidget extends StatefulWidget {
  final formLabel;
  final validatorError;
  final formType;

  CustomFormFieldWidget(this.formLabel, this.validatorError, this.formType);

  @override
  CustomFormFieldWidgetState createState() => CustomFormFieldWidgetState();
}

class CustomFormFieldWidgetState extends State<CustomFormFieldWidget> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: new InputDecoration(
          labelText: widget.formLabel,
          labelStyle: TextStyle(color: Colors.white),
          fillColor: Colors.white,
          disabledBorder: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(15.0),
            borderSide: new BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(15.0),
            borderSide: new BorderSide(color: Colors.white),
          ),
          contentPadding: EdgeInsets.zero,
          prefixIcon: Icon(
            widget.formType == 'Text' ? Icons.email : widget.formType == 'Password' ? Icons.lock : Icons.lock_outline,
            color: Colors.white,
          ),
          suffixIcon: widget.formType == 'Text'
              ? null
              : GestureDetector(
                  onTap: () {
                    _toggleVisibility();
                  },
                  child: Icon(
                    _isObscure ? Icons.visibility : Icons.visibility_off,
                  ))

          //fillColor: Colors.green
          ),
      validator: (val) {
        if (val.length == 0) {
          return widget.validatorError;
        } else {
          return null;
        }
      },
      obscureText: widget.formType == "Text"
          ? false
          : _isObscure
              ? true
              : false,
      keyboardType: TextInputType.emailAddress,
      style: new TextStyle(
        color: Colors.white,
        fontFamily: "Poppins",
      ),
    );
  }

  _toggleVisibility() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }
}
