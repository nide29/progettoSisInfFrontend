
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sisinf/models/Dipendente.dart';

import '../restManagers/HttpRequest.dart';

class ViewDipendente extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => ViewDipendenteState();

}

class ViewDipendenteState extends State<ViewDipendente>{
  
  late Dipendente dipendente;

  Future<Dipendente?> _loadDipendente(String email) async {
    Dipendente? d = await Model.sharedInstance.viewUser(email);
    print(d?.toJson().toString());
    return d;
  }

  String? _loadEmail() {
    String? email =  Model.sharedInstance.getDipendenteFromToken();
    return email;
  }

  @override
  void initState() {
    super.initState();
    String? e = _loadEmail();
    _loadDipendente(e!).then((loadedDip) {
      setState(() {
        dipendente = loadedDip!;
      });
    });
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Color.fromRGBO(32, 79, 161, 1),
        child: Column(
          children: [
            Icon(Icons.account_circle_rounded, size: 180),
            SizedBox(height: 50),
            Text("${dipendente.nome}"),
            SizedBox(height: 20),
            Text("${dipendente.cognome}"),
            SizedBox(height: 20),
            Text("${dipendente.email}"),

          ],
        )
      //BODY
    )
  }
  
  
}
