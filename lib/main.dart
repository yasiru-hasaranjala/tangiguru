import 'package:app/components/animation_togle.dart';
import 'package:app/nav_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final List<Widget> menu = [
      soilMoisture(context),
      rain(context),
      fertilizers(context),
      phValue(context),
      sun(context),
    ];
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xff57A632),
        primarySwatch: Colors.green,
        fontFamily: 'Georgia',
        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          headline6: TextStyle(fontSize: 25.0, fontFamily: 'Hind'),
          bodyText2: TextStyle(fontSize: 12.0, fontFamily: 'Hind'),
        ),
      ),
      home:WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Farming App"),
          ),
          body: Container(
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
                  AnimatedToggle(
                    values: const ['Automated ', 'Manual '],
                    onToggleCallback: (value) {},
                    buttonColor: Colors.green,
                    backgroundColor: Colors.green.shade200,
                    textColor: const Color(0xFFFFFFFF),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 5,
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
                          switch(index){
                            case 0: return soilMoisture(context);
                            case 1: return rain(context);
                            case 2: return fertilizers(context);
                            case 3: return phValue(context);
                            case 4: return sun(context);
                            default: return soilMoisture(context);
                          }
                        }
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ),
      ),
    );
  }

  Widget soilMoisture(context){
    return GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyStatefulWidget(givenIndex: 0)),
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

  Widget rain(context){
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyStatefulWidget(givenIndex: 1)),
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

  Widget fertilizers(context){
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyStatefulWidget(givenIndex: 2)),
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

  Widget phValue(context){
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyStatefulWidget(givenIndex: 3)),
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

  Widget sun(context){
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyStatefulWidget(givenIndex: 4)),
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