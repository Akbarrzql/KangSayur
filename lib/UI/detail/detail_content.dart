import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:kangsayur/UI/detail/detail.dart';
import 'package:kangsayur/common/color_value.dart';

import '../../model/detailproductmodel.dart';

enum ProductVariant { variant1, variant2, variant3 }

class Detail_content extends StatefulWidget {
  Detail_content({Key? key, required this.widget}) : super(key: key);
  DetailProductModel widget;

  @override
  State<Detail_content> createState() => _Detail_contentState();
}

class _Detail_contentState extends State<Detail_content> {
  @override
  void initState() {
    // TODO: implement initState
    //listener
    //mengasih data to detail
    Detail(
      idToko: widget.widget!.data!.tokoId,
      id: widget.widget!.data!.id!,
    );

    super.initState();
  }

  ProductVariant? _productVariiant;
  bool isExpanded = false;

  Widget customRadio(String text, ProductVariant value) {
    return OutlinedButton(
        onPressed: () {
          setState(() {
            _productVariiant = value;
          });
        },
        child: Text(text,
            style: TextStyle(
                fontSize: 12,
                color: _productVariiant == value
                    ? Colors.white
                    : ColorValue.neutralColor)),
        style: OutlinedButton.styleFrom(
            backgroundColor:
                _productVariiant == value ? ColorValue.primaryColor : null,
            primary: _productVariiant == value
                ? ColorValue.primaryColor
                : ColorValue.primaryColor,
            side: BorderSide(
                color: _productVariiant == value
                    ? ColorValue.primaryColor
                    : ColorValue.primaryColor,
                width: 1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))));
  }

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
                              initialRating: widget.widget.data!.rating!,
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
                              widget.widget.data!.rating!.toString(),
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
                        .format(widget.widget.data!.hargaProduk) +
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
                widget.widget.data!.namaProduk!,
                // widget.widget.data.namaProduk,
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
              Row(
                children: [
                  customRadio("1 Kg", ProductVariant.variant1),
                  SizedBox(
                    width: 10,
                  ),
                  customRadio("2 Kg", ProductVariant.variant2),
                  SizedBox(
                    width: 10,
                  ),
                  customRadio("3 Kg", ProductVariant.variant3),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(widget.widget.data!.deskripsi!,
                  maxLines: isExpanded ? 100 : 5,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: ColorValue.neutralColor)),
              SizedBox(
                height: 5,
              ),
              if (widget.widget.data!.deskripsi!.length > 100)
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
