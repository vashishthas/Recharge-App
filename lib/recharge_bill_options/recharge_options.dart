import 'package:flutter/material.dart';
import 'package:pay_to_fast/recharge_and_bill_pay/bbps_service.dart';
import 'package:pay_to_fast/recharge_and_bill_pay/dth_recharge.dart';
import 'package:pay_to_fast/recharge_and_bill_pay/postpaid_mobile.dart';
import 'package:pay_to_fast/recharge_and_bill_pay/prepaid_mobile.dart';

class RechargeOptions extends StatefulWidget {
  const RechargeOptions({Key? key}) : super(key: key);

  @override
  _RechargeOptionsState createState() => _RechargeOptionsState();
}

class _RechargeOptionsState extends State<RechargeOptions> {
  Widget myGridItems(
      String gridName, int color1, int color2, int color3, int color4) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () => {
          if (gridName == 'Mobile Prepaid')
            {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const PrepaidMobile())),
            },
          if (gridName == 'Mobile Postpaid')
            {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const PostpaidMobile())),
            },
          if (gridName == 'DTH')
            {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const DthRecharge())),
            },
          if (gridName == 'BBPS')
            {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const BbpsService())),
            }
        },
        child: Container(
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [
                Color(color1),
                Color(color2),
                Color(color3),
                Color(color4)
              ],
              begin: Alignment.centerLeft,
              end: const Alignment(1.0, 1.0),
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Opacity(
                opacity: 0.2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    gridName,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Recharge \$Bill Pay"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            myGridItems("Mobile Prepaid", 0XFF1A237E, 0XFF303F9F, 0xFF3F51B5,
                0XFF7986CB),
            myGridItems("Mobile Postpaid", 0XFF1A237E, 0XFF303F9F, 0xFF3F51B5,
                0XFF7986CB),
            myGridItems("DTH", 0XFF1A237E, 0XFF303F9F, 0xFF3F51B5, 0XFF7986CB),
            myGridItems("BBPS", 0XFF1A237E, 0XFF303F9F, 0xFF3F51B5, 0XFF7986CB),
            myGridItems(
                "Electricity", 0XFF1A237E, 0XFF303F9F, 0xFF3F51B5, 0XFF7986CB),
            myGridItems("FastTag Recharge", 0XFF1A237E, 0XFF303F9F, 0xFF3F51B5,
                0XFF7986CB)
          ],
        ));
  }
}
