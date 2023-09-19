import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:sisinf/UI/pages/RegistraCliente.dart';
import 'package:sisinf/UI/pages/allClienti.dart';
import 'package:sisinf/UI/pages/ricercaClienti.dart';

import '../../models/Dipendente.dart';
import '../../restManagers/HttpRequest.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  /*Future<Dipendente?> _loadDipendente(String email) async {
    Dipendente? d = await Model.sharedInstance.viewUser(email);
    print(d?.toJson().toString());
    return d;
  }*/

  String? _loadEmail() {
    String? email =  Model.sharedInstance.getDipendenteFromToken();
    return email;
  }


  @override
  Widget build(BuildContext context) {

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
      //persistentFooterAlignment: AlignmentDirectional.center,
      drawer: const Drawer(
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
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 100)),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [

              SizedBox(
                height: 350,
                width: 350,
                child: FloatingActionButton(
                  heroTag: 'btn1',
                  foregroundColor: Colors.black87,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: ((context) => RegistraCliente())));
                  },

                    child: Column(children: [
                      Padding(padding: EdgeInsets.only(top: 75)),

                      Align(
                        alignment: Alignment.center, //Alignment(-0.3, -0.3),
                        child: Icon(
                          Icons.person_add_alt_1_rounded,
                          size: 180,
                          color: Colors.black.withOpacity(0.8),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center, //Alignment(0, 0.8),
                        child: Text(
                          'AGGIUNGI CLIENTE', //categoria del prodotto
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 20,
                              fontFamily: 'Avenir',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ]),

                ),
              ),

              SizedBox(
                height: 350,
                width: 350,
                child: FloatingActionButton(
                  heroTag: 'btn2',
                  foregroundColor: Colors.black87,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: ((context) => ClientiGrid())));
                  },
                  child: Center(
                    child: Column(children: [
                      Padding(padding: EdgeInsets.only(top: 75)),

                      Align(
                        alignment: Alignment.center, //Alignment(-0.3, -0.3),
                        child: Icon(
                          Icons.groups,
                          size: 180,
                          color: Colors.black.withOpacity(0.8),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center, //Alignment(0, 0.8),
                        child: Text(
                          'RICERCA CLIENTI', //categoria del prodotto
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 20,
                              fontFamily: 'Avenir',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ]),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
