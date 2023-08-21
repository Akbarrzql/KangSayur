import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kangsayur/UI/bottom_nav/items/home/home.dart';
import 'package:kangsayur/UI/bottom_nav/items/katalog/katalog.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/profile.dart';
import 'package:kangsayur/UI/bottom_nav/items/transaction/transaction.dart';

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
        return const Transaction();
      default:
        return const Profile();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _body(),
        bottomNavigationBar: Container(
          color: Colors.white,
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
            items: const [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                    child: Icon(Icons.home)
                ),
                label: 'Beranda',
                activeIcon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                    child: Icon(Icons.home)
                ),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                    child: Icon(Icons.list)
                ),
                label: 'Jelajah',
                activeIcon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                    child: Icon(Icons.list)
                ),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                    child: Icon(Icons.monetization_on)
                ),
                label: 'Transaksi',
                activeIcon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                    child: Icon(Icons.monetization_on)
                ),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                    child: Icon(Icons.person)
                ),
                label: 'Profil',
                activeIcon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Icon(Icons.person)
                  ),
                ),
            ],
          ),
        ));
  }
}
