import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhValues extends StatefulWidget {
  const PhValues({Key? key}) : super(key: key);

  @override
  State<PhValues> createState() => _PhValuesState();
}

class _PhValuesState extends State<PhValues> {
  String ph = "00";
  String phMsg = "Loading";

  final tempRef = FirebaseDatabase.instance.reference();

  void phListener(){
    tempRef.child("FirebaseIOT/PH_Value").onValue.listen((event) {
      final Object? val = event.snapshot.value;
      setState(() {
        ph = "$val";
      });
    });
  }

  void phMsgListener(){
    tempRef.child("FirebaseIOT/PH_msg").onValue.listen((event) {
      final Object? val = event.snapshot.value;
      setState(() {
        phMsg = "$val";
      });
    });
  }

  @override
  void initState() {
    phListener();
    phMsgListener();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
        child: Center(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
                child: const Text(
                  "PH Value",
                  style: TextStyle(
                    fontSize: 28.0,
                    fontFamily: 'Hind',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.52,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Get.width * 0.02),
                  ),
                ),
                margin: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                child: Center(
                  child: Text(
                    "pH  =  " + ph,
                    style: const TextStyle(
                      fontSize: 40.0,
                      fontFamily: 'Hind',
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.88,
                decoration: ShapeDecoration(
                  color: Colors.deepOrangeAccent.shade100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Get.width * 0.01),
                  ),
                ),
                margin: const EdgeInsets.fromLTRB(20, 50, 20, 10),
                padding: const EdgeInsets.fromLTRB(12, 30, 12, 30),
                alignment: Alignment.center,
                child: Center(
                  child: Text(
                    double.parse(ph) < 4.9 || double.parse(ph) > 7.5
                        ? "Not Suitable for Corn Cultivation"
                        : "Suitable for Corn cultivation",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontFamily: 'Hind',
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
