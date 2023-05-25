import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/color_value.dart';
import 'detail_content.dart';

class Detail_popup extends StatefulWidget {
  const Detail_popup({Key? key}) : super(key: key);

  @override
  State<Detail_popup> createState() => _Detail_popupState();
}

class _Detail_popupState extends State<Detail_popup> {
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
    ProductVariant? _productVariiant;

    return Container(
        height: MediaQuery.of(context).size.height * 0.3,
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                customRadio("1kg", ProductVariant.variant1),
                customRadio("2kg", ProductVariant.variant2),
                customRadio("3kg", ProductVariant.variant3),
              ],
            ),
            Spacer(),
            Container(
              height: 76,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Color(0xff0E4F55)),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Row(
                  children: [
                    Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                          color: Color(0xff009245),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                          child: SvgPicture.asset("assets/icon/chat.svg")),
                    ),                    SizedBox(
                      width: 4,),

                    Container(
                      height: 46,
                      width: 128,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff009245)),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          "+Keranjang",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4,),
                    GestureDetector(
                      onTap: () {
                      },
                      child: Container(
                        height: 46,
                        width: 128,
                        decoration: BoxDecoration(
                            color: Color(0xff009245),
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Text(
                            "Beli Sekarang",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )

          ],
        ),

    );
  }


}

