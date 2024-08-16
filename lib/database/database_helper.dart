import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  DatabaseHelper.internal();

  initDb() async {
    String path = join(await getDatabasesPath(), "email_db.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE User(id INTEGER PRIMARY KEY, email TEXT)");
  }

  Future<int> saveEmail(String email) async {
    var dbClient = await db;
    int res = await dbClient.insert("User", {"email": email});
    return res;
  }

  Future<String?> getEmail() async {
    var dbClient = await db;
    List<Map<String, dynamic>> result = await dbClient.query("User");
    if (result.isNotEmpty) {
      return result.first["email"];
    }
    return null;
  }
}
