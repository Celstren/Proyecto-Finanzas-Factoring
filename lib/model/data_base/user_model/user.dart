import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int usuario;
  String nombres;
  String apellidos;
  String urlImagen;

  User({
    this.usuario,
    this.nombres,
    this.apellidos,
    this.urlImagen,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    usuario: json["usuario"],
    nombres: json["nombres"],
    apellidos: json["apellidos"],
    urlImagen: json["url_imagen"],
  );

  Map<String, dynamic> toJson() => {
    "usuario": usuario,
    "nombres": nombres,
    "apellidos": apellidos,
    "url_imagen": urlImagen,
  };

  static Map<String, dynamic> toLoginRequest(String username, String password) => {
    "username": username.toString(),
    "password": password,
  };
}
