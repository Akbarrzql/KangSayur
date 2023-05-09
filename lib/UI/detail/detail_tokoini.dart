import 'package:flutter/material.dart';
import 'package:kangsayur/UI/bottom_nav/items/home/promo_list.dart';

class Detail_tokoini extends StatefulWidget {
  const Detail_tokoini({Key? key}) : super(key: key);

  @override
  State<Detail_tokoini> createState() => _Detail_tokoiniState();
}

class _Detail_tokoiniState extends State<Detail_tokoini> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text("Di toko ini", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),),
        SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 248,
            width: double.infinity,
            child: Promo_List())
      ],
    );
  }
}
