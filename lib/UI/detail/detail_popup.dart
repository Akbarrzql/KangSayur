import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kangsayur/model/detailproductmodel.dart';

import '../../API/cart/cart.dart';
import '../../bloc/json_bloc/json_bloc.dart';
import '../../bloc/json_bloc/json_event.dart';
import '../../bloc/json_bloc/json_state.dart';
import '../../common/color_value.dart';
import '../bottom_nav/items/profile/profile_head.dart';
import 'detail_content.dart';

class Detail_popup extends StatefulWidget {
  Detail_popup(
      {Key? key,
      required this.produkId,
      required this.tokoId,
      required this.jumlahVariant,
      required this.namaVariant,
      required this.variantId,
      required this.hargaVariant,
      required this.stokVariant})
      : super(key: key);

  final int produkId;

  final int tokoId;

  final int jumlahVariant;

  final List<String> namaVariant;

  final List<int> variantId;

  final List<int> hargaVariant;
  final List<int> stokVariant;

  @override
  State<Detail_popup> createState() => _Detail_popupState();
}

class _Detail_popupState extends State<Detail_popup> {
  late List gambar = [
    "assets/images/wortel.png",
    "assets/images/asd.png",
  ];
  late List<int> value = widget.variantId;
  late List<bool> isCheck = [
    // for (int i = 0; i < widget.jumlahVariant; i++) false
    //looping index false except index 0
    for (int i = 0; i < widget.jumlahVariant; i++) i == 0 ? true : false
  ];

  late List<int> variantId = [
    for (int i = 0; i < widget.jumlahVariant; i++) widget.variantId[i]
  ];

  late int idvariant = widget.variantId[0];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.2,
      child: Column(
        children: [
          //buat kondisi jika memencet variant 1 akan muncul gambar yang variant 1
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (var i = 0; i < widget.jumlahVariant; i++)
                      if (isCheck[i] == true)
                        Container(
                          height: 150,
                          width: 150,
                          child: Image.asset(gambar[i]),
                        ),
                    Column(
                      children: [
                        for (var i = 0; i < widget.jumlahVariant; i++)
                          if (isCheck[i] == true)
                            Text(
                              "Rp. ${widget.hargaVariant[i]}",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                        for (var i = 0; i < widget.jumlahVariant; i++)
                          if (isCheck[i] == true)
                            Text(
                              "Stok : ${widget.stokVariant[i]}",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                //buat kondisi jika memencet variant 2 akan muncul gambar yang variant 2
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: widget.jumlahVariant,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 70,
                      childAspectRatio: 5 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 30),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (index == isCheck.indexOf(false, index)) {
                            isCheck[index] = true;
                            value[index] = widget.variantId[index];
                            idvariant=widget.variantId[index];
                            print(idvariant);
                            print(value[index]);
                            variantId[index] = value[index];
                            for (var b = 0; b < isCheck.length; b++) {
                              if (b != index) {
                                isCheck[b] = false;
                              }
                            }
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: isCheck[index]
                                ? Color(0xff009245)
                                : Colors.white30,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Text(
                          widget.namaVariant[index],
                          style: TextStyle(
                              color:
                                  isCheck[index] ? Colors.white : Colors.black),
                        )),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            height: 76,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Color(0xff0E4F55)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Row(
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        color: Color(0xff009245),
                        borderRadius: BorderRadius.circular(5)),
                    child:
                        Center(child: SvgPicture.asset("assets/icon/chat.svg")),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        print(widget.produkId);
                        print(variantId);
                      });
                    },
                    child: Container(
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
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                          Cart().AddProductCart(widget.produkId.toString(), widget.tokoId.toString(), idvariant.toString());
                      });
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
          ),
        ],
      ),
    );
  }
}
