import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kangsayur/UI/bottom_nav/items/home/home_most_popular.dart';
import 'package:kangsayur/UI/bottom_nav/items/home/home_most_visit.dart';
import 'package:kangsayur/UI/bottom_nav/items/home/paling_banyak_dikunjungi/palingbanyakdikunjungi.dart';
import 'package:kangsayur/UI/bottom_nav/items/home/promo_list.dart';

import 'home_carousel.dart';
import 'home_head.dart';
import 'home_search.dart';
import 'home_two.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25,
                ),
                // Header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: const [
                      Home_head(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                // Search Box
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Home_search(),
                ),
                SizedBox(
                  height: 20,
                ),
                // Carousel
                Home_carousel(),
                SizedBox(
                  height: 35,
                ),
                // Promo & Cari Petani
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Home_two(),
                ),
                SizedBox(
                  height: 35,
                ),
                // Promo Kilat
                Promo_List(),
                SizedBox(
                  height: 35,
                ),
                // Biji kakao andalan
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        children: const [
                          Text(
                            "Biji kakao lokan andalan",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Spacer(),
                          Text(
                            "Lihat toko",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffA0A0A0)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      "assets/images/kakao.png",
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                // Produk Pilihan
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        children: [
                          Row(
                            children:  [
                              Text(
                                "Paling banyak dikunjungi",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PalingBanyakDikunjungi(),)),
                                child: Text(
                                  "Lihat semua",
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xffA0A0A0)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: double.infinity,
                        height: 248,
                        child: Home_most_visited())
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Home_most_visit()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
