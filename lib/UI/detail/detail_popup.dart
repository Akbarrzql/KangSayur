import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kangsayur/UI/detail/beli_sekarang/beli_sekarang.dart';
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
      required this.namaProduk,
      required this.namaToko,
      required this.gambarToko,
      required this.tokoId,
      required this.jumlahVariant,
      required this.namaVariant,
      required this.variantId,
      required this.hargaVariant,
      required this.stokVariant,
      required this.gambarVariant})
      : super(key: key);

  final int produkId;
  String namaProduk;
  String gambarToko;
  String namaToko;
  final int tokoId;

  final int jumlahVariant;

  final List<String> namaVariant;

  final List<int> variantId;

  final List<int> hargaVariant;
  final List<int> stokVariant;
  final List<String> gambarVariant;

  @override
  State<Detail_popup> createState() => _Detail_popupState();
}

class _Detail_popupState extends State<Detail_popup> {
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
  late int hargaVariant = widget.hargaVariant[0];
  late String namaVariant = widget.namaVariant[0];
  late String gambarVariant = widget.gambarVariant[0];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height / 2.4,
      child: Column(
        children: [
          //buat kondisi jika memencet variant 1 akan muncul gambar yang variant 1
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (var i = 0; i < widget.jumlahVariant; i++)
                      if (isCheck[i] == true)
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ]),
                          child: Image.network(
                            'https://kangsayur.nitipaja.online' +
                                widget.gambarVariant[i],
                            fit: BoxFit.cover,
                          ),
                        ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var i = 0; i < widget.jumlahVariant; i++)
                          if (isCheck[i] == true)
                            Text(
                              widget.namaVariant[i],
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            ),
                        SizedBox(
                          height: 4,
                        ),
                        for (var i = 0; i < widget.jumlahVariant; i++)
                          if (isCheck[i] == true)
                            Text(
                              widget.namaProduk,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                        SizedBox(
                          height: 4,
                        ),
                        for (var i = 0; i < widget.jumlahVariant; i++)
                          if (isCheck[i] == true)
                            Text(
                              "Rp. ${widget.hargaVariant[i]},00",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: ColorValue.secondaryColor),
                            ),
                        SizedBox(
                          height: 4,
                        ),
                        for (var i = 0; i < widget.jumlahVariant; i++)
                          if (isCheck[i] == true)
                            Text(
                              "Stok : ${widget.stokVariant[i]}",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  color: Colors.grey,
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
                      childAspectRatio: 4 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 30),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (index == isCheck.indexOf(false, index)) {
                            isCheck[index] = true;
                            value[index] = widget.variantId[index];
                            idvariant = widget.variantId[index];
                            hargaVariant = widget.hargaVariant[index];
                            namaVariant = widget.namaVariant[index];
                            gambarVariant = widget.gambarVariant[index];
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
                        Cart().AddProductCart(widget.produkId.toString(),
                            widget.tokoId.toString(), idvariant.toString()).then((value) => (value) {
                              setState(() {
                                // snackbar
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Berhasil ditambahkan ke keranjang")));
                              });
                            });
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Beli_Sekarang(
                                    nama_produk: widget.namaProduk,
                                    nama_variant: namaVariant,
                                    gambar_produk: gambarVariant,
                                    harga_variant: hargaVariant,
                                    nama_toko: widget.namaToko,
                                    gambar_toko: widget.gambarToko,
                                  )));
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
