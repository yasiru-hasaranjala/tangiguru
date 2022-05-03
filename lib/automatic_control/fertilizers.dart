import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FertilizersAC extends StatefulWidget {
  const FertilizersAC({Key? key}) : super(key: key);

  @override
  State<FertilizersAC> createState() => _FertilizersACState();
}

class _FertilizersACState extends State<FertilizersAC> {

  String n = "--";
  String p = '--';
  String k = '--';

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

  @override
  void initState() {
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
            ],
          ),
        )
    );
  }
}
