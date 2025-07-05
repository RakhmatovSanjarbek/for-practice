import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lady/features/booking/presentation/pages/booking_pages.dart';
import 'package:lady/features/home/presentation/pages/home_page.dart';
import 'package:lady/features/profile/presentation/pages/profile_page.dart';
import 'package:lady/features/studio/presentation/pages/studio_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomePage(),
    MyBookingPage(),
    StudioPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return false;
        },
        child: Scaffold(
          body: _screens[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (int index) => setState(() => _currentIndex = index),
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            items: const[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: 'Bosh safiha'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month_sharp), label: 'Bronlar'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.store), label: 'Studiolar'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile')
            ],
          ),
        ));
  }
}
