import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kangsayur/UI/bottom_nav/items/home/toko_sekitar/toko_sekitar.dart';

class Home_two extends StatefulWidget {
  const Home_two({Key? key}) : super(key: key);

  @override
  State<Home_two> createState() => _Home_twoState();
}

class _Home_twoState extends State<Home_two> {
  @override
  Widget build(BuildContext context) {
    return               Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Toko_sekitar(),));
          },
          child: Container(
            height: 40,
            width: MediaQuery.of(context).size.width - 48,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.2),
                borderRadius: BorderRadius.circular(5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Toko Sekitar",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 12),
                ),
                SizedBox(
                  width: 5,
                ),
                SvgPicture.asset("assets/icon/map.svg")
              ],
            ),
          ),
        ),
      ],
    )
      ],
    );
  }
}
