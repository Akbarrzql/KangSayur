import 'package:flutter/material.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/inbox/navigate/ulasan_anda/mengulas/mengulas.dart';

import '../common/color_value.dart';

//make stateless widget for card menunggu_diulas
class CardMenunggu extends StatelessWidget {
  const CardMenunggu({
    Key? key,
    //required gambar, title, and toko
    required this.gambar,
    required this.title,
    required this.toko,
    required this.onTap,
  }) : super(key: key);

  //declare variable
  final String gambar;
  final String title;
  final String toko;

  //void callback
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      height: 123,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: ColorValue.blackColor.withOpacity(0.25),
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 15),
            height: 75,
            width: 75,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Image.network(
              'https://kangsayur.nitipaja.online' + this.gambar,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            height: 75,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this.title,
                  style: TextStyle(
                      color: ColorValue.blackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  this.toko,
                  style: TextStyle(
                      color: ColorValue.blackColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 5,
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    this.onTap();
                  },
                  child: Container(
                    height: 30,
                    width: 102,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: ColorValue.primaryColor,
                    ),
                    child: Center(
                      child: Text(
                        "Beri Ulasan",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
