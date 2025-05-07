import 'dart:io';
import 'usuario.dart';
import 'monstruo.dart';
import 'combate.dart';

menuInicio()async{
  print("¿Que uieres hacer?");
  stdout.writeln("""
1 -Registrarse. 
2 -Login.
3 -Buscar monstruo salvaje.
4 -Pelea.
""");
  print("Acceder a:");
  String respuesta0=stdin.readLineSync() ?? "ERROR";
  int eleccion=int.tryParse(respuesta0)??0;
  Usuario usuario = Usuario(); 
  Monstruo monstruo = Monstruo();
  Combate combate = Combate();

    switch (eleccion){
    case 1:
    await usuario.registro();
    case 2:
    await usuario.login();
    case 3:
    await Monstruo.imprimirMonstruo();
    case 4:
    await combate.pelea();
  }
}