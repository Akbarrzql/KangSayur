import 'package:flutter/material.dart';
import 'package:kangsayur/UI/bottom_nav/items/katalog/dikunjungi_list.dart';

import '../home/promo_list.dart';

class Katalog_dikunjungi extends StatefulWidget {
  const Katalog_dikunjungi({Key? key}) : super(key: key);

  @override
  State<Katalog_dikunjungi> createState() => _Katalog_dikunjungiState();
}

class _Katalog_dikunjungiState extends State<Katalog_dikunjungi> {
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
                  Text(
                    "Paling Banyak dikunjungi",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  Spacer(),
                  Text(
                    "Lihat semua",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF5F5F5F)),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: SizedBox(
              height: 163, width: double.maxFinite, child: Dikunjungi_list()),
        ),
      ],
    );
  }
}
