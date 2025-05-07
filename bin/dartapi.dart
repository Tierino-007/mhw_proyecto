import 'database.dart';
import 'menu.dart';
main() async{
  await DataBase.instalarBBDD();
  
  await menuInicio();
  
  print("todo ha sido terminado");
}