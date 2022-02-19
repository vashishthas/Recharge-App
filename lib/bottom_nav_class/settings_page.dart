// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_to_fast/login.dart';

class SettingsPage extends StatefulWidget {
  String memberId;
  String password;

  SettingsPage({Key? key, required this.memberId, required this.password})
      : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 12, top: 15, right: 12),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              const Text(
                "Settings",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: const [
                  Icon(
                    Icons.person,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Account",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Divider(
                height: 15,
                thickness: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              buildAccountOptionRow(context, "Change password"),
              buildAccountOptionRow(context, "Content settings"),
              buildAccountOptionRow(context, "Social"),
              buildAccountOptionRow(context, "Language"),
              buildAccountOptionRow(context, "Privacy and security"),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: const [
                  Icon(
                    Icons.volume_up_outlined,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Notifications",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Divider(
                height: 15,
                thickness: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              buildNotificationOptionRow("New for you", true),
              buildNotificationOptionRow("Account activity", true),
              buildNotificationOptionRow("Opportunity", false),
              const SizedBox(
                height: 82,
              ),
              SizedBox(
                height: 42,
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const Login()));
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.green,
                  ),
                  child: const Text(
                    'SIGN OUT',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: Colors.green,
              value: isActive,
              onChanged: (bool val) {},
            ))
      ],
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text("Option 1"),
                    Text("Option 2"),
                    Text("Option 3"),
                  ],
                ),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Close")),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
