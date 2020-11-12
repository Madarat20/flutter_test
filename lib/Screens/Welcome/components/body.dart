import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../welcome_screen.dart';

class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BodyState();
  }
}

class _BodyState extends State<Body> {
  Future<List<Accounts>> _getData() async {
    var url = 'http://10.0.10.52:2020/flutterList.php';
    var data = await http.post(url, body: {"ID": WelcomeScreen.id});
    //var data = await http.get(url);
    var allData = json.decode(data.body);

    List<Accounts> accounts = [];

    for (var item in allData) {
      Accounts a =
          Accounts(item['Account'].toString(), item['Balance'].toString());
      accounts.add(a);
    }
    
    return accounts;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          FutureBuilder(
              future: _getData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    child: Center(
                      child: Text("Loading..."),
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return ListTile(
                        title: Text(
                          'الحساب:   '+snapshot.data[index].account,
                          textDirection: TextDirection.rtl,
                        ),
                        subtitle: Text(
                          'الرصيد:   '+snapshot.data[index].balance,
                          textDirection: TextDirection.rtl,
                        ),
                      );
                    },
                  );
                }
              })
        ],
      ),
    );
  }
}

class Accounts {
  final String account;
  final String balance;

  Accounts(this.account, this.balance);
}

/*

Text(
                "WELCOME TO OUR SERVICE",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.05),
              RoundedButton(
                text: "BACK TO LOGIN",
                press: () {
                  Navigator.pushReplacementNamed(
                    context,
                    "/Login",
                  );
                },
              ),
              RoundedButton(
                text: "EXIT APP",
                color: kPrimaryLightColor,
                textColor: Colors.black,
                press: () async {
                  if (Theme.of(context).platform == TargetPlatform.iOS)
                    exit(0);
                  else
                    SystemNavigator.pop();
                },
              ),
            ],
          ),

*/
