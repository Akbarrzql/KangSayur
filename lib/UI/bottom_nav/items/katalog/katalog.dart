import 'package:flutter/material.dart';
import 'package:kangsayur/UI/bottom_nav/items/katalog/katalog_box_list.dart';
import 'package:kangsayur/UI/bottom_nav/items/katalog/katalog_carousel.dart';
import 'package:kangsayur/UI/bottom_nav/items/katalog/katalog_head.dart';
import 'package:kangsayur/UI/bottom_nav/items/katalog/katalog_search.dart';

class Katalog extends StatefulWidget {
  const Katalog({Key? key}) : super(key: key);

  @override
  State<Katalog> createState() => _KatalogState();
}

class _KatalogState extends State<Katalog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Katalog_head(),
              SizedBox(
                height: 25,
              ),
              Katalog_search(),
              SizedBox(
                height: 35,
              ),
              Katalog_carousel(),
              SizedBox(
                height: 35,
              ),
              SizedBox(
                child: Katalog_box_list(),
                width: double.maxFinite,
                height: 400,
              ),
            ],
          ),
        ));
  }
}
