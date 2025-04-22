import 'dart:io';
import 'database.dart';
import 'package:mysql1/mysql1.dart';
class Producto {
  int? _idProducto;
  String? _descripcion;
  String? _referencia;
  double? _precioComp;
  double? _precioVent;
  int? _stock;

  int? get idProducto => _idProducto;
  String? get descripcion => _descripcion;
  String? get referencia => _referencia;
  double? get precioComp =>_precioComp;
  double? get precioVent => _precioVent;
  int? get stock => _stock;

  set idProducto (int? idn){
    _idProducto=idn;
  }
  set descripcion (String? razon){
    _descripcion=razon;
  }
  set referencia (String? nifn){
    _referencia=nifn;
  }
  set precioComp (double? numtlf){
    _precioComp=numtlf;
  }
  set precioVent (double? direc){
    _precioVent=direc;
  }
  set stock (int? emailc){
    _stock=emailc;
  }

  Future guardarProducto()async{
    bool guardado=false;
    var conn;
    do{
      conn = await DataBase.obtenerConexion();
      pedirInfo();
      try{
        var resultado1 = await conn.query(
        'SELECT descripcion FROM productos WHERE descripcion = ?',
        [descripcion]);
        if(resultado1.isNotEmpty){
          print('El Cliente ya existe');
          guardado=false;
        }else{
          var guardando = await conn.query(
          """INSERT INTO productos (
            descripcion,referencia,precioComp,precioVent,stock
          ) VALUES (?,?,?,?,?)""",
          [descripcion,referencia,precioComp,precioVent,stock]);
          guardado=true;
        }
        print("Guardado terminado");
      }catch(e){
        print(e);
      }finally{
        await conn.close();
      }
    }while(guardado==false);
  }

  pedirInfo(){
    print("Para guardar un cliente debera introducir los siguientes datos:");
    print("Descripcion");
    descripcion=stdin.readLineSync() ?? "ERROR";
    print("Referencia");
    referencia=stdin.readLineSync() ?? "ERROR";
    print("precio de Compra");
    String? precioCNN=stdin.readLineSync() ?? "ERROR";
    precioComp=double.tryParse(precioCNN)?? 0;
    print("precio de Venta");
    String? precioVNN=stdin.readLineSync() ?? "ERROR";
    precioVent=double.tryParse(precioVNN)?? 0;
    print("Stock");
    String? stockNN=stdin.readLineSync() ?? "ERROR";
    stock=int.tryParse(stockNN)?? 0;
  }

  Future listarProducto()async{
    var conn = await DataBase.obtenerConexion();
    try{
      var resultados = await conn.query("SELECT * FROM clientes" );
      if(resultados.isNotEmpty){
        for (var datosProducto in resultados){
          Map<String, dynamic> cliEntE ={
          "id" : datosProducto["idProducto"] as int?,
          "descripcion" : datosProducto["descripcion"] as String?,
          "referencia" : datosProducto["referencia"] as String?,
          "precioComp" : datosProducto["precioComp"] as double?,
          "precioVent" : datosProducto["precioVent"] as double?,
          "stock" : datosProducto["stock"] as int?,
         };
         print(cliEntE);
        }
      }else{
        print("ERROR");
      }
    }catch(e){
      print(e);
    }finally{
      await conn.close();
    }
  }
}