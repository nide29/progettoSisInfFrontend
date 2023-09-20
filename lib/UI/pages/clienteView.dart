import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/Cliente.dart';
import '../../restManagers/HttpRequest.dart';
import 'homepage.dart';

class ClienteView extends StatefulWidget {
  final Cliente cliente;

  ClienteView({required this.cliente});

  @override
  _ClienteViewState createState() => _ClienteViewState();

}

class _ClienteViewState extends State<ClienteView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(255, 199, 0, 1),
        title: Text(
          'CLIENTE: ${widget.cliente.nome.toString().toUpperCase()} ${widget.cliente.cognome.toString().toUpperCase()}',
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontFamily: 'Avenir', fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(

          children: [
            Icon(Icons.account_box_rounded, size: 320,),

            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'ID:  ${widget.cliente.id}',
                  style: const TextStyle(
                      color: Colors.black87, fontSize: 34, fontFamily: 'Avenir'),
                ),
              ),
            ),

            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'NOME:  ${widget.cliente.nome}',
                  style: const TextStyle(
                      color: Colors.black87, fontSize: 34, fontFamily: 'Avenir'),
                ),
              ),
            ),

            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'COGNOME:  ${widget.cliente.cognome}',
                  style: const TextStyle(
                      color: Colors.black87, fontSize: 34, fontFamily: 'Avenir'),
                ),
              ),
            ),

            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'EMAIL:  ${widget.cliente.email}',
                  style: const TextStyle(
                      color: Colors.black87, fontSize: 34, fontFamily: 'Avenir'),
                ),
              ),
            ),

            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'RESIDENZA:  ${widget.cliente.residenza}',
                  style: const TextStyle(
                      color: Colors.black87, fontSize: 34, fontFamily: 'Avenir'),
                ),
              ),
            ),

            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'DATA DI NASCITA:  ${widget.cliente.dataNascita}',
                  style: const TextStyle(
                      color: Colors.black87, fontSize: 34, fontFamily: 'Avenir'),
                ),
              ),
            ),

            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'IBAN:  ${widget.cliente.IBAN}',
                  style: const TextStyle(
                      color: Colors.black87, fontSize: 34, fontFamily: 'Avenir'),
                ),
              ),
            ),

            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'STATO FEDELTA:  ${widget.cliente.statoFedelta}',
                  style: const TextStyle(
                      color: Colors.black87, fontSize: 34, fontFamily: 'Avenir'),
                ),
              ),
            ),

            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'SALDO:  ${widget.cliente.saldoGioco}',
                  style: const TextStyle(
                      color: Colors.black87, fontSize: 34, fontFamily: 'Avenir'),
                ),
              ),
            ),

            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'PUNTI:  ${widget.cliente.saldoPunti}',
                  style: const TextStyle(
                      color: Colors.black87, fontSize: 34, fontFamily: 'Avenir'),
                ),
              ),
            ),

            Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 10),
                child: Container(
                  child: TextButton(
                    onPressed: () {
                      print("ID CLIENTE:" +widget.cliente.id.toString());
                      Model.sharedInstance.deleteCliente(widget.cliente.id.toString());

                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Row(
                                children: [
                                  const Text(
                                      "Account eliminato!\nClicca su OK per essere reindirizzato alla Home"),
                                  MaterialButton(
                                    onPressed: () {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (context, animation1,
                                                animation2) =>
                                            HomePage(),
                                            transitionDuration:
                                            const Duration(seconds: 0),
                                            reverseTransitionDuration:
                                            const Duration(seconds: 0),
                                          ),
                                              (Route<dynamic> route) => false);
                                    },
                                    child: const Text("OK"),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    child: const Text("Clicca qui per eliminare il tuo account. L'operazione è irreversible", style: TextStyle(color: Colors.red),),
                  ),
                ))


          ],
        ),

    );

  }

}