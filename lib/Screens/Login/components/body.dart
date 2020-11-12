import 'package:flutter/material.dart';
import './background.dart';
import 'package:flutter_app/components/rounded_button.dart';
import 'package:flutter_app/components/rounded_input_field.dart';
import 'package:flutter_app/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_app/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

class Body extends StatelessWidget {
  final TextEditingController edName = TextEditingController();
  final TextEditingController edPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.blueGrey),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.3,
            ),
            SizedBox(height: size.height * 0.04),
            RoundedInputField(
              editText: edName,
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              editText: edPass,
              onChanged: (value) {},
            ),
            SizedBox(height: size.height * 0.04),
            RoundedButton(
              text: "LOGIN",
              press: () async {
                String data = await login(edName.text, edPass.text);
                if (data != "ليس هناك اي حساب بهذه البيانات") {
                  WelcomeScreen.id=data;
                  Navigator.pushReplacementNamed(context, "/Home");
                } else {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    duration: Duration(milliseconds: 700),
                    content: Text(
                      data,
                      textAlign: TextAlign.end,
                    ),
                  ));
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }
}

Future<String> login(String email, String pass) async {
  var url = "http://10.0.10.52:2020/loginTest.php";

  var res = await http.post(url, body: {"Email": email, "Password": pass});

  return res.body;
}
