import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../common/color_value.dart';

class Checkout_items extends StatelessWidget {
  Checkout_items({
    Key? key,
    required this.profil_seller,
    required this.nama_seller,
    required this.nama_produk,
    required this.gambar_produk,
    required this.harga,
    required this.jumlah,
    this.isVariant = false,
    required this.variant,
    required this.itemCount_produk,
  }) : super(key: key);
  final List<String> nama_produk, gambar_produk, variant, jumlah;
  final String profil_seller, nama_seller;
  final int itemCount_produk;
  late bool isVariant;
  late List<int> harga;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 24, right: 24, top: 18),
        color: Colors.white,
        child: Column(children: [
          Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: ColorValue.hinttext,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Image.network(
                        'https://kangsayur.nitipaja.online/' + profil_seller),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  //text name seller
                  for (var i = 0; i < nama_seller.length; i++)
                    Text(
                      nama_seller[i],
                      style: TextStyle(
                          color: ColorValue.neutralColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                ],
              ),
              SizedBox(height: 10),
              Divider(
                height: 0.5,
                color: ColorValue.hinttext,
              ),
              SizedBox(height: 10),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: itemCount_produk,
                itemBuilder: (context, index) {
                  return Row(children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 12),
                      clipBehavior: Clip.antiAlias,
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              spreadRadius: 0,
                              blurRadius: 4,
                              offset:
                                  Offset(0, 4), // changes position of shadow
                            ),
                          ],
                          image: DecorationImage(
                              image: AssetImage(gambar_produk[index]),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      height: 80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            nama_produk[index],
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          //make this widget isVariant
                          isVariant
                              ? Text(
                                  "Varian : " + variant[index],
                                  style: TextStyle(
                                      color: ColorValue.hinttext,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                )
                              : SizedBox(),
                          Spacer(),
                          Text(
                            "Rp. " + ProdukformatNumber(harga[index]) + ",00",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff0E4F55)),
                          ),
                          SizedBox(
                            height: 18,
                          ),
                        ],
                      ),
                    ),
                  ]);
                },
              ),
            ],
          ),
        ]));
  }

  String ProdukformatNumber(harga_produk) {
    final numberFormat = NumberFormat('#,##0', 'id_ID');
    return numberFormat.format(harga_produk);
  }
}

class Checkout_catatan extends StatelessWidget {
  const Checkout_catatan({Key? key, required this.catatanController})
      : super(key: key);
  final TextEditingController catatanController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Catatan (opsional)",
            style: TextStyle(
                color: Color(0xff222222),
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 5,
          ),
          Divider(
            color: ColorValue.hinttext,
            thickness: 0.5,
          ),
          SizedBox(
            height: 4,
          ),
          Container(
            color: Color(0xffF6F6F6),
            height: 135,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: TextFormField(
              controller: catatanController,
              maxLines: 6,
              maxLength: 150,
              style: TextStyle(
                  color: ColorValue.neutralColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                  hintText: "Tambahkan Catatan Disini...",
                  hintStyle: TextStyle(
                      color: ColorValue.hinttext,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}
