import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:sisinf/models/Cliente.dart';

import '../../restManagers/HttpRequest.dart';

class RicercaClienti extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _RicercaClienti();
}

class _RicercaClienti extends State<RicercaClienti> {

  static List<Cliente> list = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    print("LISTA: " + list.toString());

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
        body: Container(
          height: (list.length / 4).ceil() * 350,
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: FutureBuilder<List<Cliente>>(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(color: Colors.grey);
              } else if (snapshot.hasData) {
                list = snapshot.data!;
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 30),
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = list[index];
                    return CustomCard(
                        color: Colors.white,
                        borderColor: Colors.grey.withOpacity(0.3),
                        elevation: 12,
                        onTap: () {
                          //Navigator.push(context, MaterialPageRoute(builder: ((context) => ProductDetails(prodotto: item))));
                        },
                        borderRadius: 18,
                        shadowColor: Colors.grey.withOpacity(0.12),
                        child: Stack(children: [
                          Align(
                            alignment: const Alignment(0, -0.8),
                            child: Container(
                                height: 200,
                                width: 200,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Icon(Icons.account_box_rounded)),
                          ),
                          Align(
                            alignment: const Alignment(0, 0.5),
                            child: Text(
                              '${item.nome} ${item.cognome}', //categoria del prodotto
                              style: const TextStyle(
                                  color: Colors.black87,
                                  fontFamily: 'Avenir',
                                  letterSpacing: 1.0),
                            ),
                          ),
                          Align(
                            alignment: const Alignment(0, 0.8),
                            child: Text(
                              '${item.email}', //categoria del prodotto
                              style: const TextStyle(
                                  color: Colors.black87,
                                  fontFamily: 'Avenir',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ]));
                  },
                );
              } else {
                return Container(); //return di default altrimenti dart si arrabbia :)
              }
            },
          ),
        ));
  }

  Future<List<Cliente>> fetchData() async {
    print("FETCH1");
    List<Cliente> value = await Model.sharedInstance.getAllCliente();
    print("VALUE: " + value.toString());
    return value;
  }



}
