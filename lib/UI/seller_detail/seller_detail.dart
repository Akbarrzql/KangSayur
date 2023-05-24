import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kangsayur/UI/seller_detail/seller_head.dart';
import 'package:kangsayur/UI/seller_detail/tabbar/seller_tabbar.dart';
import 'package:kangsayur/UI/seller_detail/seller_twobox.dart';

class Seller_profile extends StatefulWidget {
  const Seller_profile({Key? key}) : super(key: key);

  @override
  State<Seller_profile> createState() => _Seller_profileState();
}

class _Seller_profileState extends State<Seller_profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child:SingleChildScrollView(
            child: Column(
              children: [
                Seller_head(),
                SizedBox(height: 25,),
                Seller_twobox(),
                SizedBox(height: 20,),
                Seller_tabbar(),
              ],
            ),
          )
    ));
  }
}
