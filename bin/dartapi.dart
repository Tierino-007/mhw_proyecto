import 'database.dart';
import 'menu.dart';
main() async{
  await DataBase.instalarBBDD();
  
  await menuInicio();
  
  print("todo ha sido terminado");





  /*print("bienvenido, para acceder introduzca su nombre de usuario");
  bool? acceso;
  Usuario usuario=Usuario();
  do{
    for(int i=0; i<=5; i++){
      print("Usuario:");
      String acsUsuario=stdin.readLineSync()??"ERROR en el usuario";
      print("Ahora para acceder introduzca su contraseña");
      print("Contraseña:");
      String acsContrasenia=stdin.readLineSync()??"ERROR en la contraseña";
      if(acsUsuario==usuario.nombre && acsContrasenia==usuario.pasword){
        print("Acceso concedido, bienbenido $acsUsuario");
        acceso=true;
        break;
      }else{
        print("Acceso denegado");
        acceso=false;
      }   
    }
  }while(acceso==false);
  int? camino;

  do{
    print("¿Que uieres hacer?");
    stdout.writeln("1 -Completar tus datos. 2 -Calcular tu IMC. 3 -Salir");
    print("Acceder a:");
    String respuesta0=stdin.readLineSync() ?? "ERROR";
    int caminoUsuario=int.tryParse(respuesta0)??0;
    camino=caminoUsuario;
    switch(camino){
      case 1:
      print("Introduce tu edad");
      String respuesta1=stdin.readLineSync()?? "ERROR";
      int edadUsuario=int.tryParse(respuesta1)??0;
      usuario.edad=edadUsuario;

      print("Introduce tus apellidos");
      String apellidosUsuario=stdin.readLineSync()?? "ERROR";
      usuario.apellidos=apellidosUsuario;

      print("Introduce tu altura");
      String respuesta3=stdin.readLineSync()?? "ERROR";
      double alturaUsuario=double.tryParse(respuesta3)??0.0;
      usuario.altura=alturaUsuario;

      print("Introduce tu peso");
      String respuesta4=stdin.readLineSync()?? "ERROR";
      double pesoUsuario=double.tryParse(respuesta4)??0.0;
      usuario.peso=pesoUsuario;
      break;
      
      case 2:
      if(usuario.altura!=null && usuario.peso!=null){
        double imc=usuario.calcularIMC();
        print("Tu IMC es: $imc");
      }else{
        print("Faltan datos, completa toos tus datos en el apartado 1");
        break;
      }

      case 3:
      break;
    }
  }while(true);*/

}