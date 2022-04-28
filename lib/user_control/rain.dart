import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Rain extends StatelessWidget {
  const Rain({Key? key}) : super(key: key);

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
            const Padding(
              padding: EdgeInsets.only(top: 70),
              child: Text(
                "Weather",
                style: TextStyle(
                  fontSize: 25.0,
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
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  height: MediaQuery.of(context).size.width*0.3,
                  width: MediaQuery.of(context).size.width*0.23,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/soil.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                  height: MediaQuery.of(context).size.width*0.3,
                  width: MediaQuery.of(context).size.width*0.2,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/rain.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  height: MediaQuery.of(context).size.width*0.3,
                  width: MediaQuery.of(context).size.width*0.2,
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
              width: MediaQuery.of(context).size.width*0.4,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Get.width * 0.02),
                ),
              ),
              margin: const EdgeInsets.fromLTRB(20, 20, 2, 20),
              child: const Center(
                child: Text(
                  " 26 'C ",
                  style: TextStyle(
                    fontSize: 48.0,
                    fontFamily: 'Hind',
                    color: Colors.black,
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
