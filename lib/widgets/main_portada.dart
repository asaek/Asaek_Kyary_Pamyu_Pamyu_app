import 'package:flutter/material.dart';

class InicioPortada extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      children: [_Page1()],
    );
  }
}

class _Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Background(),
        MainContent(),
      ],
    );
  }
}

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // ojo a l ponder el color de #30BAD6
      // color: Color(0xff30BAD6),
      child: Opacity(
        opacity: 0.90,
        child: Image(
          image: AssetImage('assets/Kyary_vertical.jpeg'),
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textStyleNOmbre = TextStyle(
      fontSize: 60,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    );
    var textStyleSubnombre = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.white70,
    );
    var textStyleMinnombre = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.pinkAccent,
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(child: Container()),
          Text(
            'Kyary Pamyu Pamyu`',
            style: textStyleNOmbre,
          ),
          Divider(
            color: Colors.redAccent,
          ),
          Text(
            'Kiriko Takemura',
            style: textStyleSubnombre,
          ),
          Divider(
            color: Colors.redAccent,
          ),
          Text(
            '竹村 桐子',
            style: textStyleMinnombre,
          )
        ],
      ),
    );
  }
}
