import 'dart:convert';
import 'package:flutter_application_test/MODEL/sqflite/DB.dart';
import 'package:flutter_application_test/constant/constant.dart';
import 'package:flutter_application_test/main.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';

class ApiHelper {
  List data = [];

  fetchDatatouser() async {
    final response =
        await http.get(Uri.parse("$getdataforuser/${prefs!.getString('id')}"));

    if (response.statusCode == 200) {
      var responsejson = jsonDecode(response.body);
      data.addAll(responsejson['todos']);

      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> insertDatauser(List data) async {
    SqfliteDB db = SqfliteDB();
    Database dd = await db.openDatabaseAsync();
    data.forEach((item) {
      db.insertDataUer(dd, item['id'], item['name'], item['email']);
      print("data item is ${item['id']}");
    });
  }

  insertInToTodouser(List data) async {
    SqfliteDB todouser = SqfliteDB();
    Database db = await todouser.openDatabaseAsync();

    for (var item in data) {
      if (item['todo'] == null) {
        todouser.insertDatatodouser(
            db, item['id'], "todo", item['complete'], item['userId']);
      } else if (item['complete'] == null) {
        todouser.insertDatatodouser(
            db, item['id'], item['todo'], 'compete', item['userId']);
      } else {
        todouser.insertDatatodouser(
            db, item['id'], item['todo'], item['complete'], item['userId']);
      }
    }
    print("Add to todouser Don ==================");
  }

  insertInToPaginetion(List data) async {
    SqfliteDB paginetion = SqfliteDB();
    Database db = await paginetion.openDatabaseAsync();
    for (var item in data) {
      if (item['todo'] == null) {
        paginetion.insertDattodopaginetion(
            db, item['id'], 'todo', item['complete'], item['userId']);
      } else if (item['complete'] == null) {
        paginetion.insertDattodopaginetion(
            db, item['id'], item['todo'], 'complete', item['userId']);
      } else {
        paginetion.insertDattodopaginetion(
            db, item["id"], item['todo'], item['complete'], item['userId']);
      }
    }

    print("Add to Paginetion Done ===============");
  }

  geateDataFromPagination() async {
    SqfliteDB paginationDB = SqfliteDB();
    Database db = await paginationDB.openDatabaseAsync();
    var list = await paginationDB.getAllDataFromTodopaginetion(db);
    data.addAll(list);
    print("data is $data");
  }

  geateDataFromTodoUser() async {
    SqfliteDB paginationDB = SqfliteDB();
    Database db = await paginationDB.openDatabaseAsync();
    var list = await paginationDB.getAllDatafromtodouser(db);
    data.addAll(list);
  }

  deleteDatabase(Database db) async {
    await db.execute('DROP TABLE IF EXISTS user');
    await db.execute('DROP TABLE IF EXISTS todouser');
    await db.execute('DROP TABLE IF EXISTS todopaginetion');
    print("Database tables deleted successfully");
  }

  Future<void> deleteDataFromTable(Database db, String tableName) async {
    await db.execute('DELETE FROM $tableName');
    print("Data deleted from $tableName table successfully");
  }
}

class DatabaseHelper {
  //...

  Future<void> insertDatauser(List data) async {
    SqfliteDB db = SqfliteDB();
    Database dd = await db.openDatabaseAsync();
    data.forEach((item) {
      db.insertDataUer(dd, item['id'], item['name'], item['email']);
      print("data item is ${item['id']}");
    });
  }
}

// طريقة الاستخدام لهذا الكلاس
class INUser {
  syncdataforuser() async {
    final apiHelper = ApiHelper();
    final data = await apiHelper.fetchDatatouser();
    print("data in database $data");

    final databaseHelper = DatabaseHelper();
    await databaseHelper.insertDatauser(data);
  }
}
