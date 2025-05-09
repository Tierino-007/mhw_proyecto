import 'dart:io';
import 'package:mysql1/mysql1.dart';
import 'database.dart';

class Usuario {
  int? _id;
  String? _nombre;
  String? _pasword;
  int? _nivel;
  int? _vida;
  int? _ataque;

  int? get id => _id;
  String? get nombre => _nombre;
  String? get pasword => _pasword;
  int? get nivel => _nivel;
  int? get vida => _vida;
  int? get ataque => _ataque;
  
  set id(int? id) {
    _id = id;
  }
  set nombre(String? nombre) {
    _nombre = nombre;
  } 
  set pasword(String? pasword) {
    _pasword = pasword;
  }
  set nivel(int? nivel) {
    _nivel = nivel;
  }
  set vida(int? vida) {
    _vida = vida;
  }
  set ataque(int? ataque) {
    _ataque = ataque;
  }

  Usuario();
  Usuario.fromBBDD(ResultRow datosUsu){
    id  = datosUsu["idusuario"];
    nombre = datosUsu["nombre"];
    pasword = datosUsu["password"];
    nivel = datosUsu["nivel"];
    vida = datosUsu["vida"];
    ataque = datosUsu["ataque"];
  }

  static Future<Usuario> conseguirUsuario() async {
    var conn = await DataBase.obtenerConexion();
    try {
      print("Cual es tu nombre cazador?");
      String? nombreCazador = stdin.readLineSync() ?? "ERROR";
      var resultados = await conn.query(
        "SELECT * FROM  usuarios WHERE nombre = ?", [nombreCazador]
      );
      if (resultados.isEmpty) {
        print("No estas registrado cazador");
      } else {
        for (var datosUsuario in resultados) {
          return Usuario.fromBBDD(datosUsuario);
        }
      }
    } catch (e) {
      print(e);
    } finally {
      await conn.close();
    }
    throw Exception("Unexpected error: No user returned");
  }


  registro() async{
    bool creado = true;
    var conn = await DataBase.obtenerConexion();
    do{
      stdout.writeln("introduce tu nombre");
      nombre=stdin.readLineSync() ?? "ERROR";
      stdout.writeln("introduce tu contraseña");
      pasword=stdin.readLineSync() ?? "ERROR";
      try{
        await conn.query('USE ${DataBase.nombreBBDD}');
        var resultado1 = await conn.query(
          'SELECT nombre FROM usuarios WHERE nombre = ?',
          [nombre]);
        if (resultado1.isNotEmpty){
          print("El usuario ya existe. Por favor, elige otro nombre.");
          creado = false;
        }else{
          creado = true;
          var resultado2 = await conn.query(
          "INSERT INTO usuarios (nombre, password) VALUES (?,?)",
          [nombre,pasword]);
        }
      }catch(e){
        print(e);
      } finally{
        await conn.close();
      }
    }while(creado==false);
  }

  login() async{
    var conn = await DataBase.obtenerConexion();
    stdout.writeln("introduce tu nombre");
    nombre=stdin.readLineSync() ?? "ERROR";
    try{
      await conn.query('USE ${DataBase.nombreBBDD}');
      var resultado3 = await conn.query(
        'SELECT nombre FROM usuarios WHERE nombre = ?',
        [nombre]);
      if(resultado3.isNotEmpty){
        print("Nombre correcto");
      }else{
        print("Error con el nombre");
      }
    }catch(e){
      print(e);
    }finally{
      await conn.close();
    }
  }
}