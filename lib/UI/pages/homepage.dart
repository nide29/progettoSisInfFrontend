import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    String nome = "dipendenteeeee";
    String email = "dipendent@eeeeee.eee";

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orangeAccent,
        title: Text(
          'GESTIONE CLIENTI',
          style:
              TextStyle(color: Colors.blue, fontSize: 24, fontFamily: 'Avenir'),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Color.fromRGBO(32, 79, 161, 1),
        child: Column(
          children: [
            Icon(Icons.account_circle_rounded, size: 180),
            SizedBox(height: 50),
            Text("nome"),
            SizedBox(height: 20),
            Text("cognome"),
            SizedBox(height: 20),
            Text("email@sssss"),

          ],
        )
        //BODY
      ),
    );
  }
}
