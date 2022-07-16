import 'package:app/components/box_togle.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class Robot extends StatefulWidget {
  const Robot({Key? key}) : super(key: key);

  @override
  State<Robot> createState() => _RobotState();
}

class _RobotState extends State<Robot> {

  final ref = FirebaseDatabase.instance.reference();
  String seedVal = "0";
  num initialPosition = 750;
  bool load = false;
  DatabaseReference sprayRef = FirebaseDatabase.instance.ref("FirebaseIOT/robot/spray");

  void asyncInit() async {
    DatabaseEvent event = await sprayRef.once();
    setState(() {
      print(event.snapshot.value);
      if(event.snapshot.value != null){
        setState(() {
          final Object? val = event.snapshot.value;
          initialPosition = int.parse(val.toString());
          load = true;
        });
      } else{
        setState(() {
          initialPosition = 750;
          load = true;
        });
      }
    });
    activeSprayListener();
    activeSeedListener();
  }
  void activeSprayListener(){
    ref.child("FirebaseIOT/robot/spray").onValue.listen((event) {
      final Object? val = event.snapshot.value;
      setState(() {
        initialPosition = int.parse(val.toString());
      });
    });
  }
  void activeSeedListener(){
    ref.child("FirebaseIOT/robot/seeds").onValue.listen((event) {
      final Object? val = event.snapshot.value;
      setState(() {
        seedVal = "$val";
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
                  "Robotics",
                  style: TextStyle(
                    fontSize: 28.0,
                    fontFamily: 'Hind',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: MediaQuery.of(context).size.width*0.8,
                color: Colors.orange,
                margin: const EdgeInsets.fromLTRB(2, 22, 2, 20),
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: const Center(
                  child: Text(
                    'Liquid Fertilizer Availability',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Hind',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              !load ? Container() : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: LiquidLinearProgressIndicator(
                      value: initialPosition/750.0,
                      backgroundColor: Colors.white,
                      direction: Axis.vertical,
                      valueColor: const AlwaysStoppedAnimation(Colors.cyan),
                      borderRadius: 15,
                      center: Text(
                        "${(initialPosition*100.0/750.0).toStringAsFixed(0)}%",
                        style: const TextStyle(
                          color: Colors.cyanAccent,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.31,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Center(
                      child: Text(
                        "${initialPosition.toString()}ml left",
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Hind',
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Container(
                width: MediaQuery.of(context).size.width*0.8,
                color: Colors.orange,
                margin: const EdgeInsets.fromLTRB(2, 22, 2, 20),
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: const Center(
                  child: Text(
                    'Corn Seed Planting Quantity',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Hind',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              !load ? Container(height: 93) : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.29,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Center(
                      child: Text(
                        seedVal,
                        style: const TextStyle(
                          fontSize: 70.0,
                          fontFamily: 'Hind',
                          color: Colors.deepOrange,
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
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Image(
                      image: const AssetImage('assets/images/plant.jpg'),
                      fit: BoxFit.fitWidth,
                      width: MediaQuery.of(context).size.width * 0.28,
                    ),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                  )
                ],
              ),
            ],
          ),
        )
    );
  }
}