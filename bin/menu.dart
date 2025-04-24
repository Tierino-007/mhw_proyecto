import 'dart:io';
import 'usuario.dart';

menuInicio()async{
  print("¿Que uieres hacer?");
  stdout.writeln("""
1 -Registrarse. 
2 -Login.
""");
  print("Acceder a:");
  String respuesta0=stdin.readLineSync() ?? "ERROR";
  int eleccion=int.tryParse(respuesta0)??0;
  Usuario usuario = Usuario(); 
    switch (eleccion){
    case 1:
    await usuario.registro();
    case 2:
    await usuario.login();
    case 3:
  }
}