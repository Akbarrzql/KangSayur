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
    List<String> carouselItems = [
      for (var i = 0; i < 3; i++) "assets/images/carousel.png"
    ];
    int _currentIndex = 0;

    return CarouselSlider(
      items: carouselItems.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: Image.asset(
                item,
                fit: BoxFit.fill,
              ),
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        height: 150.0,
        viewportFraction: 0.9,
        initialPage: _currentIndex,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        onPageChanged: (index, reason) {
          setState(() {
            print(index);
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
