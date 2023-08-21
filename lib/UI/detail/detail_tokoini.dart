import 'package:flutter/material.dart';
import 'package:kangsayur/UI/bottom_nav/items/home/promo_list.dart';
import 'package:kangsayur/UI/detail/detail.dart';
import 'package:kangsayur/widget/card_product.dart';

import '../../model/detailproductmodel.dart';

class Detail_tokoini extends StatefulWidget {
  Detail_tokoini({Key? key, required this.widget}) : super(key: key);
  DetailProductModel widget;

  @override
  State<Detail_tokoini> createState() => _Detail_tokoiniState();
}

class _Detail_tokoiniState extends State<Detail_tokoini> {
  @override
  Widget build(BuildContext context) {
    if (widget.widget.data.tokoIni.length == 0) {
      return Container();
    } else
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            "Di toko ini",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
            height: 248,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 24, bottom: 5, top: 5),
              itemCount: widget.widget.data.tokoIni.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 24),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Detail(
                          id: widget.widget.data.tokoIni[index].productId,
                        );
                      }));
                    },
                    child: CardProduk(
                      imageProduk: widget.widget.data.tokoIni[index].variantImg,
                      jarakProduk:
                          widget.widget.data.tokoIni[index].distance.toString(),
                      namaProduk: widget.widget.data.tokoIni[index].namaProduk,
                      penjualProduk: widget.widget.data.tokoIni[index].namaToko,
                      hargaProduk: widget
                          .widget.data.tokoIni[index].hargaVariant
                          .toString(),
                    ),
                  ),
                );
              },
            ))
      ],
    );
  }
}
