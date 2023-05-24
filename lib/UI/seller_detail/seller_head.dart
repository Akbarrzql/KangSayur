import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Seller_head extends StatefulWidget {
  const Seller_head({Key? key}) : super(key: key);

  @override
  State<Seller_head> createState() => _Seller_headState();
}

class _Seller_headState extends State<Seller_head> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 92,
          color: Colors.blueAccent,
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 54,
            ),
            Positioned(
              top: -16,
              left: 24,
              right: 24,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        // shape: BoxShape.circle,
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                              image: AssetImage("assets/images/profile.png"),
                              fit: BoxFit.cover)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0, left: 5),
                          child: Text("Petani Medan",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600)),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                    color: Color(0xff25C570),
                                    borderRadius: BorderRadius.circular(100)),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Online",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/icon/star.svg",width: 14, height: 14,),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "4.5",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
