import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kangsayur/widget/card_mengulas.dart';

import '../../../../../../../../../common/color_value.dart';

class Mengulas extends StatefulWidget {
  const Mengulas({Key? key}) : super(key: key);

  @override
  State<Mengulas> createState() => _MengulasState();
}

class _MengulasState extends State<Mengulas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Mengulas",
          style: TextStyle(color: ColorValue.neutralColor, fontSize: 16),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset("assets/icon/arrow_left.svg"),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Head_mengulas(
            profil_seller: "assets/images/profile_seller.png",
            nama_seller: "Petani Medan",
            alamat_seller: "Via Emo Tarabochia, 1, 34125 Trieste TS, Italy",
          ),
          SizedBox(
            height: 20,
          ),
          Card_mengulas(
              gambar_produk: "assets/images/wortel.png",
              nama_produk: "Wortel lokal /1kg",
              nama_seller: "Petani Medan"),
          Spacer(),
          //make button "Kirim Ulasan" height 50
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Container(
              margin: EdgeInsets.only(bottom: 35),
              decoration: BoxDecoration(
                  color: ColorValue.primaryColor,
                  borderRadius: BorderRadius.circular(5)),
              height: 50,
              child: Center(
                child: Text(
                  "Kirim Ulasan",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

