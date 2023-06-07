import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kangsayur/widget/card_pembayaran.dart';

import '../detail_pembayaran/detail_pembayaran.dart';

class Pembayaran extends StatefulWidget {
  const Pembayaran({Key? key}) : super(key: key);

  @override
  State<Pembayaran> createState() => _PembayaranState();
}

class _PembayaranState extends State<Pembayaran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Pembayaran",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          leading: IconButton(
            icon: SvgPicture.asset("assets/icon/arrow_left.svg"),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Card_pembayaran(
                  gambar_pembayaran: "assets/images/bca.png",
                  nama_pembayaran: "Pembayaran wortel pak mamat",
                  metode_pembayaran: "Transfer Rekening Bca",
                  nomor_virtual_account: 123125121121513,
                  total_pembayaran: 50000,
                  onTap: () {
                    //make navigator push to detail_pembayaran
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Detail_pembayaran(
                                  nomor_virtual_account: 123125121121513,
                                  total_pembayaran: 50000,
                                )));
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
