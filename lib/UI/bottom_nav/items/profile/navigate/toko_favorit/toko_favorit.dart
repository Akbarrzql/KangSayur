import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../common/color_value.dart';

class Toko_favorit extends StatefulWidget {
  const Toko_favorit({Key? key}) : super(key: key);

  @override
  State<Toko_favorit> createState() => _Toko_favoritState();
}

class _Toko_favoritState extends State<Toko_favorit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Toko Favorit",
          style: TextStyle(color: ColorValue.neutralColor, fontSize: 16),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset("assets/icon/arrow_left.svg"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 12,),
            ListView.builder(
              itemCount: 5,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
              return Column(
                children: [
                  _tokolist(Gambar: "assets/images/profile.png", Toko: "Wabi Sabi", Asal: "Jakarta Barat, Jakarta"),
                  SizedBox(height: 19,)
                ],
              );
            },)
          ],
        ),
      ),
    );
  }
}

Widget _tokolist({
  //required gambar
  required String Gambar,
  required String Toko,
  required String Asal,

}) {
  return Container(
    child: Row(
      children: [
        Container(
          width: 63,
          height: 63,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
          ),
          child: Image.asset(Gambar, fit: BoxFit.fill,),
        ),
        SizedBox(width: 20,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(Toko, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
            Text(Asal, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: ColorValue.hinttext),),
          ],
        )
      ],
    ),
  );
}
