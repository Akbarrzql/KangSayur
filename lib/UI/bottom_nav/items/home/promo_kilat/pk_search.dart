import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Pk_search extends StatefulWidget {
  const Pk_search({Key? key}) : super(key: key);

  @override
  State<Pk_search> createState() => _Pk_searchState();
}

class _Pk_searchState extends State<Pk_search> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.45)),
            borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: TextField(
            textAlign: TextAlign.left,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  bottom: 8.0,
                ),
                border: InputBorder.none,
                hintText: "Cari kebutuhan anda",
                hintStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.black.withOpacity(0.5),
                    fontWeight: FontWeight.w400),
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SvgPicture.asset(
                    "assets/icon/search.svg",
                    height: 24,
                    width: 24,
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
