import 'dart:io';
import "dart:convert";
import "package:http/http.dart" as http;
import 'dart:math';

class Monstruo {
  int? _id;
  String? _nombre;
  String? _tipo;
  String? _especie;
  int? _vida;
  int? _ataque;
  
  int? get id => _id;
  String? get nombre => _nombre;
  String? get tipo => _tipo;
  String? get especie => _especie;
  int? get vida => _vida;
  int? get ataque => _ataque;

  set id(int? id) {
    _id = id;
  }
  set nombre(String? nombre) {
    _nombre = nombre;
  }
  set tipo(String? tipo) {
    _tipo = tipo;
  }
  set especie(String? especie) {
    _especie = especie;
  }
  set vida(int? vida) {
    _vida = vida;
  }
  set ataque(int? ataque) {
    _ataque = ataque;
  }

  int obtenerId(){
    int idRandom = Random().nextInt(100) + 1;
    return idRandom;
  }

  obtenerMonstruo(int id) async {
    Uri url = Uri.parse("https://mhw-db.com/monsters/$id");
    var respuesta = await http.get(url);
    try {
      if (respuesta.statusCode == 200) {
        var datos = json.decode(respuesta.body);
        id = datos['id'];
        nombre = datos['name'];
        tipo = datos['type'];
        especie = datos['species'];
      } else {
        throw Exception("Error al obtener el monstruo");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}

