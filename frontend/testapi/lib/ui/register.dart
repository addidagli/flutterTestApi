import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testapi/models/register_user.dart';
import 'package:testapi/models/user.dart';
import 'package:testapi/ui/globals.dart';
import 'package:testapi/ui/login.dart';

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _mailController = TextEditingController();
  final _passwordController = TextEditingController();
  String msg = "";

  User user;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: Padding(
          padding: const EdgeInsets.only(right: 80),
          child: Center(
            child: Text(
              "REGISTER",
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                children: <Widget>[
                  Container(
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
                    height: 20,
                  ),
                  TextFormField(
                    controller: _firstnameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_circle),
                      hintText: "First Name",
                    ),
                  ),
                  TextFormField(
                    controller: _lastnameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_circle),
                      hintText: "Last Name",
                    ),
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
                        register(
                            _firstnameController.text,
                            _lastnameController.text,
                            _mailController.text,
                            _passwordController.text);
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
                  Text(msg,style: TextStyle(fontSize: 20,color:Colors.red)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  register(String firstname, String lastname, String email, String pass) async {
    /*final registerrequest = RegisterUserRequestModel(
      firstname: firstname,
      lastname: lastname,
      email: email,
      password: pass,
    );*/
    Map data = {
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'password': pass
    };
    var jsonResponse = null;
    var body = json.encode(data);

    var response = await http.post("${url}/Register",
        headers: {"Content-Type": "application/json"}, body: body);

    print(response.statusCode.toString());

    if (response.statusCode == 200) {
    
      if (response.body.isNotEmpty) {
        jsonResponse = json.decode(response.body);
        print(jsonResponse.toString());
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return Login();
        }));
      } else {
        print("kkk");
      }
    } else {
      setState(() {
        msg = "Kayıt başarısız";
      });
    }
  }
}
