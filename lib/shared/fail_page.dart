import 'package:flutter/material.dart';
import 'package:pay_to_fast/model/recharge_model.dart';

class FailPage extends StatelessWidget {
  final RechargeModel? model;
  const FailPage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String errMsg = "some internal issue";
    if (model != null) {
      String errMsg = model!.response.errorMessage.trim().isEmpty
          ? "some internal issue"
          : model!.response.errorMessage;
    }
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: model == null
              ? Column(
                  children: [
                    // const Spacer(),
                    const Center(
                      child: Text(
                        'Payment failed!',
                        style: TextStyle(fontSize: 28),
                      ),
                    ),
                    const Spacer(flex: 20),
                    const Center(
                      child: Text(
                          "Payment failed due to server error.\n Try again after sometime",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 22)),
                    ),
                    const Spacer(flex: 20),
                    TextButton(
                        onPressed: () {
                          Navigator.popUntil(
                              context, (Route<dynamic> route) => route.isFirst);
                        },
                        child: const Text(
                          "Go to Home screen",
                          style: TextStyle(
                              fontSize: 18,
                              decoration: TextDecoration.underline),
                        )),
                    const Spacer(flex: 10),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Payment ${model!.response.status.toLowerCase()}',
                        style: const TextStyle(fontSize: 28),
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Center(
                        child: Text(
                      "Your request for recharge could not be processed this time. Please try after sometime",
                      style: TextStyle(fontSize: 22),
                    )),
                    const SizedBox(height: 40),
                    Text(
                      "Your payment for transaction ID: ${model!.response.apiTransId} could not be processed on ${model!.response.transactionDate} due to $errMsg.",
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(flex: 10),
                    TextButton(
                        onPressed: () {
                          Navigator.popUntil(
                              context, (Route<dynamic> route) => route.isFirst);
                        },
                        child: const Text(
                          "Go to Home screen",
                          style: TextStyle(
                              fontSize: 18,
                              decoration: TextDecoration.underline),
                        ))
                  ],
                ),
        ),
      ),
    );
  }
}
