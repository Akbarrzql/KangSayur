import 'dart:convert';

import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:kangsayur/API/cart/cart.dart';
import 'package:kangsayur/UI/detail/detail.dart';
import 'package:kangsayur/common/color_value.dart';
import 'package:http/http.dart' as http;

import '../../model/detailproductmodel.dart';


class Detail_content extends StatefulWidget {
  Detail_content({Key? key, this.widget}) : super(key: key);
  DetailProductModel? widget;

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



  @override
  State<Detail_content> createState() => _Detail_contentState();
}

class _Detail_contentState extends State<Detail_content> {
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
                height: 260,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/detail.png",
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                      left: 2,
                      bottom: 7,
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
                              initialRating: widget!.widget!.data.rating,
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
                                  widget!.widget!.data.rating.toString(),
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
                        .format(widget!.widget!.data.harga) +
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
                widget!.widget!.data.namaProduk,
                // widget!.widget!.data.namaProduk,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Text("Pilih Varian",
                  style:
                  TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
              SizedBox(
                height: 4,
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
              SizedBox(
                width: MediaQuery.of(context).size.width,height: 40,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: widget!.widget!.data.variant.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    width: 200,
                    child: RadioListTile(
                      title: Text(widget!.widget!.data.variant[index].variant),
                        value: widget!.widget!.data.variant[index].variant,
                        groupValue: widget!.GroupValue,
                        onChanged: (value) {
                          setState(() {
                            widget!.GroupValue = value.toString();
                            print(widget!.GroupValue);
                            widget!.valueId = index;
                          });
                        },
                        ),
                  );
                },),
              ),

              SizedBox(
                height: 20,
              ),
              Text(widget!.widget!.data.variant[0].variantDesc,
                  maxLines: isExpanded ? 100 : 5,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: ColorValue.neutralColor)),
              SizedBox(
                height: 5,
              ),
              if (widget!.widget!.data.variant[0].variantDesc.length > 100)
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
            ],
          ),
        ),
      ],
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
          Text(widget!.text),
          Text(
            "Selengkapnya",
            style: TextStyle(),
          )
        ],
      ),
    );
  }
}

