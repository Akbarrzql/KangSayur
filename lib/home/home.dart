import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kangsayur/home/home_head.dart';
import 'package:kangsayur/home/home_search.dart';
import 'package:kangsayur/home/home_two.dart';
import 'package:kangsayur/home/promo_list.dart';

import 'home_carousel.dart';

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
                  children: [
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
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Home_carousel(),
              ),
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
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Promo kilat",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Spacer(),
                            Text(
                              "Lihat semua",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xffA0A0A0)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Berakhir dalam",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xffA0A0A0)),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 10,
                              height: 15,
                              decoration: BoxDecoration(
                                color: Color(0xffD9D9D9),
                              ),
                              child: Center(
                                  child: Text(
                                "0",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              )),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Container(
                              width: 10,
                              height: 15,
                              decoration: BoxDecoration(
                                color: Color(0xffD9D9D9),
                              ),
                              child: Center(
                                  child: Text(
                                "0",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              )),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Container(
                              width: 10,
                              height: 15,
                              decoration: BoxDecoration(
                                color: Color(0xffD9D9D9),
                              ),
                              child: Center(
                                  child: Text(
                                "0",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              )),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Container(
                              width: 10,
                              height: 15,
                              decoration: BoxDecoration(
                                color: Color(0xffD9D9D9),
                              ),
                              child: Center(
                                  child: Text(
                                "0",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              )),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: SizedBox(height: 248, child: Promo_List()),
                  ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              // Biji kakao andalan
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      children: [
                        Text(
                          "Biji kakao lokan andalan",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Spacer(),
                        Text(
                          "Lihat toko",
                          style:
                              TextStyle(fontSize: 14, color: Color(0xffA0A0A0)),
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
                          children: [
                            Text(
                              "Produk Pilihan",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Spacer(),
                            Text(
                              "Lihat semua",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xffA0A0A0)),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: SizedBox(height: 248, child: Promo_List()),
                  ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              // Paling Sering Dicari
Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Paling Sering Dicari",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Spacer(),
                            Text(
                              "Lihat semua",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xffA0A0A0)),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: SizedBox(height: 248, child: Promo_List()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
