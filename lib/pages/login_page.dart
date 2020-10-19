import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:squares/widgets/back_register_widget.dart';
import 'package:squares/widgets/front_login_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Opacity(
              opacity: 0.9,
              child: Container(
                width: 1000,
                height: 1080,
                child: Image.asset('assets/images/app_background.png', fit: BoxFit.fitWidth, color: Colors.deepPurple[300],)
              ),
            ),
          ),
          Container(
            child: Center(
              child: FlipCard(
                direction: FlipDirection.HORIZONTAL, // default
                front: FrontLoginWidget(),
                back: BackRegisterWidget(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
