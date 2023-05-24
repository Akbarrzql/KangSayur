import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:kangsayur/common/color_value.dart';

class List_detailulasan_user extends StatelessWidget {
  List_detailulasan_user({
    Key? key,
    required this.gambar,
    required this.produk,
    required this.pcs,
    required this.rating,
    required this.tanggal,
    required this.ulasan,
  }) : super(key: key);

  final String gambar;
  final String produk;
  final String pcs;
  final int rating;
  final String tanggal;
  final String ulasan;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            //make divider with color hinttext
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        clipBehavior: Clip.hardEdge,
                        height: 61,
                        width: 61,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: AssetImage(gambar),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            produk,
                            style: TextStyle(
                              color: ColorValue.neutralColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            pcs,
                            style: TextStyle(
                              color: ColorValue.hinttext,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Row(
                            children: [
                              RatingBar.builder(
                                initialRating: rating.toDouble(),
                                direction: Axis.horizontal,
                                itemCount: 5,
                                itemSize: 18,
                                itemPadding: const EdgeInsets.only(right: 2.5),
                                itemBuilder: (context, _) => SvgPicture.asset(
                                  "assets/icon/star.svg",
                                  color: Color(0xffFFBA49),
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              //make small circle 6x6 with color 0xffd9d9d9
                              Container(
                                height: 6,
                                width: 6,
                                decoration: BoxDecoration(
                                  color: Color(0xffD9D9D9),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                ubahFormatTanggal(tanggal),
                                style: TextStyle(
                                  color: ColorValue.hinttext,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    ulasan,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            Divider(
              color: ColorValue.hinttext,
            ),
          ],
        ),
      ),
    );
  }
}


class List_detailulasan_penjual extends StatelessWidget {
  const List_detailulasan_penjual({Key? key, required this.profil, required this.nama, required this.tanggal, required this.ulasan}) : super(key: key);
  //final gambar, nama, tanggal, ulasan
  final String profil;
  final String nama;
  final String tanggal;
  final String ulasan;


  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: IntrinsicHeight(
        child: Container(
          key:
          //make key for height
          Key("height"),

          color: Color(0xffDDEDE7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //make container with width 4 and no height color primary
                 Container(
                  width: 4,
                  color: ColorValue.primaryColor,
                ),
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 5, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        //make container of circle with width 35 and height 35 image gambar
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(profil),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text("Oleh", style: TextStyle(color: ColorValue.hinttext, fontSize: 12, fontWeight: FontWeight.w400)),
                                Text(" "),
                                Text(
                                  nama,
                                  style: TextStyle(
                                    color: ColorValue.neutralColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            //tanggal
                            Text(
                              ubahFormatTanggal(tanggal),
                              style: TextStyle(
                                color: ColorValue.hinttext,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      ulasan,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

String ubahFormatTanggal(String tanggal) {
  DateTime dateTime = DateFormat("dd/MM/yyyy").parse(tanggal);
  String tanggalBaru = DateFormat("dd MMMM yyyy").format(dateTime);
  return tanggalBaru;
}

