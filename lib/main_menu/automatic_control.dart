import 'package:app/automatic_control/nav_bar.dart';
import 'package:app/user_control/nav_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AutomaticControl extends StatefulWidget {
  AutomaticControl({Key? key}) : super(key: key);

  @override
  State<AutomaticControl> createState() => _AutomaticControlState();
}

class _AutomaticControlState extends State<AutomaticControl> {
  String ph = "--";
  String phMsg = "Loading";
  String pump = "";
  String n = "--";
  String p = '--';
  String k = '--';
  String temp = "--";
  String humidity = "Humidity = --";
  String mode = '3';

  final tempRef = FirebaseDatabase.instance.reference();

  void pumpListener(){
    tempRef.child("FirebaseIOT/water_pump").onValue.listen((event) {
      final Object? val = event.snapshot.value;
      setState(() {
        pump = "$val";
      });
    });
  }
  void tempListener(){
    tempRef.child("FirebaseIOT/T_Value").onValue.listen((event) {
      final Object? val = event.snapshot.value;
      setState(() {
        temp = "$val \'C";
      });
    });
  }

  void humListener(){
    tempRef.child("FirebaseIOT/H_Value").onValue.listen((event) {
      final Object? val = event.snapshot.value;
      setState(() {
        humidity = "Humidity   =   $val";
      });
    });
  }

  void weatherListener(){
    tempRef.child("FirebaseIOT/W_mode").onValue.listen((event) {
      final Object? val = event.snapshot.value;
      setState(() {
        mode = '$val';
      });
    });
  }

  void nListener(){
    tempRef.child("FirebaseIOT/N_Value").onValue.listen((event) {
      final Object? val = event.snapshot.value;
      setState(() {
        n = "$val";
      });
    });
  }

  void pListener(){
    tempRef.child("FirebaseIOT/P_Value").onValue.listen((event) {
      final Object? val = event.snapshot.value;
      setState(() {
        p = '$val';
      });
    });
  }

  void kListener(){
    tempRef.child("FirebaseIOT/K_Value").onValue.listen((event) {
      final Object? val = event.snapshot.value;
      setState(() {
        k = '$val';
      });
    });
  }

  void phListener(){
    tempRef.child("FirebaseIOT/PH_Value").onValue.listen((event) {
      final Object? val = event.snapshot.value;
      setState(() {
        ph = "pH value = $val";
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
    nListener();
    pListener();
    kListener();
    phListener();
    phMsgListener();
    tempListener();
    humListener();
    weatherListener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Automatic Mode"),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.98,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Get.width * 0.02),
                    ),
                  ),
                  margin: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                  padding: const EdgeInsets.fromLTRB(15, 5, 5, 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ph,
                            style: const TextStyle(
                              fontSize: 23.0,
                              fontFamily: 'Hind',
                              color: Colors.pink,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            phMsg,
                            style: const TextStyle(
                              fontSize: 17.0,
                              fontFamily: 'Hind',
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: Image(
                          height: Get.height* 0.08,
                          image: const AssetImage('assets/images/ph2.png'),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.88,
                  decoration: ShapeDecoration(
                    color: Colors.amberAccent.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Get.width * 0.03),
                    ),
                  ),
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  padding: const EdgeInsets.fromLTRB(8, 20, 8, 20),
                  alignment: Alignment.center,
                  child: Center(
                    child: Text(
                      pump == "0"
                          ? "Soil Moisture is Wet\n Motor is OFF"
                          : "Soil Mosisture is Dry\n Motor is ON",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontFamily: 'Hind',
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.98,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Get.width * 0.02),
                    ),
                  ),
                  margin: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                  padding: const EdgeInsets.fromLTRB(15, 5, 5, 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "N  :  " + n,
                            style: const TextStyle(
                              fontSize: 23.0,
                              fontFamily: 'Hind',
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "P  :  " + p,
                            style: const TextStyle(
                              fontSize: 23.0,
                              fontFamily: 'Hind',
                              color: Colors.indigoAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "K  :  " + k,
                            style: const TextStyle(
                              fontSize: 23.0,
                              fontFamily: 'Hind',
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: Image(
                          height: Get.height* 0.08,
                          image: const AssetImage('assets/images/npk.png'),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.98,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Get.width * 0.02),
                    ),
                  ),
                  margin: const EdgeInsets.fromLTRB(15, 6, 15, 2),
                  padding: const EdgeInsets.fromLTRB(15, 5, 5, 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Weather",
                            style: TextStyle(
                              fontSize: 26.0,
                              fontFamily: 'Hind',
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "      " + temp,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'Hind',
                              color: Colors.indigoAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Text(
                              mode == '0'
                                  ? "Cloudy"
                                  : mode == '1'
                                    ? "Rainy"
                                    : "Sunny",
                              style: const TextStyle(
                                fontSize: 22.0,
                                fontFamily: 'Hind',
                                color: Colors.deepOrangeAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Image(
                          height: Get.height* 0.08,
                          image: mode == '0'
                              ? const AssetImage('assets/images/soil.png')
                              : mode == '1'
                              ? const AssetImage('assets/images/rain.png')
                              : const AssetImage('assets/images/sun.png'),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.98,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Get.width * 0.02),
                    ),
                  ),
                  margin: const EdgeInsets.fromLTRB(5, 15, 5, 0),
                  padding: const EdgeInsets.fromLTRB(15, 5, 5, 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Temperature   =   " + temp,
                            style: const TextStyle(
                              fontSize: 21.0,
                              fontFamily: 'Hind',
                              color: Colors.deepPurpleAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            humidity,
                            style: const TextStyle(
                              fontSize: 21.0,
                              fontFamily: 'Hind',
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }

}