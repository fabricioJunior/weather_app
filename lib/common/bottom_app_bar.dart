import 'package:flutter/material.dart';

BottomNavigationBar bottomAppBar = BottomNavigationBar(
  items: const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
  ],
  backgroundColor: Colors.transparent,
  elevation: 0,
);

class WeatherAppBottomNavigatorBar extends StatelessWidget {
  const WeatherAppBottomNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            color: Colors.white,
          ),
          Icon(
            Icons.notifications,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
