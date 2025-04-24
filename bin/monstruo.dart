import 'dart:io';
class Monstruo {
  int? _id;
  String? _nombre;
  static int? _vida;
  static int? _ataque;
  
  int? get id => _id;
  String? get nombre => _nombre;
  int? get vida => _vida;
  int? get ataque => _ataque;

  set id(int? id) {
    _id = id;
  }
  set nombre(String? nombre) {
    _nombre = nombre;
  }
  set vida(int? vida) {
    _vida = vida;
  }
  set ataque(int? ataque) {
    _ataque = ataque;
  }
}