import 'dart:ui';

import 'package:asaek_kyari_aniversario/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class PrincipalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // posterProvider.loadingPoster();

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            _BackGroundPrincipal(),
            // Expanded(child: SizedBox()),
            // Positioned(
            //   bottom: 0,
            //   left: 0,
            //   child: Container(
            //     height: 300,
            //     color: Colors.teal,
            //   ),
            // ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // TODO El ClipRRect corta el blur  que genial
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                  child: Container(
                    height: 300,
                    // decoration: BoxDecoration(
                    //     color: Color.fromRGBO(62, 66, 107, 0.7),
                    //     borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      width: size.width,
                      // height: 120,
                      padding: EdgeInsets.only(top: 170, bottom: 10),
                      // color: Colors.deepOrange,
                      child: _ImagenSemanalListView(),
                    ),
                  ),
                ),
                _BotonMenuLuz(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BotonMenuLuz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('Menu'),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: SvgPicture.asset(
                'assets/Kyary_Pamyu_Pamyu_5th_Anniversary.svg',
                width: 50,
                height: 50,
                colorBlendMode: BlendMode.srcIn,
              ),
            ),
            SizedBox(
              width: double.infinity,
            ),
            Container(
              // TODO Darle un glow de sombra con el mismo color para que
              // TODO se vea como un LED
              width: 70,
              height: 2,
              color: Colors.white,
            ),
          ],
        ),
      ),
      onTap: () {
        print('Directo al menu');
      },
    );
  }
}

class _ImagenSemanalListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final posterProvider = Provider.of<PosterPrincipalProvider>(context);

    return ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: posterProvider.kyarPostersList.length,
      itemBuilder: (_, int index) => GestureDetector(
        child: Container(
          // padding: EdgeInsets.all(10),
          width: 200,
          height: 50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: FadeInImage(
              placeholder: AssetImage('assets/KYARY_loading.gif'),
              image:
                  NetworkImage(posterProvider.kyarPostersList[index].urlPost),
              fit: BoxFit.cover,
            ),
          ),
        ),
        onTap: () {
          Provider.of<PosterPrincipalProvider>(context, listen: false)
                  .posterSeleccionado =
              posterProvider.kyarPostersList[index].urlPost;
          print(posterProvider.kyarPostersList[index].urlPost);
        },
      ),
    );
  }
}

class _BackGroundPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String posterSeleccionado =
        Provider.of<PosterPrincipalProvider>(context).posterSeleccionado;
    return Container(
        height: double.infinity,
        child: (posterSeleccionado == '')
            ? Image(
                image: AssetImage('assets/KYARY_loading.gif'),
                fit: BoxFit.cover,
              )
            : Image(
                image: NetworkImage(posterSeleccionado),
                fit: BoxFit.cover,
              )

        // FadeInImage(
        //   placeholder: AssetImage('assets/KYARY_loading.gif'),
        //   image: NetworkImage(posterSeleccionado),
        //   fit: BoxFit.cover,
        // height: double.infinity,
        // width: double.infinity,
        );
  }
}
