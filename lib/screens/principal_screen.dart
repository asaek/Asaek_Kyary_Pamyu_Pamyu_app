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

    // final size = MediaQuery.of(context).size;
    final String posterSeleccionado =
        Provider.of<PosterPrincipalProvider>(context).posterSeleccionado;
    return Scaffold(
      body: Container(
        width: double.infinity,
        // color: Colors.red,
        child: Stack(
          alignment: Alignment.bottomCenter,
          // fit: StackFit.expand,
          children: [
            /* TODO Al parecer se interpolan las imagenes el background el 
              junto con el ImageFiltered esta muy intersante esto
            */

            _BackGroundPrincipal(
              posterPaper: posterSeleccionado,
            ),

            // Expanded(child: SizedBox()),
            // Positioned(
            //   bottom: 0,
            //   left: 0,
            //   child: Container(
            //     height: 300,
            //     color: Colors.teal,
            //   ),
            // ),
            // Container(
            //   width: double.infinity,
            //   height: 500,
            //   decoration: BoxDecoration(
            //     shape: ,
            //     gradient: LinearGradient(
            //       begin: Alignment.topCenter,
            //       end: Alignment.bottomCenter,
            //       // stops: [0.2, 0.8],
            //       colors: [
            //         Color.fromRGBO(0, 0, 0, 0),
            //         Color.fromRGBO(32, 42, 48, 1),
            //       ],
            //     ),
            //   ),
            // ),
            _BlurGradientoso(
              posterPaper: posterSeleccionado,
            ),

            // Container(
            //     decoration: BoxDecoration(
            //         gradient: LinearGradient(
            //             begin: Alignment.topCenter,
            //             end: Alignment.bottomCenter,
            //             colors: [
            //       Colors.black.withOpacity(0),
            //       Colors.black.withOpacity(0.6)
            //     ],
            //             stops: [
            //       0.3,
            //       0.8
            //     ]))),

            Container(
              width: double.infinity,
              height: 100,

              // padding: EdgeInsets.only(top: 180, bottom: 5),

              child: _ImagenSemanalListView(),
            ),
            // _ImagenSemanalListView(),
            // _BotonMenuLuz(),
          ],
        ),
      ),
    );
  }
}

class _BlurGradientoso extends StatelessWidget {
  final String posterPaper;

  const _BlurGradientoso({required this.posterPaper});
  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: ShaderMask(
          shaderCallback: (rect) {
            return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black,
                Colors.black.withOpacity(0),
              ],
              // stops: [0.4, 0.75],
            ).createShader(rect);
          },
          /* TODO Aqui me que revisando como finciona linear gradiiente y como se apliican las
          3 capas
        */
          blendMode: BlendMode.dstOut,
          child: (posterPaper == '')
              ? Image(
                  image: AssetImage('assets/KYARY_loading.gif'),
                  fit: BoxFit.cover,
                  height: double.infinity, //Fantamas si muevves el tama;o
                )
              : Image(
                  image: NetworkImage(posterPaper),
                  fit: BoxFit.cover,
                  height: double.infinity, //Fantamas si muevves el tama;o
                )),
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
          width: 100,
          height: 90,
          // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          // padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          decoration: BoxDecoration(
            // color: Colors.deepOrange,
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                spreadRadius: 0.5,
                offset: Offset(0, 0),
              )
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
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

// TODO ese se poodria hacer con un gradiente que vaya de color a invicible
class _BackGroundPrincipal extends StatelessWidget {
  final String posterPaper;

  const _BackGroundPrincipal({required this.posterPaper});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        child: (posterPaper == '')
            ? Image(
                image: AssetImage('assets/KYARY_loading.gif'),
                fit: BoxFit.cover,
              )
            : Image(
                image: NetworkImage(posterPaper),
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
