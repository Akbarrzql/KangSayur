import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kangsayur/widget/card_menunggu.dart';

import '../../../../../../../../common/color_value.dart';

class Menunggu_diulas extends StatefulWidget {
  const Menunggu_diulas({Key? key}) : super(key: key);

  @override
  State<Menunggu_diulas> createState() => _Menunggu_diulasState();
}

class _Menunggu_diulasState extends State<Menunggu_diulas> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 19),
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: CardMenunggu(
                    gambar: "assets/images/wortel.png",
                    title: "Wortel",
                    toko: "Petani Medan",
                  ),
                );
              },
            ),
          ),

        ],
      );
  }
}

