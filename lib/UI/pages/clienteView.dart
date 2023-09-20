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
    DateTime today = DateTime.now();
    String formattedDate = "${today.day}/${today.month}/${today.year}";
    String newSurname ="", newName="", newBirth="", newIBAN="", newAddress="";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFD1C4E9),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('info utente'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: 50),
              Text(
                'Profilo',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Icon(Icons.account_circle_outlined, size: 48),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.person_2_outlined),
                      SizedBox(width: 10),
                      Expanded(
                        child: ListTile(
                          title: Text('Cognome: '),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(widget.cliente.cognome),
                              SizedBox(width: 10),
                              TextButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("Modifica Cognome"),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text("Cognome"),
                                            TextFormField(
                                              onChanged: (value) {
                                                newSurname = value; // Aggiorna la variabile con il nuovo cognome
                                              },
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () async {
                                              // Chiudi il popup e chiama la funzione per la modifica
                                              Navigator.of(context).pop();
                                              await Model.sharedInstance.modifyUser(widget.cliente.email, newSurname, "cognome" );
                                              setState(() {
                                                widget.cliente.cognome(newSurname);
                                              });
                                            },
                                            child: Text("Conferma"),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(); // Chiudi il popup senza modifiche
                                            },
                                            child: Text("Cancella"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Text("Modifica"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.person_2_outlined),
                      SizedBox(width: 10),
                      Expanded(
                        child: ListTile(
                          title: Text('Nome: '),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(widget.cliente.nome),
                              SizedBox(width: 10),
                              TextButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("Modifica Nome"),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text("Nome"),
                                            TextFormField(
                                              onChanged: (value) {
                                                newName = value; // Aggiorna la variabile con il nuovo cognome
                                              },
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () async{
                                              // Chiudi il popup e chiama la funzione per la modifica
                                              Navigator.of(context).pop();
                                              await Model.sharedInstance.modifyUser(widget.cliente.email, newName, "nome");
                                              setState(() {
                                                widget.cliente.nome(newName);
                                              });
                                            },
                                            child: Text("Conferma"),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(); // Chiudi il popup senza modifiche
                                            },
                                            child: Text("Cancella"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Text("Modifica"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.email_outlined),
                      SizedBox(width: 10),
                      Expanded(
                        child: ListTile(
                          title: Text('email: '),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(widget.cliente.email),
                              SizedBox(width: 10),
                            ],
                          ),

                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.date_range),
                      SizedBox(width: 10),
                      Expanded(
                        child: ListTile(
                          title: Text('data nascita: '),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(widget.cliente.residenza),
                              SizedBox(width: 10),
                              TextButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("modifica data di nascita"),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text("data nascita"),
                                            TextFormField(
                                              onChanged: (value) {
                                                newBirth = value; // Aggiorna la variabile con il nuovo cognome
                                              },
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () async {
                                              // Chiudi il popup e chiama la funzione per la modifica
                                              Navigator.of(context).pop();
                                              await Model.sharedInstance.modifyUser(widget.cliente.email,newBirth,"data_nascita" );
                                              setState(() {
                                                widget.cliente.dataNascita(newBirth);
                                              });
                                            },
                                            child: Text("Conferma"),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(); // Chiudi il popup senza modifiche
                                            },
                                            child: Text("Cancella"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Text("Modifica"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(width: 10),
                      Expanded(
                        child: ListTile(
                          title: Text('residenza: '),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(widget.cliente.residenza),
                              SizedBox(width: 10),
                              TextButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("modifica residenza"),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text("residenza"),
                                            TextFormField(
                                              onChanged: (value) {
                                                newAddress = value; // Aggiorna la variabile con il nuovo cognome
                                              },
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () async{
                                              // Chiudi il popup e chiama la funzione per la modifica
                                              Navigator.of(context).pop();
                                              await Model.sharedInstance.modifyUser(widget.cliente.email, newAddress, "residenza") ;
                                              setState(() {
                                                widget.cliente.residenza(newAddress);
                                              });
                                            },
                                            child: Text("Conferma"),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(); // Chiudi il popup senza modifiche
                                            },
                                            child: Text("Cancella"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Text("Modifica"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.account_balance_outlined),
                      SizedBox(width: 10),
                      Expanded(
                        child: ListTile(
                          title: Text('IBAN: '),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(widget.cliente.IBAN),
                              SizedBox(width: 10),
                              TextButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("modifica IBAN"),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text("IBAN"),
                                            TextFormField(
                                              onChanged: (value) {
                                                newIBAN = value; // Aggiorna la variabile con il nuovo cognome
                                              },
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () async{
                                              // Chiudi il popup e chiama la funzione per la modifica
                                              Navigator.of(context).pop();
                                              await Model.sharedInstance.modifyUser(widget.cliente.email, newIBAN, "iban" );
                                              setState(() {
                                                 widget.cliente.IBAN(newIBAN);
                                              });
                                            },
                                            child: Text("Conferma"),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(); // Chiudi il popup senza modifiche
                                            },
                                            child: Text("Cancella"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Text("Modifica"),
                              ),
                            ],
                          ),

                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.account_box),
                      SizedBox(width: 10),
                      Expanded(
                        child: ListTile(
                          title: Text('documento identità: '),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(widget.cliente.docID),
                              SizedBox(width: 10),
                            ],
                          ),

                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.account_circle_outlined),
                      SizedBox(width: 10),
                      Expanded(
                        child: ListTile(
                          title: Text('username: '),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(widget.cliente.username),
                              SizedBox(width: 10),
                            ],
                          ),

                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.accessibility_outlined),
                      SizedBox(width: 10),
                      Expanded(
                        child: ListTile(
                          title: Text('stato fedelta: '),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(widget.cliente.statoFedelta),
                              SizedBox(width: 10),
                            ],
                          ),

                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.monetization_on_outlined),
                      SizedBox(width: 10),
                      Expanded(
                        child: ListTile(
                          title: Text('saldo conto gioco: '),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(widget.cliente.saldoGioco as String),
                              SizedBox(width: 10),
                            ],
                          ),

                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.account_balance_wallet_outlined),
                      SizedBox(width: 10),
                      Expanded(
                        child: ListTile(
                          title: Text('saldo punti: '),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(widget.cliente.saldoPunti as String),
                              SizedBox(width: 10),
                            ],
                          ),

                        ),
                      ),
                    ],
                  ),
                  /*IconButton(
                    icon: Icon(Icons.mode),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UserModificationPage()));
                    },
                  ),*/
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}