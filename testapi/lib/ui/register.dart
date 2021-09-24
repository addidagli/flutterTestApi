import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _nameController = TextEditingController();
  final _mailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _checkPasswordController = TextEditingController();
  final _cityController = TextEditingController();
  final _professionController = TextEditingController();
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
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_circle),
                      hintText: "Full Name",
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
                  TextFormField(
                    obscureText: true,
                    controller: _checkPasswordController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: "Confirm Password",
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    //controller: _dogumYiliController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.date_range),
                      hintText: "Birth Year(example: 1996)",
                    ),
                  ),
                  TextFormField(
                    controller: _cityController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_city),
                      hintText: "City",
                    ),
                  ),
                  TextFormField(
                    controller: _professionController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.card_travel),
                      hintText: "Proffesion",
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: 300,
                    child: FlatButton(
                      onPressed: () {
                        //register();
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  /*register(String email, String pass) async {
    Map data = {'email': email, 'password': pass};
    var jsonResponse = null;
    debugPrint("email: " + email + " pass: " + pass);
    var response = await http.post(
        "https://anybwnk52i.execute-api.eu-central-1.amazonaws.com/test/login",
        body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      userid = jsonResponse['data']['userId'];
      debugPrint(jsonResponse.toString());

      if (jsonResponse != null) {
        setState(() {
          _checklogin = false;
          isLoggedIn = true;
          change();
        });
      }
    } else {
      jsonResponse = json.decode(response.body);
      _message = jsonResponse['message'];
      setState(() {
        _checklogin = true;
      });
    }
  }*/
}
