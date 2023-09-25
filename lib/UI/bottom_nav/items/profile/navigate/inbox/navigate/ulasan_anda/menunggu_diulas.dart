import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/inbox/navigate/ulasan_anda/mengulas/mengulas.dart';
import 'package:kangsayur/model/menunggudiulasmodel.dart';
import 'package:kangsayur/widget/card_menunggu.dart';

import '../../../../../../../../common/color_value.dart';

class Menunggu_diulas extends StatefulWidget {
  Menunggu_diulas({Key? key, required this.menungguDiulasModel})
      : super(key: key);
  MenungguDiulasModel menungguDiulasModel;

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
            padding: EdgeInsets.only(top: 20),
            itemCount: widget.menungguDiulasModel.data.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: CardMenunggu(
                  gambar: widget.menungguDiulasModel.data[index].gambarProduk,
                  title: widget.menungguDiulasModel.data[index].namaProduk,
                  toko: widget.menungguDiulasModel.data[index].namaToko,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Mengulas(
                            namaToko: widget.menungguDiulasModel.data[index].namaToko,
                            gambarToko: widget.menungguDiulasModel.data[index].gambarToko,
                            alamatToko: widget.menungguDiulasModel.data[index].alamat,
                            namaProduk: widget.menungguDiulasModel.data[index].namaProduk,
                            gambarProduk: widget.menungguDiulasModel.data[index].gambarProduk,
                            productId: widget.menungguDiulasModel.data[index].produkId.toString(),
                            tokoId: widget.menungguDiulasModel.data[index].tokoId.toString(),
                            variantId: widget.menungguDiulasModel.data[index].variantId.toString(),
                            transactionCode: widget.menungguDiulasModel.data[index].transactionCode.toString(),
                      ),
    ));
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
