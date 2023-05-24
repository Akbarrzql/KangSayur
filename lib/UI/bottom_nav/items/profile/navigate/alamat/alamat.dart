import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/alamat/tambah_alamat.dart';
import 'package:kangsayur/common/color_value.dart';

class Alamat extends StatefulWidget {
  const Alamat({Key? key}) : super(key: key);

  @override
  State<Alamat> createState() => _AlamatState();
}

class _AlamatState extends State<Alamat> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Alamat",
          style: TextStyle(color: ColorValue.neutralColor, fontSize: 16),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Tambah_alamat();
                  }));
                },
                child: Text("Tambah Alamat",
                    style: TextStyle(
                        color: ColorValue.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
              ),
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset("assets/icon/arrow_left.svg"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: screenHeight,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Alamat_list(),
                  SizedBox(
                    height: 85,
                  )
                ],
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: 35,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  color: ColorValue.primaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text("Pilih Alamat",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Alamat_list extends StatefulWidget {
  const Alamat_list({Key? key}) : super(key: key);

  @override
  State<Alamat_list> createState() => _Alamat_listState();
}

class _Alamat_listState extends State<Alamat_list> {
  int _selectedItem = -1;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
  shrinkWrap: true,
  physics: NeverScrollableScrollPhysics(),
  itemCount: 3,

        itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () {
          //make function for radio button
          setState(() {
            _selectedItem = index;
          });
        },
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                  color: _selectedItem == index
                      ? Color(0xffECFDF3)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      //make color radio button func
                      color: _selectedItem == index
                          ? ColorValue.primaryColor
                          : ColorValue.hinttext,
                      width: 1)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
                    child: Row(
                      children: [
                        Text(
                          "sui",
                          style:
                              TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        SvgPicture.asset("assets/icon/pinpoint.svg")
                      ],
                    ),
                  ),
                  Divider(thickness: 1,
                      color: _selectedItem == index
                          ? ColorValue.primaryColor
                          : ColorValue.hinttext,),
                  Container(
                    padding:
                        EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "asd",
                          style:
                              TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "12312",
                          style:
                              TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "123123",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,)
          ],
        ),
      );
    });
  }
}

