import 'package:app/fertilizers.dart';
import 'package:app/ph_value.dart';
import 'package:app/rain.dart';
import 'package:app/soil_moisture.dart';
import 'package:app/sunlight.dart';
import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  final int givenIndex;
  const MyStatefulWidget({Key? key, required this.givenIndex}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    SoilMoisture(),
    Rain(),
    Fertilizers(),
    PhValues(),
    Sunlight()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _selectedIndex = widget.givenIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.adb),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.water_outlined),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.science_outlined),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.watch_rounded),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wb_sunny),
            label: "",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black38,
        onTap: _onItemTapped,
      ),
    );
  }
}
