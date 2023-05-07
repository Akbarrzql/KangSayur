import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Home_search extends StatefulWidget {
  const Home_search({Key? key}) : super(key: key);

  @override
  State<Home_search> createState() => _Home_searchState();
}

class _Home_searchState extends State<Home_search> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.45)),
          borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: TextField(
          textAlign: TextAlign.left,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(bottom: 8.0,),
              border: InputBorder.none,
              hintText: "Cari kebutuhan anda",
              hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.w400),
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SvgPicture.asset("assets/icon/search.svg", height: 24, width: 24,),
              )),
        ),
      ),
    );
  }
}
