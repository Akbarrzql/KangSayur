import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kangsayur/widget/list_detailulasan.dart';

import '../../../../../../../../../common/color_value.dart';

class Detail_ulasan extends StatefulWidget {
  const Detail_ulasan({Key? key}) : super(key: key);

  @override
  State<Detail_ulasan> createState() => _Detail_ulasanState();
}

class _Detail_ulasanState extends State<Detail_ulasan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Detail Ulasan",
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
          List_detailulasan_user(
            gambar: "assets/images/wortel.png",
            produk: "Wortel",
            pcs: "1 pcs",
            rating: 4,
            tanggal: "12/12/2021",
            ulasan: "Sayurannya segar dan enak",
          ),
          SizedBox(
            height: 22,
          ),
          //call list_detailulaasan_penjual
          List_detailulasan_penjual(
              profil: "assets/images/profile.png",
              nama: "Petani Medan",
              tanggal: "12/12/2021",
              ulasan: "Terima kasih sudah berbelanja di toko kami"),
        ],
      ),
    );
  }
}
