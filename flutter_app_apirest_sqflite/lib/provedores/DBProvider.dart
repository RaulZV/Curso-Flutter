import 'package:flutter_app_apirest/Modelo/Lugar.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DBProvider {

  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {

    if(_database != null) return _database;

    _database = await initBD();

    return _database;

  }

  initBD() async {

     Directory documentsDirectory =  await getApplicationDocumentsDirectory();

     final path = join(documentsDirectory.path, "BDlugaresv2.db");

     return await openDatabase(
         path,
         version: 2,
         onCreate: (Database db, int version) async{

           await db.execute('''CREATE TABLE tlugares (
                              "id"	INTEGER PRIMARY KEY AUTOINCREMENT,
                              "nombre"	TEXT,
                              "descripcion"	TEXT,
                              "direccion"	TEXT,
                              "telefono"	TEXT,
                              "website"	TEXT,
                              "imagen_nombre"	TEXT,
                              "importancia"	TEXT,
                              "latitud"	REAL,
                              "longitud"	REAL,
                              "title"	TEXT,
                              "reaction"	TEXT
                          );''');

         });


  }

  insertarTbl(Lugar objLugar) async {

    final db =  await database;

    // Insert some records in a transaction
    await db.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO tlugares(nombre, descripcion, direccion, telefono, website, imagen_nombre, importancia, latitud, longitud, title, reaction) '
              'VALUES(?, ?, ?,?, ?, ?,?, ?, ?,?,?)',
          [objLugar.nombre, objLugar.descripcion, objLugar.direccion,
            objLugar.telefono, objLugar.website,
            objLugar.imagen_nombre, objLugar.importancia,
            objLugar.latitud, objLugar.longitud, objLugar.title, objLugar.reaction]);
      print('inserted1: $id1');
    });
  }

  eliminarTbl() async {
    final db =  await database;
    var count = await db.rawDelete('DELETE FROM tlugares;');
    print("Eliminacion ${count}");
  }

  Future<List<Lugar>> consultaTabla() async{
    final db =  await database;

    List<Map> list = await db.rawQuery('SELECT id,nombre, descripcion, direccion, telefono, website, imagen_nombre, importancia, latitud, longitud, title, reaction FROM tlugares');

    List<Lugar> lista = [];

    for (Map l in list) {
      Lugar objLugar =  Lugar(l["id"], l["nombre"], l["descripcion"],
          l["direccion"],l["telefono"],l["website"],
          l["imagen_nombre"], l["importancia"],l["latitud"],
          l["longitud"],l["title"],l["reaction"]);

      lista.add(objLugar);
    }

    if (lista.length > 0) {
      return lista;
    }
    return null;
  }

}