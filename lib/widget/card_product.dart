import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../UI/detail/detail.dart';
import '../common/color_value.dart';

class CardProduk extends StatelessWidget {
  CardProduk({
    Key? key,
    required this.imageProduk,
    required this.jarakProduk,
    required this.namaProduk,
    required this.penjualProduk,
    required this.hargaProduk,
    this.isSale = false,
    this.hargaAwal = "0",
    this.diskon = "0",
  }) : super(key: key);
  final String imageProduk;
  final String jarakProduk;
  final String namaProduk;
  final String penjualProduk;
  final String hargaProduk;
  bool isSale;
  String hargaAwal = "0";
  String diskon = "0";


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [

          Container(
            clipBehavior: Clip.antiAlias,
              width: 145,
              height: 248,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    spreadRadius: 0,
                    blurRadius: 1,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 145,
                          height: 112,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: imageProduk == null
                              ? Image.asset("assets/images/wortel.png")
                              : Image.network(
                                  "https://kangsayur.nitipaja.online" +
                                      imageProduk, fit: BoxFit.cover,),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(9, 0, 9, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 9,
                                ),
                                Text(
                                    jarakProduk.length <= 4
                                        ? jarakProduk
                                        : jarakProduk.substring(0, 4) + " km",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(
                                          fontSize: 10,
                                          color: ColorValue.neutralColor,
                                        )),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  namaProduk,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                        fontSize: 14,
                                        color: ColorValue.neutralColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  penjualProduk,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                        fontSize: 10,
                                        color: ColorValue.neutralColor,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(9, 0, 9, 7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (isSale)
                        Text(
                          "Rp. " +
                              NumberFormat('#,##0', 'id_ID')
                                  .format(int.parse(hargaAwal)) +
                              ",00",                          style: TextStyle(
                              fontSize: 8,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.lineThrough),
                        ),

                        Text(
                          //make money format here
                          "Rp. " +
                              NumberFormat('#,##0', 'id_ID')
                                  .format(int.parse(hargaProduk)) +
                              ",00",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff3D5A80),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          if (isSale)
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 5, 10, 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    topRight: Radius.circular(5)),
                color: Color(0xff3D5A80),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${diskon}%",
                    style: TextStyle(
                        fontSize: 12,
                        color: ColorValue.quaternaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    " OFF",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
