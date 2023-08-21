import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:kangsayur/UI/detail/detail_photo.dart';
import 'package:kangsayur/UI/detail/ulasan/ulasan.dart';
import 'package:kangsayur/model/detailproductmodel.dart';
import 'package:photo_view/photo_view.dart';

import '../../common/color_value.dart';
import '../../model/detailproductmodel.dart';

class Detail_ulasan extends StatefulWidget {
  Detail_ulasan({Key? key, required this.widget}) : super(key: key);
  DetailProductModel widget;

  @override
  State<Detail_ulasan> createState() => _Detail_ulasanState();
}

class _Detail_ulasanState extends State<Detail_ulasan> {
  @override
  Widget build(BuildContext context) {
    if (widget.widget.data!.review!.isEmpty) {
      return Container(
        margin: const EdgeInsets.only(left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Rating ${widget.widget.data!.rating} | 0 ulasan',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Belum ada ulasan',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.5)),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Ulasan ${widget.widget!.data!.rating} | ${widget.widget!.data!.review!.length} ulasan',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Ulasan(
                            ratingProduct: widget.widget!.data!.rating,
                                reply: [
                                  for (var i = 0;
                                      i < widget.widget!.data!.review!.length;
                                      i++)
                                    widget.widget!.data!.review![i].reply
                                ],
                                rating: [
                                  for (var i = 0;
                                      i < widget.widget!.data!.review!.length;
                                      i++)
                                    widget.widget!.data!.review![i].ratingProduk
                                ],
                                comment: [
                                  for (var i = 0;
                                      i < widget.widget!.data!.review!.length;
                                      i++)
                                    widget.widget!.data!.review![i].komentarUser
                                ],
                                name: [
                                  for (var i = 0;
                                      i < widget.widget!.data!.review!.length;
                                      i++)
                                    widget.widget!.data!.review![i].nameUser
                                ],
                                date: [
                                  for (var i = 0;
                                      i < widget.widget!.data!.review!.length;
                                      i++)
                                    widget
                                        .widget!.data!.review![i].tanggalComment
                                ],
                                photo: [
                                  for (var i = 0;
                                      i < widget.widget!.data!.review!.length;
                                      i++)
                                    widget.widget!.data!.review![i].gambarUser
                                ],
                                imgProduct: [
                                  for (var i = 0;
                                      i < widget.widget!.data!.review!.length;
                                      i++)
                                    widget.widget!.data!.review![i].imgProduct
                                ],
                              )),
                    );
                  },
                  child: Text(
                    'Lihat semua',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(0.5)),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Review(
              profile: widget.widget.data!.review![0].gambarUser,
              name: widget.widget.data!.review![0].nameUser,
              date: widget.widget.data!.review![0].tanggalComment.toString(),
              comment: widget.widget.data!.review![0].komentarUser,
              image: widget.widget.data.review![0].imgProduct ?? "null",
              rating: widget.widget.data!.review![0].ratingProduk.toDouble(),
              context: context,
            ),
          ],
        ),
      );
    }
  }

// make custom widget for the comment

  Widget Review({
    required String profile,
    required String name,
    required String date,
    required String comment,
    required String image,
    required double rating,
    required BuildContext context,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(100),
                shape: BoxShape.circle,
              ),
              width: 42,
              height: 42,
              child: Image.network(
                "https://kangsayur.nitipaja.online/$profile",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    RatingBar.builder(
                      itemBuilder: (context, index) {
                        return SvgPicture.asset("assets/icon/star.svg");
                      },
                      ignoreGestures: true,
                      initialRating: rating,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 14,
                      itemPadding: const EdgeInsets.only(right: 1),
                      minRating: 1,
                      glow: false,
                      unratedColor: ColorValue.neutralColor,
                      onRatingUpdate: (double value) {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  DateFormat('dd MMMM yyyy').format(DateTime.parse(date)),
                  style:
                      const TextStyle(fontSize: 12, color: Color(0xffA0A0A0)),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(comment),
        const SizedBox(
          height: 15,
        ),
        //make image review
        if (image == "null") Container(),
        if (image != "null")
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  //make navigate to detail_photo
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  Detail_photo(tag: image, networkImage: image,),
                    ),
                  );
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Hero(
                    tag: "$image",
                    child: Image.network(
                      "https://kangsayur.nitipaja.online/$image",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ), //make image review
      ],
    );
  }
}
