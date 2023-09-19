import 'package:flutter/material.dart';
import 'package:sisinf/UI/pages/ricercaClienti.dart';

class ClientiGrid extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ClientiGridState();

}

class _ClientiGridState extends State<ClientiGrid>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orangeAccent,
        title: Text(
          'CLIENTI',
          style: TextStyle(
              color: Colors.blue, fontSize: 24, fontFamily: 'Avenir'),
        ),
      ),
      body: RicercaClienti()
    );

  }
}