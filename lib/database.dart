import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Database db;

class DatabaseCreator{
  static const todoTable = 'todo';
  static const id = 'id';
  static const name = 'name';
  static const surname = 'surname';
  static const email = 'email';
  static const password = 'password';
  static const city = 'city';
  static const ilce = 'ilce';
  static const address = 'address';
  static const attribute = 'attribute';

  static void databaseLog(String functionName, String sql,
      [List<Map<String, dynamic>> selectQueryResult,int insertAndUpdateQueryResult]){
    print(functionName);
    print(sql);
    if(selectQueryResult!=null){
      print(selectQueryResult);
    }else if(insertAndUpdateQueryResult!=null){
      print(insertAndUpdateQueryResult);
    }

  }
  Future<void> createTodoTable(Database db) async{
    final todoSql = '''CREATE TABLE $todoTable
    (
    $id INTEGER PRIMARY KEY,
    $name TEXT,
    $surname TEXT,
    $email TEXT,
    $password TEXT,
    $city TEXT,
    $ilce TEXT,
    $address TEXT,
    $attribute TEXT
    )''';
    await db.execute(todoSql);
  }

  Future<String> getDatabasePath(String dbName) async{
  final databasePath = await getDatabasesPath();
  final path = join(databasePath,dbName);

  if(await Directory(dirname(path)).exists()){
      //await deleteDatabase(path);
  }else {
    await Directory(dirname(path)).create(recursive: true);
  }
  return path;
  }

  Future<void> initDatabase() async{
    final path = await getDatabasePath('user_db');
    db = await openDatabase(path,version: 1, onCreate: onCreate);
    print(db);
  }
  Future<void> onCreate(Database db,int version)async{
    await createTodoTable(db);
  }
}

class User{
  int id;
  String name;
  String surname;
  String email;
  String password;
  String city;
  String ilce;
  String address;
  String attribute;

  User(this.id,this.name,this.surname,this.email,this.password,this.city,this.ilce,this.address,this.attribute);

  User.fromJson(Map<String, dynamic> json){
    this.id=json[DatabaseCreator.id];
    this.name=json[DatabaseCreator.name];
    this.surname=json[DatabaseCreator.surname];
    this.password=json[DatabaseCreator.password];
    this.email=json[DatabaseCreator.email];
    this.city=json[DatabaseCreator.city];
    this.ilce=json[DatabaseCreator.ilce];
    this.address=json[DatabaseCreator.address];
    this.attribute=json[DatabaseCreator.attribute];
  }

}


