import 'dart:io';
import 'dart:math';
import 'monstruo.dart';
import 'usuario.dart';

class Combate {
  int? _vidaUsuario;
  int? _vidaMonstruo;
  int? _ataqueUsuario;
  int? _ataqueMonstruo;

  int? get vidaUsuario => _vidaUsuario;
  int? get vidaMonstruo => _vidaMonstruo;
  int? get ataqueUsuario => _ataqueUsuario;
  int? get ataqueMonstruo => _ataqueMonstruo;

  set vidaUsuario(int? vidaU) {
    _vidaUsuario = vidaU;
  }
  set vidaMonstruo(int? vidaM) {
    _vidaMonstruo = vidaM;
  }
  set ataqueUsuario(int? ataqueU) {
    _ataqueUsuario = ataqueU;
  }
  set ataqueMonstruo(int? ataqueM) {
    _ataqueMonstruo = ataqueM;
  }

  pelea() {
    vidaMonstruo =Monstruo().vida;
    vidaUsuario = Usuario().vida;
    ataqueMonstruo = Monstruo().ataque;
    ataqueUsuario = Usuario().ataque;
    
    bool golpear = pegar();
      do {
        pegar();
      if (golpear){
        vidaMonstruo = vidaMonstruo! - ataqueUsuario!;
      }else{
        vidaUsuario = vidaUsuario! - ataqueMonstruo!;
      }
    } while (vidaUsuario! > 0 && vidaMonstruo! > 0);
  }

  bool pegar(){
    bool golpe = false;
    do{
      int numeroSecreto=Random().nextInt(99)+1;
      stdout.writeln ("adivina el numero secreto");
      int intentos=0;
      int intMAX=10;
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
    }while(golpe==false);
    return golpe;
  }
}