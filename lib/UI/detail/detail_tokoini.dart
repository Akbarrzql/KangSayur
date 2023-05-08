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
      children: [
        Text("Di toko ini"),
        SizedBox(
          height: 5,
        ),
        SizedBox(
            width: double.infinity,
            child: Promo_List())
      ],
    );
  }
}
