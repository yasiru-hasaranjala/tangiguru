import 'package:app/components/box_togle.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Fertilizers extends StatefulWidget {
  const Fertilizers({Key? key}) : super(key: key);

  @override
  State<Fertilizers> createState() => _FertilizersState();
}

class _FertilizersState extends State<Fertilizers> {

  String n = "--";
  String p = '--';
  String k = '--';
  bool nIP = true;
  bool pIP = true;
  bool kIP = true;
  bool loadN = false;
  bool loadP = false;
  bool loadK = false;
  DatabaseReference nRef = FirebaseDatabase.instance.ref("FirebaseIOT/N_pump");
  DatabaseReference pRef = FirebaseDatabase.instance.ref("FirebaseIOT/P_pump");
  DatabaseReference kRef = FirebaseDatabase.instance.ref("FirebaseIOT/K_pump");
  final tempRef = FirebaseDatabase.instance.reference();

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

  void nInit() async {
    DatabaseEvent event = await nRef.once();
    setState(() {
      if(event.snapshot.value == 1){
        setState(() {
          nIP = false;
          loadN = true;
        });
      } else{
        setState(() {
          nIP = true;
          loadN = true;
        });
      }
    });
  }

  void pInit() async {
    DatabaseEvent event = await pRef.once();
    setState(() {
      if(event.snapshot.value == 1){
        setState(() {
          pIP = false;
          loadP = true;
        });
      } else{
        setState(() {
          pIP = true;
          loadP = true;
        });
      }
    });
  }

  void kInit() async {
    DatabaseEvent event = await kRef.once();
    setState(() {
      if(event.snapshot.value == 1){
        setState(() {
          kIP = false;
          loadK = true;
        });
      } else{
        setState(() {
          kIP = true;
          loadK = true;
        });
      }
    });
  }

  @override
  void initState() {
    nInit();
    pInit();
    kInit();
    nListener();
    pListener();
    kListener();
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
                  "Fertilizers",
                  style: TextStyle(
                    fontSize: 28.0,
                    fontFamily: 'Hind',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.2,
                    color: Colors.black,
                    margin: const EdgeInsets.fromLTRB(20, 20, 2, 20),
                    child: const Center(
                      child: Text(
                        "N",
                        style: TextStyle(
                          fontSize: 48.0,
                          fontFamily: 'Hind',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.6,
                    color: Colors.white,
                      margin: const EdgeInsets.fromLTRB(4, 20, 20, 20),
                      child: Center(
                        child: Text(
                          n,
                          style: const TextStyle(
                            fontSize: 48.0,
                            fontFamily: 'Hind',
                            color: Colors.pink,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ),
                ],
              ),
              !loadN ? Container(height: 93) : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.25,
                    decoration: ShapeDecoration(
                      color: Colors.black54,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    margin: const EdgeInsets.fromLTRB(10, 22, 2, 20),
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: const Center(
                      child: Text(
                        "N Pump",
                        style: TextStyle(
                          fontSize: 22.0,
                          fontFamily: 'Hind',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "-",
                    style: TextStyle(
                      fontSize: 50.0,
                      fontFamily: 'Hind',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: BoxToggle(
                      values: const ['OFF ', 'ON '],
                      initVal: nIP,
                      onToggleCallback: (value) {
                        tempRef.child('/FirebaseIOT').child('N_pump').set(value);
                        setState(() {
                          nIP = !nIP;
                        });
                      },
                      buttonColor: Colors.pink,
                      backgroundColor: Colors.pink.shade100,
                      textColor: const Color(0xFFFFFFFF),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.2,
                    color: Colors.black,
                    margin: const EdgeInsets.fromLTRB(20, 20, 2, 20),
                    child: const Center(
                      child: Text(
                        "P",
                        style: TextStyle(
                          fontSize: 48.0,
                          fontFamily: 'Hind',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.6,
                    color: Colors.white,
                    margin: const EdgeInsets.fromLTRB(4, 20, 20, 20),
                    child: Center(
                      child: Text(
                        p,
                        style: const TextStyle(
                          fontSize: 48.0,
                          fontFamily: 'Hind',
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              !loadP ? Container(height: 93) : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.25,
                    decoration: ShapeDecoration(
                      color: Colors.black54,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    margin: const EdgeInsets.fromLTRB(10, 22, 2, 20),
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: const Center(
                      child: Text(
                        "P Pump",
                        style: TextStyle(
                          fontSize: 22.0,
                          fontFamily: 'Hind',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "-",
                    style: TextStyle(
                      fontSize: 50.0,
                      fontFamily: 'Hind',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: BoxToggle(
                      values: const ['OFF ', 'ON '],
                      initVal: pIP,
                      onToggleCallback: (value) {
                        tempRef.child('/FirebaseIOT').child('P_pump').set(value);
                        setState(() {
                          pIP = !pIP;
                        });
                      },
                      buttonColor: Colors.deepPurple,
                      backgroundColor: Colors.deepPurple.shade100,
                      textColor: const Color(0xFFFFFFFF),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.2,
                    color: Colors.black,
                    margin: const EdgeInsets.fromLTRB(20, 20, 2, 20),
                    child: const Center(
                      child: Text(
                        "K",
                        style: TextStyle(
                          fontSize: 48.0,
                          fontFamily: 'Hind',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.6,
                    color: Colors.white,
                    margin: const EdgeInsets.fromLTRB(4, 20, 20, 20),
                    child: Center(
                      child: Text(
                        k,
                        style: const TextStyle(
                          fontSize: 48.0,
                          fontFamily: 'Hind',
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              !loadK ? Container(height: 93) : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.25,
                    decoration: ShapeDecoration(
                      color: Colors.black54,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    margin: const EdgeInsets.fromLTRB(10, 22, 2, 20),
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: const Center(
                      child: Text(
                        "K Pump",
                        style: TextStyle(
                          fontSize: 22.0,
                          fontFamily: 'Hind',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "-",
                    style: TextStyle(
                      fontSize: 50.0,
                      fontFamily: 'Hind',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: BoxToggle(
                      values: const ['OFF ', 'ON '],
                      initVal: kIP,
                      onToggleCallback: (value) {
                        tempRef.child('/FirebaseIOT').child('K_pump').set(value);
                        setState(() {
                          kIP = !kIP;
                        });
                      },
                      buttonColor: Colors.deepOrange,
                      backgroundColor: Colors.deepOrange.shade100,
                      textColor: const Color(0xFFFFFFFF),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}
