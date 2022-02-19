import 'package:flutter/material.dart';
import 'package:pay_to_fast/model/model_item.dart';

class BbpsService extends StatefulWidget {
  const BbpsService({Key? key}) : super(key: key);

  @override
  _BbpsServiceState createState() => _BbpsServiceState();
}

class _BbpsServiceState extends State<BbpsService> {
  String? valueChoose;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('BBPS SERVICE'),
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
                    'Select Service',
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
                        hint: const Text("choose your Service"),
                        underline: const SizedBox(),
                        isExpanded: true,
                        value: valueChoose,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: ModelItem()
                            .bbpsService
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
                  height: 530,
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
