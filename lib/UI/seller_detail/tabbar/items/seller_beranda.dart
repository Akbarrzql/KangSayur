import 'package:flutter/material.dart';
import 'package:kangsayur/UI/bottom_nav/items/home/promo_list.dart';

class Seller_beranda extends StatefulWidget {
  const Seller_beranda({Key? key}) : super(key: key);

  @override
  State<Seller_beranda> createState() => _Seller_berandaState();
}

class _Seller_berandaState extends State<Seller_beranda> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 25,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Lagi Promo",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            )),
        SizedBox(
          height: 15,
        ),
        Container(height: 248, child: Promo_List()),
      ],
    );
  }
}
