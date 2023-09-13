import 'package:flutter/material.dart';
import 'package:sohoj_trip_app/core/constants/color_palatte.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;
  int _pageIndex = 0;
  late PageController _pageController;
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Surface,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: <Widget>[
          // BookScreen(), TripScreen()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Primary,
        unselectedItemColor: textColor,
        backgroundColor: Surface,
        currentIndex: _currentIndex, //New
        onTap: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.airplanemode_active_rounded),
            label: 'book',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplane_ticket),
            label: 'trip',
          ),
        ],
      ),
    );
  }
}
