import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Katalog_head extends StatefulWidget {
  const Katalog_head({Key? key}) : super(key: key);

  @override
  State<Katalog_head> createState() => _Katalog_headState();
}

class _Katalog_headState extends State<Katalog_head> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Row(
        children: [
          SvgPicture.asset("assets/icon/map.svg", width: 18, height: 18,),
          SizedBox(width: 15,),
          Text("Cipinang", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
          SizedBox(width: 14),
          SvgPicture.asset("assets/icon/arrow_down.svg"),

        ],
      ),
    );
  }
}
