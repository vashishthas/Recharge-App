import 'package:flutter/material.dart';
import 'package:pay_to_fast/model/model_item.dart';

class DthRecharge extends StatefulWidget {
  const DthRecharge({Key? key}) : super(key: key);

  @override
  _DthRechargeState createState() => _DthRechargeState();
}

class _DthRechargeState extends State<DthRecharge> {
  String? valueChoose;
  String? valueChoose2;

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
                        value: valueChoose,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: ModelItem()
                            .dthProvider
                            .map<DropdownMenuItem<String>>((String newValue) {
                          return DropdownMenuItem<String>(
                            value: newValue,
                            child: Text(newValue),
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
                            .postpaidCircle
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
                const Padding(
                  padding: EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Center(
                    child: SizedBox(
                      height: 44,
                      child: TextField(
                        autocorrect: true,
                        decoration: InputDecoration(
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
                const Padding(
                  padding: EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Center(
                    child: SizedBox(
                      height: 44,
                      child: TextField(
                        autocorrect: true,
                        decoration: InputDecoration(
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
                  height: 180,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: SizedBox(
                    height: 42,
                    width: double.infinity,
                    child: TextButton(
                      onPressed: null,
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
