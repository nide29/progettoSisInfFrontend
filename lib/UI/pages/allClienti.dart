import 'package:flutter/material.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:sisinf/UI/pages/ricercaClienti.dart';

import '../../models/Cliente.dart';
import '../../restManagers/HttpRequest.dart';
import 'clienteView.dart';

class allClienti extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ClientiGridState();

}

class _ClientiGridState extends State<allClienti>{

  static List<Cliente> listaClienti = List.empty(growable: true);

  Future<List<Cliente>?> _loadProducts() async {
    try {
      // Effettua la chiamata API per ottenere la lista dei prodotti
      listaClienti = await Model.sharedInstance.getAllCliente();
      return listaClienti;
    } catch (e) {
      // Gestisci eventuali errori qui, ad esempio mostrando un messaggio all'utente
      print('Errore durante il caricamento dei prodotti: $e');
      return null; // Restituisce null in caso di errore
    }
  }

  @override
  void initState(){
    super.initState();
    _loadProducts().then((loadProducts){
      setState(() {
        listaClienti = loadProducts!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //fetchData();
    //print("LISTA: " + list.toString());

    return Scaffold(
        body: Container(
          height: (listaClienti.length / 4).ceil() * 350,
          padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
          child: FutureBuilder<List<Cliente>>(
            future: fetchData(),
            builder: (context, snapshot) {
              //if (snapshot.connectionState == ConnectionState.waiting) {
                //return const CircularProgressIndicator(color: Colors.grey);
              //} else if (snapshot.hasData) {
                //print("QUI CI ENTRA?");
                //list = snapshot.data!;
                //print("LISTAAAA: " + list.toString());
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 30),
                  itemCount: listaClienti.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = listaClienti[index];
                    print("CLIENTEEE: " + item.nome);
                    return CustomCard(
                        color: Colors.white,
                        borderColor: Colors.grey.withOpacity(0.3),
                        elevation: 12,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: ((context) => ClienteView(cliente: item))));
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
                                child: Icon(Icons.account_box_rounded, size: 200)),
                          ),
                          Align(
                            alignment: const Alignment(0, 0.5),
                            child: Text(
                              '${item.nome.toString().toUpperCase()} ${item.cognome.toString().toUpperCase()}', //categoria del prodotto
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
              //} else {
                //print("NON HA DATI");
                //return Container(); //return di default altrimenti dart si arrabbia :)
              //}
            },
          ),
        ));
  }

  Future<List<Cliente>> fetchData() async {
    List<Cliente> value = await Model.sharedInstance.getAllCliente();
    return value;
  }
}