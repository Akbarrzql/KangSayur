import 'dart:convert';

import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:kangsayur/API/cart/cart.dart';
import 'package:kangsayur/UI/detail/detail.dart';
import 'package:kangsayur/UI/seller_detail/seller_detail.dart';
import 'package:kangsayur/common/color_value.dart';
import 'package:http/http.dart' as http;

import '../../model/detailproductmodel.dart';

class DetailPromoContent extends StatefulWidget {
  DetailPromoContent(
      {Key? key, this.widget, required this.photo, required this.hargaAkhir})
      : super(key: key);
  DetailProductModel? widget;
  String photo;

  String GroupValue = "";
  late int valueId;

  late int produkId = widget!.data.produkId.toInt();
  late int tokoId = widget!.data.tokoId.toInt();
  late int jumlahVariant = widget!.data.variant.length.toInt();

  //make looping index
  late List<String> namaVariant = [
    for (int i = 0; i < widget!.data.variant.length; i++)
      widget!.data.variant[i].variant
  ];

  late List<int> variantId = [
    for (int i = 0; i < widget!.data.variant.length; i++)
      widget!.data.variant[i].id
  ];

  late List<int> hargaVariant = [
    for (int i = 0; i < widget!.data.variant.length; i++)
      widget!.data.variant[i].hargaVariant
  ];
  final int hargaAkhir;

  @override
  State<DetailPromoContent> createState() => _DetailPromoContentState();
}

class _DetailPromoContentState extends State<DetailPromoContent> {
  @override
  void initState() {
    widget.produkId = widget.widget!.data.produkId;
    widget.tokoId = widget.widget!.data.tokoId;
    widget.jumlahVariant = widget.widget!.data.variant.length;
    widget.namaVariant = [
      for (int i = 0; i < widget.widget!.data.variant.length; i++)
        widget.widget!.data.variant[i].variant
    ];
    // TODO: implement initState
    super.initState();
  }

  bool isExpanded = false;
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                height: 260,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(
                          "https://kangsayur.nitipaja.online" +
                              widget.widget!.data.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15))),
                        child: Row(
                          children: [
                            RatingBar.builder(
                              itemBuilder: (context, index) {
                                return SvgPicture.asset("assets/icon/star.svg");
                              },
                              onRatingUpdate: (value) {},
                              initialRating: widget.widget!.data!.rating!,
                              ignoreGestures: true,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 14,
                              itemPadding: EdgeInsets.symmetric(horizontal: 2),
                              minRating: 1,
                              glow: false,
                              unratedColor: ColorValue.neutralColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Center(
                                child: Text(
                              widget.widget!.data.rating.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                "Rp. " +
                    NumberFormat("#,###,##0", "id_ID")
                        .format(widget.hargaAkhir) +
                    ",00",
                style: TextStyle(
                    color: Color(0xff3D5A80),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                widget.widget!.data.namaProduk,
                // widget!.widget!.data.namaProduk,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              // Row(
              //   children: [
              //     customRadio("1 Kg", ProductVariant.variant1),
              //     SizedBox(
              //       width: 10,
              //     ),
              //     customRadio("2 Kg", ProductVariant.variant2),
              //     SizedBox(
              //       width: 10,
              //     ),
              //     customRadio("3 Kg", ProductVariant.variant3),
              //   ],
              // ),
              Text(widget.widget!.data.variant[0].variantDesc,
                  maxLines: isExpanded ? 100 : 5,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: ColorValue.neutralColor)),
              SizedBox(
                height: 5,
              ),
              if (widget.widget!.data.variant[0].variantDesc.length > 100)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: Text(
                    isExpanded ? 'Sembunyikan' : 'Selengkapnya',
                    style: TextStyle(
                      color: Color(0xff14B25E),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              SizedBox(
                height: 15,
              ),
              _storeBox(widget.widget!.data.namaToko.toString(),
                  widget.widget!.data.imgProfile.toString()),
            ],
          ),
        ),
      ],
    );
  }

  Widget _storeBox(String namaToko, String gambarToko) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Seller_Detail(
                      tokoId: widget.tokoId.toString(),
                    )));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        height: 70,
        decoration: BoxDecoration(
          color: Color(0xfff1f1f1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                "https://kangsayur.nitipaja.online" + gambarToko,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  namaToko,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                            color: Color(0xff25C570),
                            borderRadius: BorderRadius.circular(50))),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Online",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(0.5)),
                    ),
                  ],
                )
              ],
            ),
            Spacer(),
            // Container(width: 110, height: 43, decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(10),
            //   border: Border.all(color: Color(0xff009245))
            // ),
            //   child: Center(child: Text("Langganan", textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xff009245)),)),
            // ),
          ],
        ),
      ),
    );
  }
}

class ExpandedWidget extends StatefulWidget {
  final String text;

  const ExpandedWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandedWidget> createState() => _ExpandedWidgetState();
}

class _ExpandedWidgetState extends State<ExpandedWidget> {
  late bool isExpanded;

  @override
  void initState() {
    isExpanded = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.text),
          Text(
            "Selengkapnya",
            style: TextStyle(),
          )
        ],
      ),
    );
  }
}
