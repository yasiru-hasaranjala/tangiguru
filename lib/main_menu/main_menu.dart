import 'package:app/main_menu/automatic_control.dart';
import 'package:app/main_menu/user_control.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

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
        child: Column(
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

  Widget userControl(context, size) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => UserControl()),
        );
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
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
      ),
    );
  }

  Widget automaticControl(context, size) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AutomaticControl()),
        );
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
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
      ),
    );
  }
}
