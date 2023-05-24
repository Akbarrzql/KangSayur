import 'package:flutter/material.dart';
import 'package:kangsayur/widget/card_katalog.dart';

class Seller_katalog extends StatefulWidget {
  const Seller_katalog({Key? key}) : super(key: key);

  @override
  State<Seller_katalog> createState() => _Seller_katalogState();
}

class _Seller_katalogState extends State<Seller_katalog> {
  @override
  Widget build(BuildContext context) {
return Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: GridView.builder(
              itemCount: 6,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 15,
                  childAspectRatio: 3 / 1.5
              ), itemBuilder: (context, index) {
                return Card_katalog(image: "assets/icon/pokok.svg", title: "Sayuran", color: 0xffAF7146,);
            },),
          )
        ],

    );
  }
}
