import 'package:asaek_kyari_aniversario/utils/launchURL.dart';
import 'package:flutter/material.dart';

class LaunchUrlsText extends StatelessWidget {
  final String texto;
  final String url;
  const LaunchUrlsText({
    required this.texto,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Text(texto)),
      onTap: () {
        launchURL(context, url);
      },
    );
  }
}
