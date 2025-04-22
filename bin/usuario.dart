import 'dart:io';
import 'database.dart';
class Usuario {
  String _nombre = "Pepe";
  String _pasword = "FallOut";
  int _nivel = 0;

  String get nombre => _nombre;
  String get pasword => _pasword;

  set nombre (String nombre){
    _nombre=nombre;
  }
  set pasword (String pasword){
    _pasword=pasword;
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
        await conn.query('USE dartapi');
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
      }finally{
        await conn.close();
      }
    }while(creado==false);
  }

  login() async{
    var conn = await DataBase.obtenerConexion();
    stdout.writeln("introduce tu nombre");
    nombre=stdin.readLineSync() ?? "ERROR";
    try{
      await conn.query('USE dartapi');
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