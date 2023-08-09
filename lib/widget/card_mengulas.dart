import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../common/color_value.dart';

class Head_mengulas extends StatelessWidget {
  const Head_mengulas(
      {Key? key,
      required this.profil_seller,
      required this.nama_seller,
      required this.alamat_seller})
      : super(key: key);
  final String profil_seller;
  final String nama_seller;
  final String alamat_seller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24, right: 24),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 63,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(2)),
            child: Image.network(
              'https://kangsayur.nitipaja.online'+
              profil_seller,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(nama_seller,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: ColorValue.neutralColor)),
                SizedBox(
                  height: 2,
                ),
                Text(alamat_seller,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: ColorValue.hinttext)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Card_mengulas extends StatefulWidget {
  Card_mengulas({
    Key? key,
    required this.gambar_produk,
    required this.nama_produk,
    required this.nama_seller,
    this.rating = 0.0,
  }) : super(key: key);
  final String gambar_produk;
  final String nama_produk;
  final String nama_seller;
  double rating = 0.0;


  @override
  State<Card_mengulas> createState() => _Card_mengulasState();
}

class _Card_mengulasState extends State<Card_mengulas> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24, right: 24),
      //padding horizontal 22 vertical 15
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Image.asset(
                  widget.gambar_produk,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 17,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //nama produk
                  Text(
                    widget.nama_produk,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: ColorValue.neutralColor),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  //nama seller
                  Text(
                    widget.nama_seller,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: ColorValue.hinttext),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //text rating (number) and rating (text)
                  Text(
                    "${widget.rating.toStringAsFixed(1)}",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: ColorValue.neutralColor),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Rating",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: ColorValue.hinttext),
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              RatingBar.builder(
                  initialRating: widget.rating,
                  minRating: 0,
                  direction: Axis.horizontal,
                  itemSize: 30,
                  glow: false,
                  itemPadding: EdgeInsets.symmetric(horizontal: 6),
                  itemBuilder: (context, _) =>
                      SvgPicture.asset("assets/icon/star.svg"),
                  onRatingUpdate: (ratingNew) {
                    setState(() {
                      widget.rating = ratingNew;
                    });
                  }),
            ],
          ),
          // text ceritakan pengalamanmu size 14 w600
          SizedBox(
            height: 20,
          ),
          Text(
            "Ceritakan pengalamanmu",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: ColorValue.neutralColor),
          ),
          SizedBox(
            height: 5,
          ),
          //textfield inside container back color F6F6F6 height 122
          Container(
            height: 122,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Color(0xfff6f6f6),
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              maxLines: 5,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: ColorValue.neutralColor),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Ceritakan pengalamanmu",
                hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: ColorValue.hinttext),
              ),
            ),
          ),
          //make container for button height 54 color primary inside is row icon and text
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {

            },
            child: Container(
              height: 54,
              decoration: BoxDecoration(
                color: ColorValue.primaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icon/camera.svg"),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Tambahkan Foto",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
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

