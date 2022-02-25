import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pay_to_fast/login.dart';
import 'bottom_nav_class/history_page.dart';
import 'bottom_nav_class/home_page.dart';
import 'bottom_nav_class/profile_page.dart';
import 'bottom_nav_class/settings_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SpashScreen(),
    );
  }
}

class SpashScreen extends StatefulWidget {
  const SpashScreen({Key? key}) : super(key: key);

  @override
  _SpashScreenState createState() => _SpashScreenState();
}

class _SpashScreenState extends State<SpashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          key: const Key("value"),
          children: [
            Image.asset(
              'images/logo.jpeg',
              height: 120,
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "powered by dk infotech",
                style: TextStyle(
                    fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
            )
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  String memberId;
  String password;
  String email;

  MyHomePage({
    Key? key,
    required this.memberId,
    required this.password,
    required this.email,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _curIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _curIndex,
          iconSize: 22.0,
          onTap: (index) {
            _curIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.pink[900],
              icon: Image.asset(_curIndex == 0
                  ? 'images/ico_home_selected.png'
                  : 'images/ico_home.png'),
              label: "Home",
            ),
            BottomNavigationBarItem(
                backgroundColor: Colors.pink[900],
                icon: Image.asset(_curIndex == 1
                    ? 'images/ico_history_selected.png'
                    : 'images/ico_history.png'),
                label: "History"),
            BottomNavigationBarItem(
                backgroundColor: Colors.pink[900],
                icon: Image.asset(_curIndex == 2
                    ? 'images/ico_profile_selected.png'
                    : 'images/ico_profile.png'),
                label: "Profile"),
            BottomNavigationBarItem(
                backgroundColor: Colors.pink[900],
                icon: Image.asset(_curIndex == 3
                    ? 'images/ico_settings_selected.png'
                    : 'images/ico_settings.png'),
                label: "Settings"),
          ]),
      body: Center(
        child: _getWidget(widget.memberId, widget.password, widget.email),
      ),
    );
  }

  Widget _getWidget(String memberId, String password, String email) {
    switch (_curIndex) {
      case 0:
        return HomePage(memberId: memberId, password: password, email: email);
      case 1:
        return HistoryPage(memberId: memberId, password: password);
      case 2:
        return ProfilePage(
            memberId: memberId, password: password, email: email);
      default:
        return SettingsPage(memberId: memberId, password: password);
    }
  }
}
