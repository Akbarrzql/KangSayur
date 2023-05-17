import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kangsayur/UI/seller_detail/seller_head.dart';
import 'package:kangsayur/UI/seller_detail/seller_twobox.dart';

class Seller_Detail extends StatefulWidget {
  const Seller_Detail({Key? key}) : super(key: key);

  @override
  State<Seller_Detail> createState() => _Seller_DetailState();
}

class _Seller_DetailState extends State<Seller_Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child:Column(
            children: [
              Seller_head(),
              SizedBox(height: 25,),

              Seller_twobox()
            ],
          )
    ));
  }
}
