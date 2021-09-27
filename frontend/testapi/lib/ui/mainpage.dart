import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testapi/models/user.dart';
import 'package:testapi/ui/globals.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  User user;

  Future<User> _gonderiGetir() async {
    final _getUsers =
        "${url}/GetUsers";
    var response = await http.get(_getUsers);
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Bağlanamadık ${response.statusCode}");
    }
  }

  @override
  void initState() {
    super.initState();
    debugPrint("addi");
    _gonderiGetir().then((okunanGonderi) {
      user = okunanGonderi;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            Expanded(
                child: FutureBuilder(
              future: _gonderiGetir(),
              builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    children: snapshot.data.data
                        .map((doc) => Card(
                              child: Container(
                                child: ListTile(
                                  leading: Icon(Icons.account_circle_rounded),
                                  title: Row(
                                    children: [
                                      Text(
                                        doc.firstname +
                                            " " +
                                            doc.lastname,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                  subtitle: Text(
                                    doc.email,
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ))
          ],
        ),
      ),
    );
  }
}
