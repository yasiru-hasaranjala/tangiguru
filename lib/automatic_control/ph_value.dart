import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhValuesAC extends StatefulWidget {
  const PhValuesAC({Key? key}) : super(key: key);

  @override
  State<PhValuesAC> createState() => _PhValuesACState();
}

class _PhValuesACState extends State<PhValuesAC> {
  String ph = "--";

  final tempRef = FirebaseDatabase.instance.reference();

  void activeListener(){
    tempRef.child("FirebaseIOT/PH_Value").onValue.listen((event) {
      final Object? val = event.snapshot.value;
      setState(() {
        ph = "PH = $val";
      });
    });
  }

  @override
  void initState() {
    activeListener();
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
                margin: const EdgeInsets.fromLTRB(20, 50, 2, 20),
                child: Center(
                  child: Text(
                    ph,
                    style: const TextStyle(
                      fontSize: 40.0,
                      fontFamily: 'Hind',
                      color: Colors.pink,
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
