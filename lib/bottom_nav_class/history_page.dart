import 'package:flutter/material.dart';
import 'package:pay_to_fast/model/mysql.dart';

class HistoryPage extends StatefulWidget {
  String memberId;
  String password;
  HistoryPage({Key? key, required this.memberId, required this.password})
      : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  var db = Mysql();
  var data = [];
  var data1 = [];
  var data2 = [];

  void _getMailFromMembersTable() async {
    var query =
        "SELECT `amount` FROM `transactions` WHERE `member_id` LIKE '${widget.memberId}'";
    await db.getConnection().then((conn) => {
          conn.query(query).then((result) {
            data.clear();
            setState(() {
              for (var i in result) {
                data.add(i.first);
              }
            });
          })
        });
    var query2 =
        "SELECT `type` FROM `transactions` WHERE `member_id` LIKE '${widget.memberId}'";
    await db.getConnection().then((conn) => {
          conn.query(query2).then((result) {
            data1.clear();
            setState(() {
              for (var i in result) {
                data1.add(i.first);
              }
            });
          })
        });
    var query3 =
        "SELECT `created_at` FROM `transactions` WHERE `member_id` LIKE '${widget.memberId}'";
    await db.getConnection().then((conn) => {
          conn.query(query3).then((result) {
            data2.clear();
            setState(() {
              for (var i in result) {
                data2.add(i.first);
              }
            });
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 42,
              width: double.infinity,
              child: TextButton(
                onPressed: _getMailFromMembersTable,
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.green,
                ),
                child: const Text(
                  'Get Details',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    if (data.isEmpty ||
                        data.contains(null) ||
                        data1.isEmpty ||
                        data1.contains(null) ||
                        data2.isEmpty ||
                        data2.contains(null)) {
                      return const CircularProgressIndicator();
                    } else {
                      return Card(
                          child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Image.asset('images/smartphone.png')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Member Id : ${widget.memberId}"),
                                Text("amount : ${data[index]}"),
                                Text("type : ${data1[index]}"),
                                Text("created at : ${data2[index]}")
                              ],
                            ),
                          ),
                        ],
                      ));
                    }
                  }))
        ],
      ),
    );
  }
}
