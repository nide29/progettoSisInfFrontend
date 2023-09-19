import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

import '../../restManagers/HttpRequest.dart';

class DipendenteLogin extends StatefulWidget {

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => DipendenteLogin(),
    );
  }

  @override
  _DipendenteLoginState createState() => _DipendenteLoginState();
}

class _DipendenteLoginState extends State<DipendenteLogin>{

  _DipendenteLoginState();
  Duration get loginTime => Duration(milliseconds: 2250);

  //PROVVISORIO
  void showSnackBarOK(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Order placed successfully!'),
      backgroundColor: Colors.green, // Colore di sfondo
      duration: Duration(seconds: 2), // Durata della SnackBar
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  //PROVVISORIO
  void showSnackBarKO(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Something went wrong!'),
      backgroundColor: Colors.red, // Colore di sfondo
      duration: Duration(seconds: 2), // Durata della SnackBar
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<String?> _authUser(LoginData data) async {
    return Future.delayed(loginTime).then((_) {
      return Model.sharedInstance.logIn(data.name, data.password);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'RUSH BET',
      //logo: AssetImage('assets/images/ecorp-lightblue.png'),
      onLogin: _authUser,
      onSubmitAnimationCompleted: () {
        showSnackBarOK(context);
        //Navigator.of(context).pushReplacementNamed('/homePageAuth');
      },
      hideForgotPasswordButton: true,
      onRecoverPassword: (String ) {  },
    );
  }

}