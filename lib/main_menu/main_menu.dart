import 'package:app/main_menu/automatic_control.dart';
import 'package:app/main_menu/user_control.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  final ref = FirebaseDatabase.instance.reference();
  bool load = false;
  DatabaseReference motRef = FirebaseDatabase.instance.ref("FirebaseIOT/water_pump");
  String mode = "user";
  int tap = 1;

  @override
  void initState() {
    asyncInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Farming App"),
      ),
      body: Container(
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: !load ? Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            userControl(context, size),
            automaticControl(context, size)
          ],
        ) : Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            userControl(context, size),
            automaticControl(context, size)
          ],
        ),
      ),
    );
  }

  void asyncInit() async {
    DatabaseEvent event = await motRef.once();
    setState(() {
      if(event.snapshot.value == 1){
        setState(() {
          mode = "auto";
          load = true;
        });
      } else{
        setState(() {
          mode = "user";
          load = true;
        });
      }
    });
  }

  Widget userControl(context, size) {
    return GestureDetector(
      onTap: () {
        if(mode == "user") {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UserControl()),
          );
        }
        else if(mode == "auto"){
          ref.child('/FirebaseIOT').child('Mode').set(0);
          setState(() {
            mode = "user";
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              height: size.height * 0.28,
              width: size.width * 0.58,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Image(
                image: AssetImage('assets/images/hand.jpeg'),
                fit: BoxFit.fitWidth,
              ),
            ),
            const Text('User Control', style: TextStyle(fontSize: 21)),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: mode=="user" ? [
            const BoxShadow(color: Colors.green, spreadRadius: 8),
            const BoxShadow(color: Colors.yellow, spreadRadius: 5),
          ] : [],

        ),
      ),
    );
  }

  Widget automaticControl(context, size) {
    return GestureDetector(
      onTap: () {
        if(mode == "auto") {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AutomaticControl()),
          );
        }
        else if(mode == "user"){
          ref.child('/FirebaseIOT').child('Mode').set(1);
          setState(() {
            mode = "auto";
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              height: size.height * 0.28,
              width: size.width * 0.58,
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: const Image(
                image: AssetImage('assets/images/plant.jpg'),
                fit: BoxFit.fitWidth,
              ),
            ),
            const Text('Automatic Control', style: TextStyle(fontSize: 21)),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: mode=="auto" ? [
          const BoxShadow(color: Colors.green, spreadRadius: 8),
          const BoxShadow(color: Colors.yellow, spreadRadius: 5),
        ] : [],
        ),
      ),
    );
  }
}
