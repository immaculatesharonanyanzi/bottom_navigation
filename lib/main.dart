import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'settings_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MainScreen());
  }
}

class MainScreen extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainScreen> {
  int _selectedItem = 0;
  final List<Widget> _pages = [HomeScreen(), SettingsScreen()];

  void onTappedItem(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages[_selectedItem],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedItem,
          onTap: onTappedItem,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}
