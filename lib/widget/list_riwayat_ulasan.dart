import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:kangsayur/common/color_value.dart';


class List_riwayatulasan extends StatelessWidget {
   List_riwayatulasan({
    Key? key,
    required this.gambar,
    required this.produk,
    required this.pcs,
    required this.rating,
    required this.tanggal,
    required this.ulasan,
    required this.balas,
    required this.banyak_balas,
  }) : super(key: key);

  final String gambar;
  final String produk;
  final String pcs;
  final int rating;
  final String tanggal;
  final String ulasan;
  final bool balas;
  final int banyak_balas;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          //make divider with color hinttext
          Divider(
            color: ColorValue.hinttext,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
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
                  //text review with color black and size 14 weight 400
                  Text(
                    ulasan,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  //make text : 1 balasan dari penjual with color hinttext and size 12 weight 600
                  //make if balas true return text
                  if (balas == true)
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "$banyak_balas balasan dari penjual",
                          style: TextStyle(
                            color: ColorValue.hinttext,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12),
                ],
              ),
            ),
          ),
          Divider(
            color: ColorValue.hinttext,
          ),
        ],
      ),
    );
  }
}

String ubahFormatTanggal(String tanggal) {
  DateTime dateTime = DateFormat("dd/MM/yyyy").parse(tanggal);
  String tanggalBaru = DateFormat("dd MMMM yyyy").format(dateTime);
  return tanggalBaru;
}
