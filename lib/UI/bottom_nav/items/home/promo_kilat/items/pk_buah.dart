import 'package:flutter/material.dart';

import '../../../../../../widget/card_pk.dart';

class Pk_buah extends StatefulWidget {
  const Pk_buah({Key? key}) : super(key: key);

  @override
  State<Pk_buah> createState() => _Pk_buahState();
}

class _Pk_buahState extends State<Pk_buah> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: 35,),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Card_pk(
                  gambar_produk: "assets/images/wortel.png",
                  nama_produk: "Wortel",
                  harga_produk: 12000,
                  nama_toko: "Kebun Endah",
                  isDiscount: true,
                  discount: 10,
                  harga_diskon: 10000,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
