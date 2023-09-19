import 'package:flutter/cupertino.dart';
import 'package:sisinf/models/Cliente.dart';

import '../../restManagers/HttpRequest.dart';

class RicercaClienti extends StatelessWidget {

  static List<Cliente> list = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {

    fetchData();

    return Container();


  }

  Future<List<Cliente>> fetchData() async {
    List<Cliente> value = await Model.sharedInstance.getAllCliente();
    return value;
  }

}