import 'package:app/automatic_control/nav_bar.dart';
import 'package:app/user_control/nav_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AutomaticControl extends StatelessWidget {
  AutomaticControl({Key? key}) : super(key: key);
  final fb = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Farming App"),
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
                GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 4,
                  primary: false,
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10
                  ),
                  itemBuilder: (BuildContext context, index) {
                    return Builder(
                        builder: (context) {
                          switch (index) {
                            case 0:
                              return sunLight(context);
                            case 1:
                              return phValue(context);
                            case 2:
                              return rain(context);
                            case 3:
                              return fertilizers(context);
                            default:
                              return sunLight(context);
                          }
                        }
                    );
                  },
                ),
              ],
            ),
          ),
        )
    );
  }

  Widget sunLight(context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const NavBarAC(givenIndex: 0)),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.fromLTRB(40, 5, 40, 20),
              child: Image(
                image: AssetImage('assets/images/sunrain.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
            Text('Sun Light', style: TextStyle(fontSize: 18)),
          ],
        ),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
      ),
    );
  }

  Widget rain(context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const NavBarAC(givenIndex: 2)),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Image(
                image: AssetImage('assets/images/watering.jpg'),
                fit: BoxFit.fitWidth,
              ),
            ),
            Text('Weather', style: TextStyle(fontSize: 18)),
          ],
        ),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
      ),
    );
  }

  Widget fertilizers(context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const NavBarAC(givenIndex: 3)),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Image(
                image: AssetImage('assets/images/npk.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
            Text('Fertilizers', style: TextStyle(fontSize: 18)),
          ],
        ),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
      ),
    );
  }

  Widget phValue(context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const NavBarAC(givenIndex: 1)),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
              child: Image(
                image: AssetImage('assets/images/ph2.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
            Text('PH value', style: TextStyle(fontSize: 18)),
          ],
        ),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
      ),
    );
  }
}