import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final _databaseName = "accountDatabase.db";
  static final _databaseVersion = 1;

  static final accountTable = 'accountTable';
  static final account_id_column = 'account_id';
  static final username_column = 'username';
  static final name_column = 'name';
  static final email_column = 'email';
  static final password_column = 'password';
  static final latest_city_column = 'city';

  String username = '';
  int accountid = 0;
  String fullname = '';
  String email = '';
  String password = '';
  String errormsg = '';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    print('create table');
    await db.execute('''
          CREATE TABLE $accountTable (
            $account_id_column INTEGER PRIMARY KEY AUTOINCREMENT,
            $username_column TEXT NOT NULL,
            $name_column TEXT NOT NULL,
            $email_column TEXT NOT NULL,
            $password_column TEXT NOT NULL
          )
          ''');
  }

  Future<int> insertDetails(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(accountTable, row);
  }

  Future<int> insertInfo(
      String username, String name, String email, String password) async {
    Database db = await instance.database;
    print('username=' + username);
    print('email=' + email);
    print(await db.query(DatabaseHelper.accountTable));
    String sql =
        'INSERT INTO accountTable(username, name, email, password) VALUES("' +
            username +
            '","' +
            name +
            '","' +
            email +
            '","' +
            password +
            '")';

    return await db.rawInsert(sql);
  }

  String getFullName() {
    return fullname;
  }

  String getEmail() {
    return email;
  }

  int getAccountID() {
    return accountid;
  }

  String getPassword() {
    return password;
  }

  String getTable() {
    return accountTable;
  }

  void setAccountID(inaccoutid) {
    accountid = inaccoutid;
  }

  void setName(inname) {
    fullname = inname;
  }

  void setEmail(inemailid) {
    email = inemailid;
  }

  void getUserDetails(int inaccoutid) async {
    Database db = await instance.database;

    final List<Map<String, dynamic>> maps = await db.rawQuery(
        'SELECT * FROM $accountTable WHERE account_id=' +
            inaccoutid.toString() +
            '" LIMIT 1');

    if (maps.length > 0) {
      var data = maps.first;
      username = data["username"];
      accountid = inaccoutid;
      fullname = data["name"];
      email = data["email"];
    }
  }

  Future<int> isValidUser(String inusername, String inpassword) async {
    Database db = await instance.database;

    String password = '';

    print('username=' + inusername);
    final List<Map<String, dynamic>> maps = await db.rawQuery(
        'SELECT * FROM $accountTable WHERE username="' +
            inusername +
            '" LIMIT 1');
    if (maps.isEmpty) {
      return await 0;
    } else {
      if (maps.length > 0) {
        var data = maps.first;
        username = inusername;
        accountid = data["account_id"];
        fullname = data["name"];
        email = data["email"];
        password = data["password"];
      }
      if (password == inpassword) {
        return await 1;
      } else {
        errormsg = 'Invalid Password';
        return await 0;
      }
    }
  }

  Future<int> deleteAccount(int id) async {
    Database db = await instance.database;
    return await db
        .delete(accountTable, where: '$account_id_column = ?', whereArgs: [id]);
  }

  Future<int> update(Map<String, dynamic> row, fullname) async {
    Database db = await instance.database;
    print(await db.query(getFullName()));
    return await db.update(accountTable, row,
        where: '${accountTable} = ?', whereArgs: [fullname]);
  }
}
