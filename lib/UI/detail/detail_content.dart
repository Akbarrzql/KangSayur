import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kangsayur/common/color_value.dart';
import 'package:readmore/readmore.dart';

enum ProductVariant { variant1, variant2, variant3 }

class Detail_content extends StatefulWidget {
  const Detail_content({Key? key}) : super(key: key);

  @override
  State<Detail_content> createState() => _Detail_contentState();
}

class _Detail_contentState extends State<Detail_content> {
  ProductVariant? _productVariiant;

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
                        width: 130,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15))),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,),
                            RatingBar.builder(
                              itemBuilder: (context, index) {
                                return SvgPicture.asset("assets/icon/star.svg");
                              },
                              onRatingUpdate: (value) {},
                              initialRating: 5,
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
                              "5",
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
                "Rp. 120.000,00",
                style: TextStyle(
                    color: Color(0xff3D5A80),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Beras Pandan Wangi",
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
              ReadMoreText(
                "Beras Pandan Wangi merupakan jenis beras putih yang mempunyai aroma lebih wangi dibandingkan beras putih lainnya. Aroma khas Daun Pandan akan segera mencuat ketika akan dimasak menjadi nasi.Selain harum, Beras Pandan Wangi juga mempunyai tekstur yang pulen dan terasa manis. Sehingga jenis ini sangat populer dan menjadi pilihan untuk dikonsumsi ",
                trimMode: TrimMode.Line,
                trimLines: 5,
                trimCollapsedText: 'Selengkapnya',
                trimExpandedText: 'Tutup',
                style: TextStyle(
                     fontSize: 14,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
