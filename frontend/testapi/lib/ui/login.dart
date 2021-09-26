import 'package:flutter/material.dart';
import 'package:testapi/models/user.dart';
import 'package:testapi/ui/mainpage.dart';
import 'package:testapi/ui/register.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'globals.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  String msg = "";

    @override
  void initState() {
    super.initState();
    msg = "";
  }



  final _mailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text(
            "LOGIN",
            style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://image.itea3.org/ehZSjd3DphavX59FX_WNDctDvas=/350x/center/https://itea4.org/img/o/2274-1569423691.jpg'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _mailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: "Email",
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: "Password",
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: 300,
                    child: FlatButton(
                      onPressed: () {
                        login(_mailController.text,_passwordController.text);
                      },
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold),
                      ),
                      color: Colors.blue[400],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: 300,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return Register();
                        }));
                      },
                      child: Text(
                        "REGISTER",
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold),
                      ),
                      color: Colors.green[400],
                    ),
                  ),
                  Text(msg,style: TextStyle(fontSize: 20,color: Colors.red),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  login(String email, String pass) async {
    Map data = {'email': email, 'password': pass};
    var jsonResponse = null;
    var body = json.encode(data);

    var response = await http.post("http://10.0.2.2:5000/api/v1/users/Login",
        headers: {"Content-Type": "application/json"}, body: body);

    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      userid = jsonResponse['data']['id'].toString();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (BuildContext context) {
        return MainPage();
      }));
    } else {
      setState(() {
        msg = "Kullanıcı adı veya şifre yanlış";
      });
      
    }
  }
}
