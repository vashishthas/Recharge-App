// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:pay_to_fast/model/mysql.dart';

class ProfilePage extends StatefulWidget {
  String memberId;
  String password;
  String email;

  ProfilePage({
    Key? key,
    required this.memberId,
    required this.password,
    required this.email,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Profile UI",
      home: EditProfilePage(
        memberId: widget.memberId,
        password: widget.password,
        email: widget.email,
      ),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  String memberId;
  String password;
  String email;

  EditProfilePage({
    Key? key,
    required this.memberId,
    required this.password,
    required this.email,
  }) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool showPassword = false;
  var name;

  var db = Mysql();

  void _getMailFromMembersTable() async {
    var query =
        "SELECT `name` FROM `users` WHERE `email` LIKE '${widget.email}'";
    db.getConnection().then((conn) => {
          conn.query(query).then((result) {
            setState(() {
              name = result.first.values!.first;
            });
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 12, top: 15, right: 12),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: [
                const Text(
                  "Edit Profile",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1),
                                  offset: const Offset(0, 10))
                            ],
                            shape: BoxShape.circle,
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("images/logo.jpg"))),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              color: Colors.green,
                            ),
                            child: const Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(bottom: 3),
                      labelText: "Name",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: name,
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                ),
                const SizedBox(
                  height: 35,
                ),
                TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(bottom: 3),
                      labelText: "Email",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: widget.email,
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                ),
                const SizedBox(
                  height: 35,
                ),
                TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(bottom: 3),
                      labelText: "Member Id",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: widget.memberId,
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                ),
                const SizedBox(
                  height: 35,
                ),
                TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(bottom: 3),
                      labelText: "Password",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: widget.password,
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                ),
                const SizedBox(
                  height: 85,
                ),
                SizedBox(
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: const EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}
