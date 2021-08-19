import 'package:flutter/material.dart';

class BiografiaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              _BackgroundPerfil(),
              Align(
                alignment: Alignment.bottomCenter,
                child: _FotoPerfil(screenSize: _screenSize),
              ),
            ],
          ),
          _DescripcionPerfil(screenSize: _screenSize),
        ],
      ),
    );
  }
}

class _DescripcionPerfil extends StatelessWidget {
  final Size screenSize;

  const _DescripcionPerfil({required this.screenSize});

  @override
  Widget build(BuildContext context) {
    print('Descripcion Perfil:  $screenSize');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 30,
        ),
        Text(
          'Kyary Pamyu Pamyu',
          style: TextStyle(
              color: Colors.white54, fontSize: 30.0, fontFamily: 'Kyary_Font'),
        ),
        SizedBox(height: 8),
        Text(
          'Model / Super Star',
          style: TextStyle(
            color: Colors.white54,
            fontSize: 18.0,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 20.0,
          width: 10,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
            style: TextStyle(),
            textAlign: TextAlign.justify,
          ),
        ),
        // Container(
        //   width: screenSize.width * 0.80,
        //   child: Text(
        //     'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
        //     textAlign: TextAlign.justify,
        //   ),
        // ),
      ],
    );
  }
}

class _FotoPerfil extends StatelessWidget {
  final Size screenSize;
  const _FotoPerfil({
    required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
    print('Foto Perfil:  $screenSize');
    return Padding(
      padding: EdgeInsets.only(top: screenSize.height * 0.13),
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red,
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 10,
              offset: Offset(0, 0),
              spreadRadius: 5,
            ),
          ],
          image: DecorationImage(
            image: AssetImage('assets/Kyari_perfil.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class _BackgroundPerfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        height: 250,
        child: Image(
          image: AssetImage('assets/background_kyari.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
