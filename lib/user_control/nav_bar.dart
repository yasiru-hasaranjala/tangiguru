import 'package:app/user_control/fertilizers.dart';
import 'package:app/user_control/ph_value.dart';
import 'package:app/user_control/rain.dart';
import 'package:app/user_control/robot.dart';
import 'package:app/user_control/soil_moisture.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  final int givenIndex;
  const NavBar({Key? key, required this.givenIndex}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    SoilMoisture(),
    Rain(),
    Fertilizers(),
    PhValues(),
    Robot()
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
            icon: Icon(Icons.adb),
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
