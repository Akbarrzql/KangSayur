import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kangsayur/UI/bottom_nav/items/home/promo_kilat/pk_content.dart';
import 'package:kangsayur/UI/bottom_nav/items/home/promo_kilat/pk_search.dart';

class Promo_kilat extends StatefulWidget {
  const Promo_kilat({Key? key}) : super(key: key);

  @override
  State<Promo_kilat> createState() => _Promo_kilatState();
}

class _Promo_kilatState extends State<Promo_kilat> {
  // tabcontroller
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Promo Kilat", style: TextStyle(color: Colors.black, fontSize: 16),),
        leading: IconButton(
          icon: SvgPicture.asset("assets/icon/arrow_left.svg"),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 25,),
            Pk_search(),
            SizedBox(height: 20,),
             Pk_content()
          ],
        ),
      )
    );
  }
}
