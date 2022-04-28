import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../components/box_togle.dart';

class SoilMoisture extends StatefulWidget {
  const SoilMoisture({Key? key}) : super(key: key);

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  State<SoilMoisture> createState() => _SoilMoistureState();
}

class _SoilMoistureState extends State<SoilMoisture> {
  final fb = FirebaseDatabase.instance;
  final myController = TextEditingController();
  String soiVal = "Moisture Value";
  final tempRef = FirebaseDatabase.instance.reference();
  bool initialPosition = true;
  bool load = false;
  DatabaseReference motRef = FirebaseDatabase.instance.ref("FirebaseIOT/water_pump");

  void asyncInit() async {
    DatabaseEvent event = await motRef.once();
    setState(() {
      if(event.snapshot.value == 1){
        setState(() {
          initialPosition = false;
          load = true;
        });
      } else{
        setState(() {
          initialPosition = true;
          load = true;
        });
      }
    });
    activeListener();
  }
  void activeListener(){
    tempRef.child("FirebaseIOT/SM_Value").onValue.listen((event) {
      final Object? val = event.snapshot.value;
      setState(() {
        soiVal = "Moisture Value = $val";
      });
    });
  }

  @override
  void initState() {
    asyncInit();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final ref = fb.reference();
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 70),
              child: Text(
                "Soil Moisture",
                style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: 'Hind',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Container(
            //     child: Column(
            //       children: <Widget>[
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: <Widget>[
            //             Text(name),
            //             SizedBox(width: 20),
            //             Expanded(child: TextField(controller: myController)),
            //           ],
            //         ),
            //         ElevatedButton(
            //           onPressed: () {
            //             ref.child(name).set(myController.text);
            //           },
            //           child: Text("Submit"),
            //         ),
            //       ],
            //     ),
            // ),
            const SizedBox(height: 50),
            Container(
              width: MediaQuery.of(context).size.width*0.8,
              color: Colors.greenAccent,
              margin: const EdgeInsets.fromLTRB(2, 22, 2, 20),
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Center(
                child: Text(
                  soiVal,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontFamily: 'Hind',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            !load ? Container(height: 93) : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.35,
                  color: Colors.black,
                  margin: const EdgeInsets.fromLTRB(2, 22, 2, 20),
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: const Center(
                    child: Text(
                      "Water Pump-",
                      style: TextStyle(
                        fontSize: 22.0,
                        fontFamily: 'Hind',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: BoxToggle(
                    values: const ['OFF ', 'ON '],
                    initVal: initialPosition,
                    onToggleCallback: (value) {
                      ref.child('/FirebaseIOT').child('water_pump').set(value);

                    },
                    buttonColor: Colors.green,
                    backgroundColor: Colors.green.shade200,
                    textColor: const Color(0xFFFFFFFF),
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.7,
              height: MediaQuery.of(context).size.width*0.5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/soil.gif"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}