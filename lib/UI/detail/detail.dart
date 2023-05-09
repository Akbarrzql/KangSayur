import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kangsayur/UI/detail/detail_content.dart';
import 'package:kangsayur/UI/detail/detail_storebox.dart';
import 'package:kangsayur/UI/detail/detail_tokoini.dart';
import 'package:kangsayur/UI/detail/detail_ulasan.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Detail",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        leading: IconButton(
          icon: SvgPicture.asset("assets/icon/arrow_left.svg"),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset("assets/icon/share.svg"),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Detail_content(),
                SizedBox(
                  height: 15,
                ),
                Detail_storebox(),
                SizedBox(
                  height: 15,
                ),
                Container(height: 15,),
                Detail_tokoini(),
                SizedBox(
                  height: 15,
                ),
                // Detail_ulasan(),
                SizedBox(
                  height: 80,)
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
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
                    Container(
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
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
