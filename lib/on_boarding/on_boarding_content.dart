import 'package:flutter/material.dart';

class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents(
      {required this.title, required this.image, required this.desc});
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Kualitas Terbaik Dari Petani",
    image: "assets/images/boarding_one.png",
    desc:
        "Kami menghadirkan produk-produk segar dan berkualitas tinggi dari petani & peternak terbaik di Indonesia.",
  ),
  OnboardingContents(
    title: "Kirim Sesuai Jadwal",
    image: "assets/images/boarding_two.png",
    desc:
        "Dengan fitur langganan kamu dapat mudah untuk memenentukan jadwal pengiriman sesui hari yang kamu tentukan.",
  ),
  OnboardingContents(
    title: "Petani Sejahtara & Senang",
    image: "assets/images/boarding_three.png",
    desc: "Setiap penjualan para petani akan sangat terbantu.",
  ),
];
