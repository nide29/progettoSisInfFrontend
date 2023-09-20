import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:sisinf/UI/pages/allClienti.dart';
import 'package:sisinf/models/Cliente.dart';

import '../../restManagers/HttpRequest.dart';

class RicercaClienti extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(elevation: 0,
          backgroundColor: const Color.fromRGBO(255, 199, 0, 1),
          title: Text(
            'LISTA CLIENTI',
            style:
            TextStyle(color: Colors.white, fontSize: 24, fontFamily: 'Avenir', fontWeight: FontWeight.bold),
          ),
        ),
        body:
            allClienti(),

    );

  }




}
