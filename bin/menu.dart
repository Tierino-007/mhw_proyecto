import 'dart:io';
import 'usuario.dart';
import 'monstruo.dart';
import 'combate.dart';

menuInicio()async{
  bool salir = false;
  do{
    print("");
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
  Combate combate = Combate();

    switch (eleccion){
      case 1:
      print("");
      await usuario.registro();
      case 2:
      print("");
      await usuario.login();
      case 3:
      print("");
      await Monstruo.imprimirMonstruo();
      case 4:
      print("");
      await combate.pelea();
      case 5:
      salir = true;
      default:
      print("Opcion no valida");
    }
  }while(salir==false);
}