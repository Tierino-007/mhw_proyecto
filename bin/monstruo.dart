import "dart:convert";
import "package:http/http.dart" as http;
import 'dart:math';

class Monstruo {
  int? _id;
  String? _nombre;
  String? _tipo;
  String? _especie;
  
  int? get id => _id;
  String? get nombre => _nombre;
  String? get tipo => _tipo;
  String? get especie => _especie;

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

  Monstruo();
  Monstruo.fromAPI(Map<String, dynamic>datos) {
    id = datos['id'];
    nombre = datos['name'] ?? "Desconocido";
    tipo = datos['type'] ?? "Desconocido";
    especie = datos['species'] ?? "Desconocido";
  }

  static int obtenerId(){
    int idRandom = Random().nextInt(33) + 1;
    return idRandom;
  }
  
  static Future<Monstruo> obtenerMonstruo(int id) async {
    Uri url = Uri.parse("https://mhw-db.com/monsters/$id");
    var respuesta = await http.get(url);
    try {
      if (respuesta.statusCode == 200) {
        var datos = json.decode(respuesta.body);
        return Monstruo.fromAPI(datos);
      } else {
        throw Exception("Error al obtener el monstruo");
      }
    } catch (e) {
      print("Error: $e");
      throw Exception("Error al obtener el monstruo");
    }finally{
      print("Monstruo encontrado");
    }
  }

  static Future imprimirMonstruo() async {
    int id = obtenerId();
    Monstruo monstruo = await obtenerMonstruo(id);
    print("ID: ${monstruo.id}");
    print("Nombre: ${monstruo.nombre}");
    print("Tipo: ${monstruo.tipo}");
    print("Especie: ${monstruo.especie}");
  }
}
