import 'package:flutter/material.dart';
import 'package:kangsayur/common/color_value.dart';

class Promo_List extends StatefulWidget {
  const Promo_List({Key? key}) : super(key: key);

  @override
  State<Promo_List> createState() => _Promo_ListState();
}

class _Promo_ListState extends State<Promo_List> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(right: 24),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(24, 0, 0, 10),
                width: 145,
                height: 248,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 0,
                      blurRadius: 1,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/images/wortel.png",
                          width: 145,
                          height: 112,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(9, 0, 9, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 9,
                                  ),
                                  Text(
                                    "20 km",
                                    style: TextStyle(
                                      fontSize: 8,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "Wortel lokal 1/kg",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "Kebun Endah",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(9, 0, 9, 7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Rp. 12.000",
                            style: TextStyle(
                                fontSize: 8,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.lineThrough),
                          ),
                          Text(
                            "Rp. 12.000",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff3D5A80),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 70,
                height: 23,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      topRight: Radius.circular(5)),
                  color: Color(0xff3D5A80),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "20% ",
                      style: TextStyle(
                          fontSize: 12,
                          color: ColorValue.quaternaryColor,
                          fontWeight: FontWeight.bold),
                    ),

                    Text(
                      "OFF",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
