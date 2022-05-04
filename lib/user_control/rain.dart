import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Rain extends StatefulWidget {
  const Rain({Key? key}) : super(key: key);

  @override
  State<Rain> createState() => _RainState();
}

class _RainState extends State<Rain> {
  String temp = "--";
  String humidity = "Humidity = --";
  String mode = '3';

  final tempRef = FirebaseDatabase.instance.reference();

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
        humidity = "Humidity     =    $val %";
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

  @override
  void initState() {
    tempListener();
    humListener();
    weatherListener();
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
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
                "Weather",
                style: TextStyle(
                  fontSize: 28.0,
                  fontFamily: 'Hind',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                mode == '0' ? Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                  ),
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    height: MediaQuery.of(context).size.width*0.28,
                    width: MediaQuery.of(context).size.width*0.21,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/soil.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ) : Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  height: MediaQuery.of(context).size.width*0.28,
                  width: MediaQuery.of(context).size.width*0.21,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/soil.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ) ,
                mode == '1' ? Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                  ),
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    height: MediaQuery.of(context).size.width*0.28,
                    width: MediaQuery.of(context).size.width*0.21,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/rain.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ) : Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  height: MediaQuery.of(context).size.width*0.28,
                  width: MediaQuery.of(context).size.width*0.21,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/rain.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                mode == '2' ? Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                  ),
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(15, 0, 5, 0),
                    height: MediaQuery.of(context).size.width*0.28,
                    width: MediaQuery.of(context).size.width*0.21,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/sun2.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ) : Container(
                  margin: const EdgeInsets.fromLTRB(15, 0, 5, 0),
                  height: MediaQuery.of(context).size.width*0.28,
                  width: MediaQuery.of(context).size.width*0.21,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/sun2.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.52,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Get.width * 0.02),
                ),
              ),
              margin: const EdgeInsets.fromLTRB(12, 50, 12, 20),
              child: Center(
                child: Text(
                  temp,
                  style: const TextStyle(
                    fontSize: 48.0,
                    fontFamily: 'Hind',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.82,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Get.width * 0.02),
                ),
              ),
              margin: const EdgeInsets.fromLTRB(12, 50, 12, 20),
              padding: const EdgeInsets.fromLTRB(12, 15, 12, 15),
              child: Center(
                child: Text(
                  "Temparature    =   " + temp,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22.0,
                    fontFamily: 'Hind',
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.82,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Get.width * 0.02),
                ),
              ),
              margin: const EdgeInsets.fromLTRB(12, 15, 12, 20),
              padding: const EdgeInsets.fromLTRB(12, 15, 12, 15),
              child: Center(
                child: Text(
                  humidity,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22.0,
                    fontFamily: 'Hind',
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}
