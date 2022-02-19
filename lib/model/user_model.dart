import 'mysql.dart';

class UserModel {
  var db = Mysql();

  String _getMailFromMembersTable(String memberId) {
    var query =
        "SELECT `email` FROM `members` WHERE `member_id` LIKE '$memberId'";
    db.getConnection().then((conn) => {
          conn.query(query).then((result) {
            return result.first.values!.first;
          })
        });
    return "*****";
  }
}
