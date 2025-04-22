import 'dart:io';
import 'database.dart';
import 'package:mysql1/mysql1.dart';
class Cliente {
  int? _idCliente;
  String? _razonSocial;
  String? _nif;
  String? _telefono;
  String? _direccion;
  String? _email;
  double? _riesgo;

  int? get idcliente => _idCliente;
  String? get razonSocial => _razonSocial;
  String? get nif => _nif;
  String? get telefono =>_telefono;
  String? get direccion => _direccion;
  String? get email => _email;
  double? get riesgo => _riesgo;

  set idcliente (int? idn){
    _idCliente=idn;
  }
  set razonSocial (String? razon){
    _razonSocial=razon;
  }
  set nif (String? nifn){
    _nif=nifn;
  }
  set telefono (String? numtlf){
    _telefono=numtlf;
  }
  set direccion (String? direc){
    _direccion=direc;
  }
  set email (String? emailc){
    _email=emailc;
  }
  set riesgo (double? numriesgo){
    _riesgo=numriesgo;
  }

  Cliente();
  Cliente.BBDD(ResultRow datosCli){
    idcliente = datosCli["idCliente"];
    razonSocial = datosCli["razonSocial"];
    nif = datosCli["nif"];
    telefono = datosCli["telefono"];
    direccion = datosCli["direccion"];
    email = datosCli["email"];
    riesgo = datosCli["riesgo"];
  }

  static listaClientes() async{
    List<Cliente> listadoCliente = await Cliente.infoCliente();
    for(Cliente cliente in listadoCliente){
      stdout.writeln("${cliente.razonSocial}");
    }
  }
    static Future <List<Cliente>> infoCliente()async{
    List<Cliente> clientes = [];
    var conn = await DataBase.obtenerConexion();
    try{
      var resultados = await conn.query("SELECT * FROM clientes" );
      for (var datosCliente in resultados){
        Cliente cliente2 = Cliente.BBDD(datosCliente);
        clientes.add(cliente2);
      }
    }catch(e){
      print(e);
    }finally{
      await conn.close();
    }
    return clientes;
  }

  Future guardarCliente()async{
    bool guardado=false;
    var conn = await DataBase.obtenerConexion();
    do{
      pedirInfo();
      try{
        var resultado1 = await conn.query(
        'SELECT razonSocial FROM clientes WHERE razonSocial = ?',
        [razonSocial]);
        if(resultado1.isNotEmpty){
          print('El Cliente ya existe');
          guardado=false;
        }else{
          var guardando = await conn.query(
          """INSERT INTO clientes (
            razonSocial,nif,telefono,direccion,email,riesgo
          ) VALUES (?,?,?,?,?,?)""",
          [razonSocial,nif,telefono,direccion,email,riesgo]);
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
    print("Razon Social/Nombre de la entidad");
    razonSocial=stdin.readLineSync() ?? "ERROR";
    print("nif");
    nif=stdin.readLineSync() ?? "ERROR";
    print("telefono");
    telefono=stdin.readLineSync() ?? "ERROR";
    print("direccion");
    direccion=stdin.readLineSync() ?? "ERROR";
    print("email");
    email=stdin.readLineSync() ?? "ERROR";
    print("riesgo");
    String? riesgoNN=stdin.readLineSync() ?? "ERROR";
    riesgo=double.tryParse(riesgoNN)?? 0;
  }
}