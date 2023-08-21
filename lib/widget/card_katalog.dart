import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Card_katalog extends StatelessWidget {
  const Card_katalog(
      {Key? key, required this.image, required this.title, required this.color})
      : super(key: key);

  //final image, color
  final String title;
  final String image;
  final int color;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 64,
        width: MediaQuery.of(context).size.width - 24 - 10,
        decoration: BoxDecoration(
          color: Color(color),
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
        child: Row(
          children: [

            Container(
              width: MediaQuery.of(context).size.width /2 - 24 - 24 - 10 - 28- 10 - 5,
              child: Text(
                title,
                style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
            Spacer(),
            Container(
                padding: EdgeInsets.all(6),
                height: 42,
                width: 42,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  image,
                  height: 28,
                  width: 28,
                ))
          ],
        ));
  }
}
