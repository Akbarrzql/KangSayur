import 'package:flutter/material.dart';
import 'package:kangsayur/widget/card_pk.dart';

class Pk_bahan_pokok extends StatefulWidget {
  const Pk_bahan_pokok({Key? key}) : super(key: key);

  @override
  State<Pk_bahan_pokok> createState() => _Pk_bahan_pokokState();
}

class _Pk_bahan_pokokState extends State<Pk_bahan_pokok> {
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
