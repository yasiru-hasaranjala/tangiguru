import 'package:app/user_control/nav_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class UserControl extends StatelessWidget {
  UserControl({Key? key}) : super(key: key);
  final fb = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("User Mode"),
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
                  padding: const EdgeInsets.all(20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1,
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (BuildContext context, index) {
                    return Builder(
                        builder: (context) {
                          switch (index) {
                            case 0:
                              return soilMoisture(context);
                            case 1:
                              return rain(context);
                            case 2:
                              return fertilizers(context);
                            case 3:
                              return phValue(context);
                            default:
                              return soilMoisture(context);
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

  Widget soilMoisture(context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const NavBar(givenIndex: 0)),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Image(
                image: AssetImage('assets/images/soil2.jpg'),
                fit: BoxFit.fitWidth,
              ),
            ),
            Text('Soil moisture', style: TextStyle(fontSize: 18)),
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
              builder: (context) => const NavBar(givenIndex: 1)),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Image(
                image: AssetImage('assets/images/water.jpg'),
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
              builder: (context) => const NavBar(givenIndex: 2)),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Image(
                image: AssetImage('assets/images/fe.png'),
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
              builder: (context) => const NavBar(givenIndex: 3)),
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

  Widget sun(context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const NavBar(givenIndex: 4)),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Image(
                image: AssetImage('assets/images/sun.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
            Text('Sunlight', style: TextStyle(fontSize: 18)),
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