import 'package:flutter/material.dart';

import '../../../../../../widget/card_pk.dart';

class Pk_daging extends StatefulWidget {
  const Pk_daging({Key? key}) : super(key: key);

  @override
  State<Pk_daging> createState() => _Pk_dagingState();
}

class _Pk_dagingState extends State<Pk_daging> {
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
