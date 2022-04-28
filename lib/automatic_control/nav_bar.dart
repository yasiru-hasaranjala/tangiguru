import 'package:app/automatic_control/fertilizers.dart';
import 'package:app/automatic_control/ph_value.dart';
import 'package:app/automatic_control/rain.dart';
import 'package:app/automatic_control/sunlight.dart';
import 'package:flutter/material.dart';

class NavBarAC extends StatefulWidget {
  final int givenIndex;
  const NavBarAC({Key? key, required this.givenIndex}) : super(key: key);

  @override
  State<NavBarAC> createState() => _NavBarACState();
}

class _NavBarACState extends State<NavBarAC> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    SunlightAC(),
    PhValuesAC(),
    RainAC(),
    FertilizersAC()


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
            icon: Icon(Icons.wb_sunny),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.watch_rounded),
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
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black38,
        onTap: _onItemTapped,
      ),
    );
  }
}
