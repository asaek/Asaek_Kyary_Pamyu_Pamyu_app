import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:asaek_kyari_aniversario/models/models.dart';

class PosterPrincipalProvider extends ChangeNotifier {
  final String _baseUrl = 'kyary10d-default-rtdb.firebaseio.com';
  final String postersURL = 'Posters.json';

// TODO No permite cosas nulleables al parecer por elste constructor CREO XD
  PosterPrincipalProvider() {
    this.loadingPoster();
  }

  final List<Kyary10Js> kyarPostersList = [];
  bool isLoading = true;
  bool isSaving = true;

  // String _posterSeleccionado =
  //     'https://res.cloudinary.com/asaek/image/upload/v1630587730/Kyary_10/l9vsx3ftkbd4fd9z1pmu.jpg';

  String _posterSeleccionado = '';
  String get posterSeleccionado => this._posterSeleccionado;
  set posterSeleccionado(String dato) {
    this._posterSeleccionado = dato;
    notifyListeners();
  }

  Future<List<Kyary10Js>> loadingPoster() async {
    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'Posters.json');
    final resp = await http.get(url);

    final Map<String, dynamic> postersMap = json.decode(resp.body);
    postersMap.forEach(
      (key, value) {
        final tempPoster = Kyary10Js.fromMap(value);
        tempPoster.id = key;
        this.kyarPostersList.add(tempPoster);
      },
    );
    // print(this.kyarPostersList[0].urlPost);

    this.isLoading = false;
    notifyListeners();
    return this.kyarPostersList;
  }
}
