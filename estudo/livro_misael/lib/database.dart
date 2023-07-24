import 'dart:async';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'productDB.dart';

class SQLiteDbProvider {
  SQLiteDbProvider._();

  static final SQLiteDbProvider db = SQLiteDbProvider._();

  static Database? _database;

  Future<Database?> get database async {
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = p.join(documentDirectory.path, "ProductDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("Create table Product ("
          "id integer primary key,"
          "description text"
          "price integer,"
          "image text);");

      await db.execute(
          "insert into Product ('id','name','description','price','image')"
          " values (?,?,?,?,?)",
          [1, 'produto1', 'produto 1', 1000, 'produto1.png']);

      await db.execute(
          "insert into Product ('id','name','description','price','image')"
          " values (?,?,?,?,?)",
          [2, 'produto2', 'produto 2', 1000, 'produto1.png']);
      await db.execute(
          "insert into Product ('id','name','description','price','image')"
          " values (?,?,?,?,?)",
          [3, 'produto3', 'produto 3', 1000, 'produto1.png']);
      await db.execute(
          "insert into Product ('id','name','description','price','image')"
          " values (?,?,?,?,?)",
          [4, 'produto4', 'produto 4', 1000, 'produto1.png']);
    });
  }

  Future<List<Product>> getAllProducts() async {
    final db = await database;

    List<Map<String, Object?>>? results = await db?.query("Products",
        columns: Product.columns, orderBy: "id asc");

    List<Product> products = <Product>[];
    results?.forEach((result) {
      Product prod = Product.fromMap(result);
      products.add(prod);
    });

    return products;
  }

  insert(Product prod) async {
    final db = await database;

    var maxIdResult =
        await db?.rawQuery("select max(id)+1 as last_inserted_id from Product");

    var id = maxIdResult?.first["last_inserted_id"];

    var result = await db?.rawInsert(
        "Insert into Product (id,name,description,price,image) "
        "values (?,?,?,?,?)",
        [id, prod.name, prod.description, prod.price, prod.image]);

    return result;
  }

  update(Product prod) async {
    final db = await database;

    var result = await db
        ?.update("Product", prod.toMap(), where: "id =?", whereArgs: [prod.id]);

    return result;
  }

  delete(int id) async {
    final db = await database;
    db?.delete("Product", where: "id=?", whereArgs: [id]);
  }
}
