import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
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
        margin: EdgeInsets.only(left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Ulasan ${widget.widget.data!.rating} | 0 ulasan',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
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
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Ulasan(),
                      ),
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
            SizedBox(
              height: 15,
            ),
            Review(
              profile: widget.widget.data!.review[0].photo ?? "aasd",
              name: widget.widget.data!.review[0].name ?? "aasd",
              date: '12/12/2021',
              comment:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eget risus porta, tincidunt turpis at, ultricies sapien. Sed eget risus porta, tincidunt turpis at, ultricies sapien.',
              image: 'assets/images/review.jpg',
              rating: 5,
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
                borderRadius: BorderRadius.circular(100),
              ),
              width: 42,
              child: Image.network(
                "https://kangsayur.nitipaja.online/"+profile,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
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
                      itemPadding: EdgeInsets.only(right: 1),
                      minRating: 1,
                      glow: false,
                      unratedColor: ColorValue.neutralColor,
                      onRatingUpdate: (double value) {},
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  date,
                  style: TextStyle(fontSize: 12, color: Color(0xffA0A0A0)),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(comment),
        SizedBox(
          height: 15,
        ),
        //make image review
        GestureDetector(
          onTap: () {
            //make navigate to detail_photo
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Detail_photo(),
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
              tag: "someTag",
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 1,
          color: Color(0xffA0A0A0),
        ),
        //make image review
      ],
    );
  }
}
