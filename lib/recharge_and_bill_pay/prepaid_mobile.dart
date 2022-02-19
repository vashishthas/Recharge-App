import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pay_to_fast/model/model_item.dart';
import 'package:pay_to_fast/model/recharge_model.dart';
import 'package:http/http.dart' as http;

class PrepaidMobile extends StatefulWidget {
  const PrepaidMobile({Key? key}) : super(key: key);

  @override
  _PrepaidMobileState createState() => _PrepaidMobileState();
}

class _PrepaidMobileState extends State<PrepaidMobile> {
  String? valueChoose;
  String? valueChoose2;

  var _model;

  final TextEditingController plan = TextEditingController();
  final TextEditingController mobileNo = TextEditingController();

  Future<RechargeModel?> reqRecharge(
      String? mobileNo, String? operator, String? circle, String? plan) async {
    try {
      const String url =
          "https://dkinfotechsolution.com/api/Api_recharge_function";

      var randomNo = (Random().nextInt(90) + 10).toString();

      var response = await http.post(Uri.parse(url), body: {
        "email": "mtb.supriyar@gmail.com",
        "member_id": "DISAPI1003",
        "member_key": "KeMbJKEs",
        "mobile": "$mobileNo",
        "operator": "AT",
        "circle": "3",
        "plan": "8",
        "txn": "021254127$randomNo",
        "format": "json"
      });
      // print(response);
      if (response.statusCode == 200) {
        final str = response.body;
        setState(() {
          _model = rechargeModelFromJson(str).response.errorMessage;
        });
        return _model;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
  }

  showAlertDialog(
      BuildContext context, String? no, String? op, String? c, String? p) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Ok"),
      onPressed: () async {
        await reqRecharge(no, op, c, p);
        Navigator.of(context).pop();
        Fluttertoast.showToast(
            msg: "message : $_model",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Alert"),
      content: const Text("Are you want to proceed ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  // void reqRecharge(
  //     String? mobileNo, String? operator, String? circle, String? plan) async {
  //   try {
  //     const String url =
  //         "https://dkinfotechsolution.com/api/Api_recharge_function";

  //     var response = await http.post(Uri.parse(url), body: {
  //       "email": "mtb.supriyar@gmail.com",
  //       "member_id": "DISAPI1003",
  //       "member_key": "KeMbJKEs",
  //       "mobile": "6200588745",
  //       "operator": "AT",
  //       "circle": "3",
  //       "plan": "8",
  //       "txn": "02125412769",
  //       "format": "json"
  //     });
  //     // print(response);
  //     if (response.statusCode == 200) {
  //       final str = response.body;
  //       setState(() {
  //         _model = rechargeModelFromJson(str).response.errorMessage;
  //       });
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('PREPAID MOBILE'),
        ),
        body: Center(
          child: Card(
            elevation: 12,
            margin:
                const EdgeInsets.only(top: 10, right: 12, left: 12, bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    'Select Operator',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Container(
                      height: 44,
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButton(
                        hint: const Text("choose your Operator"),
                        underline: const SizedBox(),
                        isExpanded: true,
                        value: valueChoose,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: ModelItem()
                            .prepaidOperator
                            .map<DropdownMenuItem<String>>((String newValue) {
                          return DropdownMenuItem<String>(
                            value: newValue,
                            child: Row(
                              children: [
                                Text(newValue),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            valueChoose = newValue.toString();
                          });
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    'Select Circle',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Container(
                      height: 44,
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButton(
                        hint: const Text("choose your Circle"),
                        underline: const SizedBox(),
                        isExpanded: true,
                        value: valueChoose2,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: ModelItem()
                            .prepaidCircle
                            .map<DropdownMenuItem<String>>((String newValue) {
                          return DropdownMenuItem<String>(
                            value: newValue,
                            child: Text(newValue),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            valueChoose2 = newValue.toString();
                          });
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    'Your Recharge Plan',
                    style: TextStyle(fontSize: 18, color: Colors.black),
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
                      child: TextField(
                        controller: plan,
                        autocorrect: true,
                        decoration: const InputDecoration(
                          hintText: 'Enter Your Recharge Plan',
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                                BorderSide(color: Colors.blue, width: 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    'Your Mobile No.',
                    style: TextStyle(fontSize: 18, color: Colors.black),
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
                      child: TextField(
                        controller: mobileNo,
                        autocorrect: true,
                        decoration: const InputDecoration(
                          hintText: 'Enter Mobile No',
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                                BorderSide(color: Colors.blue, width: 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 160,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: SizedBox(
                    height: 42,
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        final String? op = valueChoose;
                        final String? c = valueChoose2;
                        final String? p = plan.text;
                        final String? no = mobileNo.text;
                        showAlertDialog(context, no, op, c, p);
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.green,
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
