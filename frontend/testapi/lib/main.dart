import 'package:flutter/material.dart';
import 'package:testapi/ui/login.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: "/",
      routes: {
        '/': (context) => Login(),
        //'/bildirim': (context) => Bildirim(),
      },
      debugShowCheckedModeBanner: false,

      //home: NavigasyonIslemleri()
    ),
  );
}