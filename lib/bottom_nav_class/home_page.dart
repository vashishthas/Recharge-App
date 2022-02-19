import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pay_to_fast/model/mysql.dart';
import 'package:pay_to_fast/recharge_bill_options/recharge_options.dart';

class HomePage extends StatefulWidget {
  String memberId;
  String password;
  String email;
  HomePage(
      {Key? key,
      required this.memberId,
      required this.password,
      required this.email})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var data = [
    {"title": "Mobile Recharge", "image": "images/mobile_recharge.png"},
    {"title": "FASTag Recharge", "image": "images/fastag.png"},
    {"title": "Money Transfer", "image": "images/money_transfer.png"},
    {"title": "Balance Enquiey", "image": "images/balance_enq.png"},
    {"title": "Electricity", "image": "images/electricity_recharge.png"},
    {"title": "DTH", "image": "images/dth_recharge.png"},
    {"title": "Cable TV", "image": "images/tv.png"},
    {"title": "UPI QR", "image": "images/upi_qr.png"},
    {"title": "Claim Refund", "image": "images/claim.png"},
    {"title": "Mini Statement", "image": "images/mini_statement.png"},
    {"title": "Wallet", "image": "images/wallet.png"},
  ];

  var _balance = 0.0;
  var db = Mysql();

  Future<String?> _getBalanceFromWalletTable(String email) async {
    var query = "SELECT * FROM `wallet` WHERE `email` LIKE '$email'";
    await db.getConnection().then((conn) => {
          conn.query(query).then((result) {
            setState(() {
              _balance = result.first.values?.last as double;
            });
          })
        });
  }

  Widget myGridItems() {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0, left: 5),
      child: GridView.builder(
          itemCount: 11,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (index == 0) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const RechargeOptions()));
                }
              },
              child: Card(
                color: Colors.white,
                elevation: 8,
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: Image.asset(
                            '${data[index]['image']}',
                            width: 56,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: Text(
                            '${data[index]['title']}',
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: const Key("home"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Image.asset(
              'images/home_logo.jpeg',
              height: 40,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14, right: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () async {
                    await _getBalanceFromWalletTable(widget.email);
                  },
                  child: const Card(
                    color: Colors.green,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "get balance ",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Card(
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "$_balance",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14, top: 20),
            child: Row(
              children: const [
                Text(
                  "Services",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: SizedBox(
                height: 600,
                child: myGridItems(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
