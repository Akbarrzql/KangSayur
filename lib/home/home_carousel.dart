import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Home_carousel extends StatefulWidget {
  const Home_carousel({Key? key}) : super(key: key);

  @override
  State<Home_carousel> createState() => _Home_carouselState();
}

class _Home_carouselState extends State<Home_carousel> {
  @override
  Widget build(BuildContext context) {
    return   CarouselSlider(
        items: [
          Image.asset("assets/images/carousel.png"),
          Image.asset("assets/images/carousel.png"),
        ],
        options: CarouselOptions(
          viewportFraction: 0.87,
          padEnds: false,
          enableInfiniteScroll: false,
          height: 135,
        ));
  }
}
