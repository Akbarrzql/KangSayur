import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Katalog_carousel extends StatefulWidget {
  const Katalog_carousel({Key? key}) : super(key: key);

  @override
  State<Katalog_carousel> createState() => _Katalog_carouselState();
}

class _Katalog_carouselState extends State<Katalog_carousel> {
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.only(left: 24),
      child: CarouselSlider(
          items: [
            Image.asset("assets/images/carousel_catalog.png"),
            Image.asset("assets/images/carousel_catalog.png"),
          ],
          options: CarouselOptions(
            viewportFraction: 0.8,
            padEnds: false,
            enableInfiniteScroll: false,
            height: 94,
          )),
    );
  }
}
