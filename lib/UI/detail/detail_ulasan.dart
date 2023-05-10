import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kangsayur/UI/detail/detail_photo.dart';
import 'package:kangsayur/UI/detail/ulasan/ulasan.dart';
import 'package:photo_view/photo_view.dart';


import '../../common/color_value.dart';

class Detail_ulasan extends StatefulWidget {
  const Detail_ulasan({Key? key}) : super(key: key);

  @override
  State<Detail_ulasan> createState() => _Detail_ulasanState();
}

class _Detail_ulasanState extends State<Detail_ulasan> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Ulasan 5.0 | 30 ulasan',
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
            profile: 'assets/images/profile.png',
            name: 'Rizky Ramadhan',
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
            width: 42,
            child: Image.asset(
              profile,
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
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  RatingBar.builder(
                    itemBuilder: (context, index) {
                      return SvgPicture.asset("assets/icon/star.svg");
                    },
                    onRatingUpdate: (value) {},
                    initialRating: rating,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 14,
                    itemPadding: EdgeInsets.only(right: 1),
                    minRating: 1,
                    glow: false,
                    unratedColor: ColorValue.neutralColor,
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

