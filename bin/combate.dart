import 'dart:io';
import 'dart:math';
import 'monstruo.dart';
import 'usuario.dart';

class Combate {
  int _vidaUsuario = 0;
  int _vidaMonstruo = 0;
  int _ataqueUsuario = 0;
  int _ataqueMonstruo = 0;

  int get vidaUsuario => _vidaUsuario;
  int get vidaMonstruo => _vidaMonstruo;
  int get ataqueUsuario => _ataqueUsuario;
  int get ataqueMonstruo => _ataqueMonstruo;

  set vidaUsuario(int vidaU) {
    _vidaUsuario = vidaU;
  }
  set vidaMonstruo(int vidaM) {
    _vidaMonstruo = vidaM;
  }
  set ataqueUsuario(int ataqueU) {
    _ataqueUsuario = ataqueU;
  }
  set ataqueMonstruo(int ataqueM) {
    _ataqueMonstruo = ataqueM;
  }

  obtenerDatosUsuario (var usuario) async{
    vidaUsuario = usuario.vida ?? 500;
    ataqueUsuario = usuario.ataque ?? 50;
  }

  obtenerDatosMonstruo (var monstruo) async{
    if (monstruo.especie == "Elder Dragon") {
      vidaMonstruo = 1000;
      ataqueMonstruo = 100;
    } 
      else if (monstruo.especie == "flying Wyvern") {
      vidaMonstruo = 500;
      ataqueMonstruo = 50;
    } 
      else if (monstruo.especie == "brute Wyvern") {
      vidaMonstruo = 500;
      ataqueMonstruo = 50;
    } 
      else if (monstruo.especie == "piscine wyvern") {
      vidaMonstruo = 500;
      ataqueMonstruo = 50;
    } 
      else if (monstruo.especie == "bird wyvern") {
      vidaMonstruo = 500;
      ataqueMonstruo = 50;
    } 
      else if (monstruo.especie == "fanged wyvern") {
      vidaMonstruo = 500;
      ataqueMonstruo = 50;
    } 
      else if (monstruo.especie == "herbivore") {
      vidaMonstruo = 500;
      ataqueMonstruo = 50;
    } 
      else if (monstruo.especie == "lynian") {
      vidaMonstruo = 50;
      ataqueMonstruo = 500;
    } 
      else if (monstruo.especie == "neopteron") {
      vidaMonstruo = 250;
      ataqueMonstruo = 25;
    }
     else if (monstruo.especie == "Fanged Beast") {
      vidaMonstruo = 750;
      ataqueMonstruo = 50;
    } 
      else if (monstruo.especie == "relict") {
      vidaMonstruo = 750;
      ataqueMonstruo = 75;
    } 
      else if (monstruo.especie == "wingdrake") {
      vidaMonstruo = 100;
      ataqueMonstruo = 25;
    } 
      else if (monstruo.especie == "fish") {
      vidaMonstruo = 100;
      ataqueMonstruo = 25;
    }
     else {
      vidaMonstruo = 250;
      ataqueMonstruo = 25;
    }
  }

  pelea() async{
    bool? golpear;

    Monstruo monstruo = await Monstruo.obtenerMonstruo(Monstruo.obtenerId());
     await obtenerDatosMonstruo(monstruo);
    Usuario usuario = await Usuario.conseguirUsuario();
    await obtenerDatosUsuario(usuario);

      do {
        print("Monstruo: ${monstruo.nombre}");
        print("Vida Usuario: $vidaUsuario");
        print("Vida Monstruo: $vidaMonstruo");
        golpear = pegar();
      if (golpear){
        vidaMonstruo = vidaMonstruo - ataqueUsuario;
      }else{
        vidaUsuario = vidaUsuario - ataqueMonstruo;
      }
    } while (vidaUsuario > 0 && vidaMonstruo > 0);
    print("Monstruo abatido");
  }

  bool pegar(){
    bool golpe = false;
      int numeroSecreto=Random().nextInt(49)+1;
      stdout.writeln (
        """adivina el numero secreto
        entre 1 y 50"""
      );
      int intentos=0;
      int intMAX=7;
      while(intentos<intMAX){
        String respuesta= stdin.readLineSync() ?? "error";
        int? numero = int.tryParse(respuesta);
        stdout.writeln("intentos=$intentos");
        intentos++;
        if(numero==null){
          stdout.writeln("eso no es un numero");
        }else if(numero>numeroSecreto){
          stdout.writeln("el numero es mas bajo");
        }else if(numero<numeroSecreto){
          stdout.writeln("el numero es mas alto");
        }else if(numero==numeroSecreto){
          stdout.writeln("acertaste, golpeas");
          golpe=true;
          break;
        }
      }
    return golpe;
  }
}