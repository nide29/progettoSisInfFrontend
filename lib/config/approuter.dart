import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sisinf/UI/pages.dart';
import 'package:sisinf/UI/pages/dipendenteLogin.dart';

class AppRouter {
  static Route onGeneratedRoute(RouteSettings settings) {
    print('This is route: ${settings.name}');

    switch (settings.name) {
      case '/':
        return DipendenteLogin.route();

      default:
        return _errorRoute();
    } //end switch
  } //onGeneratedRoute

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('ERRORE!'),
        ),
      ),
    );
  }
}//AppRouter