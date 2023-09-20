
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sisinf/models/Dipendente.dart';

import '../restManagers/HttpRequest.dart';

class ViewDipendente extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => ViewDipendenteState();

}

class ViewDipendenteState extends State<ViewDipendente>{
  
  static Dipendente? dipendente = Dipendente(1,'a','a','a','a','a','a','a','a','a');

  Future<Dipendente?> _loadDipendente(String email) async {
    Dipendente? d = await Model.sharedInstance.viewUser(email);
    print("DIPENDENTEEEE: " + d!.toJson().toString());
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
        print("DIPENDENTE! : " + dipendente.toString());
      });
    });
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Color.fromRGBO(32, 79, 161, 1),
        child: Column(
          children: [
            Icon(Icons.account_circle_rounded, size: 180, color: Colors.white),
            SizedBox(height: 50),
            Text('INFO DIPENDENTE', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
            SizedBox(height: 30),
            Text("ID: ${dipendente!.id}", style: TextStyle(color: Colors.white, fontSize: 20)),
            SizedBox(height: 20),
            Text("${dipendente!.nome}", style: TextStyle(color: Colors.white, fontSize: 20),),
            SizedBox(height: 20),
            Text("${dipendente!.cognome}", style: TextStyle(color: Colors.white, fontSize: 20)),
            SizedBox(height: 20),
            Text("${dipendente!.email}", style: TextStyle(color: Colors.white, fontSize: 20)),
            SizedBox(height: 20),
            Text("${dipendente!.ruolo}", style: TextStyle(color: Colors.white, fontSize: 20)),


          ],
        )
      //BODY
    );
  }
  
  
}
