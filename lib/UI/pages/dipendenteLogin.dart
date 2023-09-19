import 'package:flutter/material.dart';

class DipendenteLogin extends StatefulWidget {

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => DipendenteLogin(),
    );
  }

  @override
  _DipendenteLoginState createState() => _DipendenteLoginState();
}

class _DipendenteLoginState extends State<DipendenteLogin>{

  _DipendenteLoginState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'RUSH BET',
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontFamily: 'Avenir'),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),),
    );
  }

}