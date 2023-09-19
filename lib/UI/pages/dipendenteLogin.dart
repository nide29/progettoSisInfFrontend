import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:sisinf/UI/pages/RegistraCliente.dart';
import 'package:sisinf/UI/pages/homepage.dart';

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




  Future<String?> _authUser(LoginData data) async {
    return Future.delayed(loginTime).then((_) {
      return Model.sharedInstance.logIn(data.name, data.password);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'RUSH BET',
      logo: AssetImage('images/RUSHBET_Logo.png'),
      onLogin: _authUser,
      onSubmitAnimationCompleted: () {
        //Navigator.of(context).pushReplacementNamed('/homePageAuth');
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => HomePage())));
      },
      hideForgotPasswordButton: true,
      onRecoverPassword: (String ) {  },
    );
  }

}