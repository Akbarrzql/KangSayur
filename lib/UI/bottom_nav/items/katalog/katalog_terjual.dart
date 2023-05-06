import 'package:flutter/material.dart';

import '../home/promo_list.dart';

class Katalog_terjual extends StatefulWidget {
  const Katalog_terjual({Key? key}) : super(key: key);

  @override
  State<Katalog_terjual> createState() => _Katalog_terjualState();
}

class _Katalog_terjualState extends State<Katalog_terjual> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Row(
                children: [
                  Text("Paling banyak terjual", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                  Spacer(),
                  Text("Lihat semua", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFF5F5F5F)),),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0, ),
          child: SizedBox(height: 248, width: double.maxFinite,child: Promo_List()),
        ),

      ],
    );
  }
}
