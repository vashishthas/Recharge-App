import 'package:mysql1/mysql1.dart';

class Mysql {
  static String host = "185.201.11.44",
      user = "u547419241_sanjoy",
      password = "Sanjoy@2022",
      db = "u547419241_sanjoy";
  static int port = 3306;

  Mysql();

  Future<MySqlConnection> getConnection() async {
    var setting = ConnectionSettings(
        host: host, port: port, user: user, password: password, db: db);

    return await MySqlConnection.connect(setting);
  }
}
