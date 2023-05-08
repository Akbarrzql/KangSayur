import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kangsayur/UI/bottom_nav/items/home/home.dart';
import 'package:kangsayur/UI/bottom_nav/items/katalog/katalog.dart';

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
        return const Katalog();
      case 2:
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
          padding: const EdgeInsets.symmetric(horizontal: 24),
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
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: SvgPicture.asset(
                    "assets/icon/navbar/home.svg",
                    width: 24,
                    color: Colors.black,
                  ),
                ),
                label: 'Home',
                activeIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: SvgPicture.asset(
                    "assets/icon/navbar/home.svg",
                    width: 24,
                    color: Colors.black,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: SvgPicture.asset(
                    "assets/icon/navbar/home.svg",
                    width: 24,
                    color: Colors.black,
                  ),
                ),
                label: 'Catalog',
                activeIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: SvgPicture.asset(
                    "assets/icon/navbar/home.svg",
                    width: 24,
                    color: Colors.black,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: SvgPicture.asset(
                    "assets/icon/navbar/home.svg",
                    width: 24,
                    color: Colors.black,
                  ),
                ),
                label: 'Transaction',
                activeIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: SvgPicture.asset(
                    "assets/icon/navbar/home.svg",
                    width: 24,
                    color: Colors.black,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: SvgPicture.asset(
                    "assets/icon/navbar/home.svg",
                    width: 24,
                    color: Colors.black,
                  ),
                ),
                label: 'Profile',
                activeIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: SvgPicture.asset(
                    "assets/icon/navbar/home.svg",
                    width: 24,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
