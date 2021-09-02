// To parse this JSON data, do
//
//     final kyary10Js = kyary10JsFromMap(jsonString);

import 'dart:convert';

class Kyary10Js {
  Kyary10Js({
    this.id,
    required this.urlPost,
  });

  String? id;
  String urlPost;

  factory Kyary10Js.fromJson(String str) => Kyary10Js.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Kyary10Js.fromMap(Map<String, dynamic> json) => Kyary10Js(
        id: json["id"],
        urlPost: json["urlPost"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "urlPost": urlPost,
      };

  Kyary10Js copy() => Kyary10Js(
        id: this.id,
        urlPost: this.urlPost,
      );
}
