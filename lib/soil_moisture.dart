import 'package:flutter/material.dart';

import 'components/animation_togle.dart';
import 'components/box_togle.dart';

class SoilMoisture extends StatelessWidget {
  const SoilMoisture({Key? key}) : super(key: key);

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

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
            const SizedBox(height: 50),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: BoxToggle(
                  values: const ['OFF ', 'ON '],
                  onToggleCallback: (value) {},
                  buttonColor: Colors.green,
                  backgroundColor: Colors.green.shade200,
                  textColor: const Color(0xFFFFFFFF),
                ),
              ),
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