import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class Beli_Sekarang extends StatefulWidget {
  Beli_Sekarang({Key? key,
    required this.nama_produk,
    required this.nama_variant,
    required this.gambar_produk,
    required this.harga_variant,
    required this.nama_toko,
    required this.gambar_toko,
  }) : super(key: key);
  String nama_produk;
  String nama_variant;
  String gambar_produk;
  int harga_variant;
  String nama_toko;
  String gambar_toko;



  @override
  State<Beli_Sekarang> createState() => _Beli_SekarangState();
}

class _Beli_SekarangState extends State<Beli_Sekarang> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Checkout",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          leading: IconButton(
            icon: SvgPicture.asset("assets/icon/arrow_left.svg"),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
          ),
          Bar(),
        ],
      ),

    );
  }

  Widget Bar({required }) {

    return Positioned(
    bottom: 0,
      child: Container(
        height: MediaQuery
            .of(context)
            .size
            .height * 0.10,
        width: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  NumberFormat.currency(
                    locale: 'id',
                    symbol: 'Rp',
                    decimalDigits: 0,
                  ).format(widget.harga_variant)  ,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: () async {
                // var data = await Cart()
                //     .Order(dataArray, widget.rincian.totalKeseluruhan.toInt());
                // print('object');
                // print(data.data.snapToken);
                // await Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) =>
                //             Snap_screen(
                //               snap_token: data.data.snapToken,
                //             )));
              },
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.3,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xff009245),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                    child: Text(
                      "Bayar",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

}
