import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pay_to_fast/model/model_item.dart';
import 'package:pay_to_fast/model/recharge_model.dart';
import 'package:http/http.dart' as http;
import 'package:pay_to_fast/shared/fail_page.dart';
import 'package:pay_to_fast/shared/succes%20page.dart';

class DthRecharge extends StatefulWidget {
  const DthRecharge({Key? key}) : super(key: key);

  @override
  _DthRechargeState createState() => _DthRechargeState();
}

class _DthRechargeState extends State<DthRecharge> {
  String? provider;
  String? circle;
  final planController = TextEditingController();
  final operatorIdController = TextEditingController();
  bool loading = false;

  Future<RechargeModel?> reqRecharge(
      {String? provider,
      String? operatorId,
      String? circle,
      String? plan}) async {
    try {
      const String url =
          "https://dkinfotechsolution.com/api/Api_recharge_function";

      var randomNo = (Random().nextInt(90) + 10).toString();

      var response = await http.post(Uri.parse(url), body: {
        "email": "mtb.supriyar@gmail.com",
        "member_id": "DISAPI1003",
        "member_key": "KeMbJKEs",
        "mobile": operatorId,
        "operator": provider,
        "circle": circle,
        "plan": plan,
        "txn": "021254127$randomNo",
        "format": "json"
      });
      if (response.statusCode == 200) {
        final str = response.body;
        final _model = rechargeModelFromJson(str);
        return _model;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
  }

  showAlertDialog({required BuildContext context}) {
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
        Navigator.of(context).pop();
        if (mounted) {
          setState(() {
            loading = true;
          });
        }
        final RechargeModel? response = await reqRecharge(
            provider: provider,
            operatorId: operatorIdController.text,
            circle: circle,
            plan: planController.text);
        if (mounted) {
          setState(() {
            loading = false;
          });
        }
        if (response == null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (builder) => const FailPage(
                model: null,
              ),
            ),
          );
        } else {
          print(response.toString());
          if (response.response.status == "SUCCESS") {
            //success page
            Navigator.push(context,
                MaterialPageRoute(builder: (builder) => const SuccessPage()));
          } else {
            //Fail page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (builder) => FailPage(model: response),
              ),
            );
          }
        }
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Alert"),
      content: SizedBox(
          height: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Are you sure, you want to proceed ?"),
              const Spacer(),
              Text("Provider: $provider"),
              Text("Operator Id: ${operatorIdController.text}"),
              Text("Plan: ${planController.text}"),
              Text("Circle: $circle"),
              const Spacer(),
            ],
          )),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('DTH RECHARGE'),
        ),
        body: Center(
          child: Card(
            elevation: 12,
            margin:
                const EdgeInsets.only(top: 10, right: 12, left: 12, bottom: 10),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 12.0),
                      child: Text(
                        'Select Provider',
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
                            hint: const Text("choose your Provider"),
                            underline: const SizedBox(),
                            isExpanded: true,
                            value: provider,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: ModelItem()
                                .dthProvider
                                .map<DropdownMenuItem<String>>(
                                    (String newValue) {
                              return DropdownMenuItem<String>(
                                value: newValue,
                                child: Text(newValue),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                provider = newValue.toString();
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
                            value: circle,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: ModelItem()
                                .postpaidCircle
                                .map<DropdownMenuItem<String>>(
                                    (String newValue) {
                              return DropdownMenuItem<String>(
                                value: newValue,
                                child: Text(newValue),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                circle = newValue.toString();
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
                            autocorrect: true,
                            controller: planController,
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
                        'Your Operator ID',
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
                            controller: operatorIdController,
                            autocorrect: true,
                            decoration: const InputDecoration(
                              hintText: 'Enter operator Id',
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
                      height: 180,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                      child: SizedBox(
                        height: 42,
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {
                            // final String? op = valueChoose;
                            // final String? c = valueChoose2;
                            // final String? p = planController.text;
                            // final String? no = operatorIdController.text;
                            showAlertDialog(context: context);
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
                if (loading)
                  const Center(
                    child: CircularProgressIndicator(),
                  )
              ],
            ),
          ),
        ));
  }
}
