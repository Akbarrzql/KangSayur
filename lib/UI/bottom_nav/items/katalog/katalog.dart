import 'package:flutter/material.dart';
import 'package:kangsayur/UI/bottom_nav/items/katalog/katalog_box_list.dart';
import 'package:kangsayur/UI/bottom_nav/items/katalog/katalog_carousel.dart';
import 'package:kangsayur/UI/bottom_nav/items/katalog/katalog_dikunjungi.dart';
import 'package:kangsayur/UI/bottom_nav/items/katalog/katalog_head.dart';
import 'package:kangsayur/UI/bottom_nav/items/katalog/katalog_search.dart';
import 'package:kangsayur/UI/bottom_nav/items/katalog/katalog_terjual.dart';

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
          child: SingleChildScrollView(
            child: Column(
              children: const [
                SizedBox(
                  height: 25,
                ),
                // Katalog_head(),
                // SizedBox(
                //   height: 25,
                // ),
                // Katalog_search(),
                Katalog_carousel(),
                SizedBox(
                  width: double.maxFinite,
                  child: Katalog_box_list(),
                ),
                SizedBox(
                  height: 35,),
                Katalog_terjual(),
                SizedBox(
                  height: 35,
                ),
                Katalog_dikunjungi()
              ],
            ),
          ),
        ));
  }
}
