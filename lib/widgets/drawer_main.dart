import 'package:flutter/material.dart';

class DrawerMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(15),
      ),
      child: Drawer(
        semanticLabel: 'Hola kyary bb',
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pink.shade300,
              ),
              // child: Container(),
              child: Text(
                'Kyari Aniversario',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            Divider(
              color: Colors.white,
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Biografia'),
              onTap: () => Navigator.pushNamed(context, 'biografia'),
            ),
            Divider(
              color: Colors.white,
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Colores'),
              onTap: () {},
            ),
            Divider(
              color: Colors.white,
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Discografia'),
              onTap: () {},
            ),
            Divider(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
