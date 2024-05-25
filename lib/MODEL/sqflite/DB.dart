import 'package:sqflite/sqflite.dart';

class SqfliteDB {
// Open the database
  Future<Database> openDatabaseAsync() async {
    return await openDatabase(
      'Test.db', // The name of the database
      version: 1,
      onCreate: (Database db, int version) async {
        // Create a table when the database is first created
        await db.execute('''
          CREATE TABLE user (
            id INTEGER PRIMARY KEY  AUTOINCREMENT,
             name TEXT,
             email TEXT,
             age INTEGER)
       ''');
        await db.execute('''
          CREATE TABLE todouser (
            id INTEGER PRIMARY KEY,
             todo TEXT,
             complete TSXT,
             userId INTEGER)
       ''');
        await db.execute('''
          CREATE TABLE todopaginetion (
            id INTEGER PRIMARY KEY,
             todo TEXT,
             complete TSXT,
             userId INTEGER)
       ''');
        print("createdata base and table.........");
      },
    );
  }

// Insert some data into the table  user
  Future<void> insertDataUer(
      Database db, String name, String email, int age) async {
    int x = await db.insert(
      'user',
      {'name': name, 'email': email, 'age': age},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    if (x == 1) {
      print('Add user don =======================================');
    }
  }

// Insert some data into the table  todopaginetion
  Future<void> insertDattodopaginetion(
      Database db, int id, String todo, String complete, int userId) async {
    await db.insert(
      'todopaginetion',
      {'id': id, 'todo': todo, 'complete': complete, 'userId': userId},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

// Insert some data into the table
  Future<void> insertDatatodouser(
      Database db, int id, String todo, String complete, int userId) async {
    await db.insert(
      'todouser',
      {'id': id, 'todo': todo, 'complete': complete, 'userId': userId},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

// Get all the data from the table user
  Future<List<Map<String, Object?>>> getAllDatafromuser(Database db) async {
    return await db.query('user');
  }

// Get all the data from the table user
  Future<List<Map<String, dynamic>>> getAllDatafromtodouser(Database db) async {
    return await db.query('todouser');
  }

  // Get all the data from the table user
  Future<List<Map<String, Object?>>> getAllDataFromTodopaginetion(
      Database db) async {
    return await db.query('todopaginetion');
  }

// Close the database
  Future<void> closeDatabase(Database db) async {
    await db.close();
  }

// void main() async {
//   // Open the database
//   Database db = await openDatabaseAsync();

//   // Insert some data
//   await insertData(db, 'John Doe', 30);
//   await insertData(db, 'Jane Doe', 25);

//   // Get all the data
//   List<Map<String, dynamic>> data = await getAllData(db);
//   print(data);

//   // Close the database
//   await closeDatabase(db);
}
