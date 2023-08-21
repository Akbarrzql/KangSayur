import 'package:flutter/material.dart';
import 'package:kangsayur/model/tokodetailmodel.dart';
import 'package:kangsayur/widget/card_product.dart';

import '../../../detail/detail.dart';

class Seller_produk extends StatefulWidget {
  Seller_produk({Key? key, required this.tokoDetailModel}) : super(key: key);
  TokoDetailModel tokoDetailModel;

  @override
  State<Seller_produk> createState() => _Seller_produkState();
}

class _Seller_produkState extends State<Seller_produk> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 24),
      child: Column(
        children: [
          GridView.builder(
            padding: EdgeInsets.symmetric(vertical: 1),
            shrinkWrap: true,
            physics:  NeverScrollableScrollPhysics(),
            itemCount: widget.tokoDetailModel.data.produk.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.6,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              return  GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return Detail(
                          id: widget.tokoDetailModel.data.produk[index].id,
                        );
                      }));
                },
                child: CardProduk(
                  hargaProduk: widget.tokoDetailModel.data.produk[index].hargaVariant.toString(),
                  imageProduk: widget.tokoDetailModel.data.produk[index].variantImg.toString(),
                  jarakProduk: widget.tokoDetailModel.data.produk[index].distance.toString(),
                  namaProduk:  widget.tokoDetailModel.data.produk[index].namaProduk,
                  penjualProduk: '',
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
