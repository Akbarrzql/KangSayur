import 'package:flutter/material.dart';

import '../../../../../../widget/card_pk.dart';

class Pk_telur extends StatefulWidget {
  const Pk_telur({Key? key}) : super(key: key);

  @override
  State<Pk_telur> createState() => _Pk_telurState();
}

class _Pk_telurState extends State<Pk_telur> {
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
          )
        ],
      ),
    );
  }
}
