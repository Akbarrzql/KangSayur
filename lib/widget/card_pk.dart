import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kangsayur/common/color_value.dart';

class Card_pk extends StatelessWidget {
  Card_pk({
    Key? key,
    required this.gambar_produk,
    required this.nama_produk,
    required this.harga_produk,
    required this.nama_toko,
    this.isDiscount = false,
    this.discount = 0,
    this.harga_diskon = 0,
  }) : super(key: key);

  // final String gambar_produk, nama_produk, harga_produk, nama_toko;
  final String gambar_produk, nama_produk, nama_toko;
  final int harga_produk;

  late int discount;
  late int harga_diskon;

  //make bool discount
  late bool isDiscount;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 107,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 4,
                    offset: Offset(0, 1))
              ]),
          child: Row(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                width: MediaQuery.of(context).size.width * 0.3,
                height: 107,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5)),
                    image: DecorationImage(
                        image: AssetImage(gambar_produk), fit: BoxFit.cover)),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Text Nama Produk
                    Text(
                      nama_produk,
                      style: TextStyle(
                          fontSize: 14,
                          color: ColorValue.neutralColor,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      nama_toko,
                      style: TextStyle(
                          fontSize: 10,
                          color: ColorValue.neutralColor,
                          fontWeight: FontWeight.w400),
                    ),
                    Spacer(),
                    //make condition if discount or not
                    isDiscount
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Rp. " +
                                    ProdukformatNumber(harga_produk)
                                        .toString() +
                                    ",00",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: ColorValue.neutralColor,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.lineThrough),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Rp. " +
                                    DiscountformatNumber(harga_diskon!)
                                        .toString() +
                                    ",00",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: ColorValue.primaryColor,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          )
                        :
//Text Harga Produk
                        Text(
                            "Rp. " +
                                ProdukformatNumber(harga_produk).toString() +
                                ",00",
                            style: TextStyle(
                                fontSize: 14,
                                color: ColorValue.primaryColor,
                                fontWeight: FontWeight.w600),
                          ),
                  ],
                ),
              )
            ],
          ),
        ),
        //make condition if discount return on bottom right container
        isDiscount
            ? Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 23,
                  width: 71,
                  decoration: BoxDecoration(
                      color: Color(0xff3D5A80),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomRight: Radius.circular(5),
                      )),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          discount.toString() + "%",
                          style: TextStyle(
                              fontSize: 10,
                              color: ColorValue.quaternaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(" OFF",
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ),
              )
            : Container()
      ],
    );
  }

  String ProdukformatNumber(harga_produk) {
    final numberFormat = NumberFormat('#,##0', 'id_ID');
    return numberFormat.format(harga_produk);
  }

  String DiscountformatNumber(harga_diskon) {
    final numberFormat = NumberFormat('#,##0', 'id_ID');
    return numberFormat.format(harga_diskon);
  }
}
