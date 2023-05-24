import 'package:flutter/material.dart';
import 'package:kangsayur/widget/card_product.dart';

class Seller_produk extends StatefulWidget {
  const Seller_produk({Key? key}) : super(key: key);

  @override
  State<Seller_produk> createState() => _Seller_produkState();
}

class _Seller_produkState extends State<Seller_produk> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.6,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              return const CardProduk(
                hargaProduk: 'Rp 12.000',
                imageProduk: 'assets/images/wortel.png',
                jarakProduk: '1.2 km',
                namaProduk: 'Wortel Lokal 1/Kg',
                penjualProduk: 'Toko Bu Endah',
              );
            },
          ),
        ],
      ),
    );
  }
}
