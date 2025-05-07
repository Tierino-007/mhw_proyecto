import 'dart:io';
import 'usuario.dart';
import 'monstruo.dart';

menuInicio()async{
  print("¿Que uieres hacer?");
  stdout.writeln("""
1 -Registrarse. 
2 -Login.
3 -Buscar monstruo salvaje.
""");
  print("Acceder a:");
  String respuesta0=stdin.readLineSync() ?? "ERROR";
  int eleccion=int.tryParse(respuesta0)??0;
  Usuario usuario = Usuario(); 
  Monstruo monstruo = Monstruo();

    switch (eleccion){
    case 1:
    await usuario.registro();
    case 2:
    await usuario.login();
    case 3:
    await Monstruo.imprimirMonstruo();
  }
}