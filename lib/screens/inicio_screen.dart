import 'package:flutter/material.dart';

import 'package:asaek_kyari_aniversario/widgets/widgets.dart';

class InicioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink.shade300,
          centerTitle: true,
          title: Text('Kyari Aniversario',
              style: TextStyle(color: Colors.pink.shade100, fontSize: 28.0)),
        ),
        endDrawer: DrawerMain(),
        body: InicioPortada());
  }
}
