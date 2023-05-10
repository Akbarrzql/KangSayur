import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kangsayur/UI/detail/detail_ulasan.dart';

class Ulasan extends StatefulWidget {
  const Ulasan({Key? key}) : super(key: key);

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
        child: Padding(
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
                    "5.0",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                    children: [
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
                        "30 total ulasan",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Review(
                  name: "asd",
                  profile: "assets/images/profile.png",
                  date: "23-12-2023",
                  comment: "yang jual sayur ini baik banget pokoknya mantap deh" ,
                  image: "assets/images/review.jpg",
                  rating: 5,
                  context: context),
              SizedBox(
                height: 15,
              ),            Review(
                  name: "asd",
                  profile: "assets/images/profile.png",
                  date: "23-12-2023",
                  comment: "yang jual sayur ini baik banget pokoknya mantap deh" ,
                  image: "assets/images/review.jpg",
                  rating: 5,
                  context: context),
              SizedBox(
                height: 15,
              ),            Review(
                  name: "asd",
                  profile: "assets/images/profile.png",
                  date: "23-12-2023",
                  comment: "yang jual sayur ini baik banget pokoknya mantap deh" ,
                  image: "assets/images/review.jpg",
                  rating: 5,
                  context: context),
              SizedBox(
                height: 15,
              ),            Review(
                  name: "asd",
                  profile: "assets/images/profile.png",
                  date: "23-12-2023",
                  comment: "yang jual sayur ini baik banget pokoknya mantap deh" ,
                  image: "assets/images/review.jpg",
                  rating: 5,
                  context: context),
              SizedBox(
                height: 15,
              ),            Review(
                  name: "asd",
                  profile: "assets/images/profile.png",
                  date: "23-12-2023",
                  comment: "yang jual sayur ini baik banget pokoknya mantap deh" ,
                  image: "assets/images/review.jpg",
                  rating: 5,
                  context: context),
              SizedBox(
                height: 15,
              ),            Review(
                  name: "asd",
                  profile: "assets/images/profile.png",
                  date: "23-12-2023",
                  comment: "yang jual sayur ini baik banget pokoknya mantap deh" ,
                  image: "assets/images/review.jpg",
                  rating: 5,
                  context: context),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
