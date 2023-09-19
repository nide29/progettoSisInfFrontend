import 'package:flutter/material.dart';
import 'package:sisinf/UI/pages/dipendenteLogin.dart';

import 'config/approuter.dart';

void main() {
  runApp(const MyApp());
} //main

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.onGeneratedRoute,
      initialRoute: DipendenteLogin.routeName,
    );
  }
} //MyApp