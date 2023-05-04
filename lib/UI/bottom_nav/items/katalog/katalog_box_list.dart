import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Katalog_box_list extends StatefulWidget {
  const Katalog_box_list({Key? key}) : super(key: key);

  @override
  State<Katalog_box_list> createState() => _Katalog_box_listState();
}

class _Katalog_box_listState extends State<Katalog_box_list> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 20,
                childAspectRatio: 0.52,
              ),
              itemCount: 6,
              itemBuilder: (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                        height: 63,
                        width: 63,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Color(0xffA0A0A0),
                            ),
                            boxShadow: [
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/icon/bahan_pokok.svg",
                              height: 36,
                              width: 36,
                            ),
                          ],
                        ),
                      ),
                  Text("Bahan Pokok", maxLines: 2, textAlign: TextAlign.center, style: TextStyle(

                    fontSize: 14,

                    fontWeight: FontWeight.w600
                  ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
