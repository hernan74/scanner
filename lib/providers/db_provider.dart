

import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:scanner/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';


class DBProvider{

  static Database _database;
  static final DBProvider db=DBProvider._();

  static final String _scanTableName='Scans';

  DBProvider._();

  get database async{

    if(_database!=null) return _database;

    _database=await initDB();

    return _database;
  }

  Future<Database> initDB() async{
    //Path de donde se almacenara la base de datos
    Directory documentsDirectory= await getApplicationDocumentsDirectory();
    
    final path=join(documentsDirectory.path,'ScansDB.db');
    print(path);

    return await openDatabase(
      path,
      //Cada cambio que se haga en la estructura de la base de datos debe cambiarse la version
      //para ejecutar la modificacion.
      version: 1,
      onCreate: (Database db, int version)async{
        await db.execute('''
        CREATE TABLE '$_scanTableName'(
          id INTEGER PRIMARY KEY,
          tipo TEXT,
          valor TEXT
        )        
        ''');
      }
      );
  }

  Future<int> crearNuevoScan(ScanModel nuevoScan) async{

    //Obtiene la instancia de la base de datos 
    final Database db=await database;
    final id=await db.insert('$_scanTableName',nuevoScan.toJson());
    return id;
  }

  Future<ScanModel> obtenerScanPorId( int id)async{

     //Obtiene la instancia de la base de datos 
    final Database db=await database;
    final res= await db.query(_scanTableName,where: 'id=?',whereArgs: [id]);

    return  res.isEmpty ? ScanModel.fromJson(res.first):null;
  }

   Future<List<ScanModel>> obtenerScanTodos()async{

     //Obtiene la instancia de la base de datos 
    final Database db=await database;
    final res= await db.query(_scanTableName);

    return res.isNotEmpty ?
           res.map((e) => ScanModel.fromJson(e)).toList()
           :[];
  }

    Future<List<ScanModel>> obtenerScanPorTipo(String tipo)async{

     //Obtiene la instancia de la base de datos 
    final Database db=await database;

    final res= await db.query(_scanTableName,where: 'tipo=?',whereArgs: [tipo]);
   
    return res.isNotEmpty ?
           res.map((e) => ScanModel.fromJson(e)).toList()
           :[];
  }

  Future<int> borrarTodosLosRegistros()async{

     //Obtiene la instancia de la base de datos 
    final Database db=await database;

    return await db.delete(_scanTableName);

  }


  Future<int> borrarTodosLosScanPorTipo(String tipo)async{

     //Obtiene la instancia de la base de datos 
    final Database db=await database;

    return await db.delete(_scanTableName,where: 'tipo=?',whereArgs: [tipo]);

  }
  Future<int> borrarScanPorId(int id)async{

     //Obtiene la instancia de la base de datos 
    final Database db=await database;

    return await db.delete(_scanTableName,where: 'id=?',whereArgs: [id]);

  }
}