import 'package:flutter/material.dart';
import 'package:kangsayur/UI/bottom_nav/items/home/home.dart';

class Bottom_Nav extends StatefulWidget {
  const Bottom_Nav({Key? key}) : super(key: key);

  @override
  State<Bottom_Nav> createState() => _Bottom_NavState();
}

class _Bottom_NavState extends State<Bottom_Nav> {
  int currentIndex = 0;

  void navigateTo(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget _body() {
    switch (currentIndex) {
      case 0:
        return const Home();
      case 1:
        return const Home();
      case 2:
        return const Home();
      case 3:
        return const Home();
      default:
        return const Home();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _body(),
        bottomNavigationBar: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            elevation: 0,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            iconSize: 24,
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Image.asset('assets/bottom_navbar_icon/home_icon.png'),
                ),
                label: '',
                activeIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Image.asset('assets/bottom_navbar_icon/home_icon_filled.png'),
                ),),
              BottomNavigationBarItem(
                label: '',
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Image.asset('assets/bottom_navbar_icon/menu_icon.png'),
                ),
                activeIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Image.asset('assets/bottom_navbar_icon/menu_icon_filled.png'),
                ),),
              BottomNavigationBarItem(
                label: '',
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Image.asset('assets/bottom_navbar_icon/statistic_icon.png'),
                ),
                activeIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Image.asset('assets/bottom_navbar_icon/statistic_icon_filled.png'),
                ),),
              BottomNavigationBarItem(
                label: '',
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Image.asset('assets/bottom_navbar_icon/counselor_icon.png'),
                ),
                activeIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Image.asset('assets/bottom_navbar_icon/counselor_icon_filled.png'),
                ),),
              BottomNavigationBarItem(
                label: '',
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Image.asset('assets/bottom_navbar_icon/profile_icon.png'),
                ),
                activeIcon:  Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Image.asset('assets/bottom_navbar_icon/profile_icon.png'),
                ),),
            ],
          ),
        )
    );
  }
}
