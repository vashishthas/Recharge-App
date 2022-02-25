
import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 15),
            Center(
              child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset("images/success.gif")),
            ),
            const Center(
                child: Text(
              "Successful",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
            const SizedBox(
              height: 40,
            ),
            const Center(
                child: Text(
              "Payment done Successfully",
              style: TextStyle(fontSize: 20),
            )),
            const Spacer(flex: 5),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.popUntil(
                      context, (Route<dynamic> route) => route.isFirst);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Colors.blue,
                  ),
                  // height: 90,
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  child: const Center(
                      child: Text("Ok",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ))),
                ),
              ),
            ),
            const Spacer(flex: 15),
          ],
        ),
      ),
    );
  }
}
