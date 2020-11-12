import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Welcome/components/body.dart';
import 'package:flutter_app/constants.dart';

class WelcomeScreen extends StatelessWidget {
  static String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Center(
                child: Text(
              'Message Panel',
              style: TextStyle(color: Colors.white),
            )),
            backgroundColor: kPrimaryColor,
            elevation: 5,
          ),
          body: Body(),
        );
  }
}
