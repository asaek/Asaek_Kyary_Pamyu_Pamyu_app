import 'package:asaek_kyari_aniversario/providers/providers.dart';
import 'package:asaek_kyari_aniversario/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppStateTrance());

class AppStateTrance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PosterPrincipalProvider(),
        ),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kyary Aniversario',
      initialRoute: 'entrada',
      routes: {
        'inicio': (_) => PrincipalPage(),
        'biografia': (_) => BiografiaScreen(),
        'entrada': (_) => InicioScreen()
      },
      theme: ThemeData.dark(),
    );
  }
}
