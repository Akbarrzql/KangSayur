import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../common/color_value.dart';
import '../../../../../../widget/card_product.dart';

class Whistlist extends StatefulWidget {
  const Whistlist({Key? key}) : super(key: key);

  @override
  State<Whistlist> createState() => _WhistlistState();
}

class _WhistlistState extends State<Whistlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Whistlist Anda",
          style: TextStyle(color: ColorValue.neutralColor, fontSize: 16),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset("assets/icon/arrow_left.svg"),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              SizedBox(height: 22,),
              Center(
                child: Container(
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.center,
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.6,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                      ),
                      itemBuilder: (context, index) {
                        return  CardProduk(
                          hargaProduk: '12000',
                          imageProduk: 'assets/images/wortel.png',
                          jarakProduk: '1.2 km',
                          namaProduk: 'Wortel Lokal 1/Kg',
                          penjualProduk: 'Toko Bu Endah',

                        );
                      },
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),

    );
  }
}
