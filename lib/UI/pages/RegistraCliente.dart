import 'package:flutter/material.dart';

import '../../models/Cliente.dart';
import '../../restManagers/HttpRequest.dart';
import 'homepage.dart';

class RegistraCliente extends StatefulWidget {
  //const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistraCliente> {
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _cognomeController = TextEditingController();
  TextEditingController _residenzaController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _docIDController = TextEditingController();
  TextEditingController _dataNascitaController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _IbanController = TextEditingController();

  void _registerCliente() async {
    Cliente c = Cliente(null, _nomeController.text, _cognomeController.text, _docIDController.text, _emailController.text, _usernameController.text, _IbanController.text, _residenzaController.text, _dataNascitaController.text, null, null, null);
    Model.sharedInstance.register(c, _passwordController.value.text);

    _nomeController.clear();
     _cognomeController.clear();
     _residenzaController.clear();
     _emailController.clear();
     _docIDController.clear();
     _dataNascitaController.clear();
     _usernameController.clear();
     _passwordController.clear();
     _IbanController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(255, 199, 0, 1),
        title: Text(
          'REGISTRAZIONE CLIENTE',
          style:
          TextStyle(color: Colors.white, fontSize: 24, fontFamily: 'Avenir', fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _cognomeController,
              decoration: InputDecoration(labelText: 'Cognome'),
            ),
            TextField(
              controller: _residenzaController,
              decoration: InputDecoration(labelText: 'Residenza'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _docIDController,
              decoration: InputDecoration(labelText: 'Documento di Identità'),
            ),
            TextField(
              controller: _dataNascitaController,
              decoration: InputDecoration(labelText: 'Data di Nascita'),
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _IbanController,
              decoration: InputDecoration(labelText: 'IBAN'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(32, 79, 161, 1),
                onPrimary: Colors.white,
              ),
              onPressed: () {
                _registerCliente();
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Row(
                          children: [
                            const Text(
                                "Registrazione effettuata!\nClicca su OK per essere reindirizzato alla Home"),
                            MaterialButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation1,
                                          animation2) => HomePage(),
                                      transitionDuration:
                                      const Duration(seconds: 0),
                                      reverseTransitionDuration:
                                      const Duration(seconds: 0),
                                    ),
                                        (Route<dynamic> route) => false);
                              },
                              child: Text("OK"),
                            ),
                          ],
                        ),
                      );
                    });
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Registra",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

