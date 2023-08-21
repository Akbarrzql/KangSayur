import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:kangsayur/UI/detail/detail_ulasan.dart';

import '../../../common/color_value.dart';
import '../../../model/detailproductmodel.dart';
import '../detail_photo.dart';

class Ulasan extends StatefulWidget {
  List<int> rating;
  List comment;
  List name;
  List date;
  List photo;
  List imgProduct;
  List reply;
  double ratingProduct;

  Ulasan(
      {Key? key,
      required this.rating,
      required this.comment,
      required this.name,
      required this.date,
      required this.photo,
      required this.imgProduct,
      required this.reply,
      required this.ratingProduct
      })
      : super(key: key);

  @override
  State<Ulasan> createState() => _UlasanState();
}

class _UlasanState extends State<Ulasan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Ulasan",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        leading: IconButton(
          icon: SvgPicture.asset("assets/icon/arrow_left.svg"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icon/star.svg",
                        height: 24,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${widget.ratingProduct.toString()}",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "/5.0",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffA0A0A0)),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Text(
                            "100% pembeli merasa puas",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${widget.reply.length.toString()} total ulasan",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.rating.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Review(
                      profile: widget.photo[index].toString(),
                      name: widget.name[index],
                      date: widget.date[index].toString(),
                      comment: widget.comment[index],
                      image: widget.imgProduct[index].toString(),
                      rating: widget.rating[index].toDouble(),
                      reply: widget.reply[index].toString(),
                      context: context,
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget Review({
    required String profile,
    required String name,
    required String date,
    required String comment,
    required String image,
    required double rating,
    required BuildContext context,
    required String reply,
  }) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
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
                      "https://kangsayur.nitipaja.online/" + profile,
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
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
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
                            unratedColor: Colors.transparent,
                            onRatingUpdate: (double value) {},
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        DateFormat('dd MMMM yyyy').format(DateTime.parse(date)),
                        style:
                            TextStyle(fontSize: 12, color: Color(0xffA0A0A0)),
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
              if (image != "null")
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        //make navigate to detail_photo
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Detail_photo(tag: image, networkImage: image),
                          ),
                        );
                      },
                      child: Hero(
                        tag: image,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.network(
                            "https://kangsayur.nitipaja.online/" +
                                image.toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
            ],
          ),
        ),
        if (reply != "")
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            width: MediaQuery.of(context).size.width,
            color: Color(0xffF0F0F0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Balasan dari penjual",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  reply,
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        Divider(
          color: ColorValue.neutralColor,
          thickness: 0.2,
        )
      ],
    );
  }
}
