import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pay_to_fast/main.dart';
import 'package:pay_to_fast/model/login_model.dart';
import 'package:pay_to_fast/model/mysql.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController id = TextEditingController();
  final TextEditingController pw = TextEditingController();

  var db = Mysql();
  var email;
  var count = 0;
  var _model;
  var _passwordVisible;

  @override
  void initState() {
    _passwordVisible = false;
  }

  Future<String?> _getMailFromMembersTable(String id) async {
    var query = "SELECT `email` FROM `members` WHERE `member_id` LIKE '$id'";
    await db.getConnection().then((conn) => {
          conn.query(query).then((result) {
            setState(() {
              email = result.first.values!.first;
            });
          })
        });
  }

  Future<LoginModel?> reqLogin(String? memberId, String? password) async {
    try {
      const String url = "https://munnarechrge.in/api/user_login";

      var response = await http.post(Uri.parse(url), body: {
        "memberid": memberId,
        "password": password,
      });
       log(response.toString());
      if (response.statusCode == 200) {
        final str = response.body;
        setState(() {
          _model = loginModelFromJson(str).message;
        });
        return _model;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.lock,
                  size: 80,
                ),
                const SizedBox(
                  height: 60,
                ),
                const Text(
                  "Welcome",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Center(
                    child: SizedBox(
                      height: 44,
                      child: TextFormField(
                        controller: id,
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.start,
                        autocorrect: true,
                        decoration: const InputDecoration(
                          hintText: 'Member Id',
                          contentPadding: EdgeInsets.only(left: 20),
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(7.0)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(7.0)),
                            borderSide:
                                BorderSide(color: Colors.green, width: 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Center(
                    child: SizedBox(
                      height: 44,
                      child: TextFormField(
                        controller: pw,
                        style: const TextStyle(color: Colors.white),
                        obscureText: !_passwordVisible,
                        textAlign: TextAlign.start,
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          contentPadding: const EdgeInsets.only(left: 20),
                          hintStyle: const TextStyle(color: Colors.white),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).primaryColorLight,
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(7.0)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(7.0)),
                            borderSide:
                                BorderSide(color: Colors.green, width: 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 42,
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () async {
                        await _getMailFromMembersTable(id.text);
                        await reqLogin(id.text, pw.text);

                        if (_model == "login successfully") {
                          Fluttertoast.showToast(
                              msg: "login successfully",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 3);

                          // Timer(const Duration(seconds: 3), () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (_) => MyHomePage(
                                          memberId: id.text,
                                          password: pw.text,
                                          email: email,
                                        )));
                          // });
                        } else {
                          Fluttertoast.showToast(
                              msg: "Invalid id or password",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 3);
                        }
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.green,
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
