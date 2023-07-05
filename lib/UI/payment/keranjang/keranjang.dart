import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:kangsayur/API/cart/cart.dart';
import 'package:kangsayur/UI/payment/checkout/checkout.dart';
import 'package:kangsayur/bloc/json_bloc/json_event.dart';
import 'package:kangsayur/model/cartproductmodel.dart';
import 'package:kangsayur/widget/card_keranjang.dart';

import '../../../bloc/json_bloc/json_bloc.dart';
import '../../../bloc/json_bloc/json_state.dart';
import '../../../common/color_value.dart';
import '../../bottom_nav/items/profile/profile_head.dart';

class Keranjang extends StatefulWidget {
  const Keranjang({Key? key}) : super(key: key);

  @override
  State<Keranjang> createState() => _KeranjangState();
}

class _KeranjangState extends State<Keranjang> {
  bool isChecked = false;
  double total = 0.0;

  void updateTotal() {
    setState(() {
      if (isChecked) {
        total += 10.0; // Jumlah total bertambah saat checkbox diperiksa
      } else {
        total -= 10.0; // Jumlah total berkurang saat checkbox tidak diperiksa
      }
    });
  }

  final JsonBloc _jsonBloc = JsonBloc();

  @override
  void initState() {
    _jsonBloc.add(GetCartProductList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Keranjang",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          leading: IconButton(
            icon: SvgPicture.asset("assets/icon/arrow_left.svg"),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Row(
                    children: [
                      //make icon and text in one row dikirim ke rumah
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/icon/map.svg",
                            height: 24,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Dikirim ke ",
                            style: TextStyle(
                                color: ColorValue.neutralColor, fontSize: 14),
                          ),
                          Text(
                            "Rumah",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SvgPicture.asset(
                            "assets/icon/arrow_down.svg",
                            height: 10,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Transform.scale(
                        scale: 1.4,
                        child: Checkbox(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          value: isChecked,
                          tristate: false,
                          //turn off hover
                          hoverColor: Colors.transparent,
                          checkColor: Colors.white,
                          visualDensity: VisualDensity.compact,
                          activeColor: ColorValue.primaryColor,

                          onChanged: (bool? value) {
                            setState(() {});
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isChecked = !isChecked;
                          });
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Text(
                            "Pilih Semua",
                            style: TextStyle(
                              color: ColorValue.neutralColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                _cardinfo(),
                //make listview call card_keranjang
                BlocProvider(
                  create: (_) => _jsonBloc,
                  child: BlocListener<JsonBloc, JsonState>(
                      listener: (context, state) {
                    if (state is JsonError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                        ),
                      );
                    }
                  }, child: BlocBuilder<JsonBloc, JsonState>(
                          builder: (context, state) {
                    if (state is JsonInitial) {
                      return Loading();
                    } else if (state is JsonLoading) {
                      return Loading();
                    } else if (state is JsonLoaded) {
                      return _cartProductList(state.jsonCartProduct);
                    } else if (state is JsonError) {
                      return Text(state.message);
                    }
                    return Container();
                  })),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.10,
                )
              ],
            ),
          ),
          Keranjang_bar(
            total_harga: 10000,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Checkout();
                },
              ));
            },
          ),
        ],
      ),
    );
  }

  Widget _cardinfo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      height: 60,
      decoration: BoxDecoration(
        color: Color(0xff6DA4A9),
        // borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/icon/info.svg",
            height: 24,
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Text(
              "Pastikan alamat kamu sesuai dengan tujuan tempat kamu!",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _cartProductList(CartProductModel widget) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: widget.data.length,
        itemBuilder: (context, index) {
          return Card_keranjang(
              gambar_produk: "assets/images/wortel.png",
              nama_toko: "siu",
              profil_toko: widget.data[index].imgProfile,
              alamat_toko: "Jl. Raya Bogor KM 30",
              hapus: () {
                setState(() {
                  for (var i = 0;
                      i < widget.data[index].getProductCart.length;
                      i++)
                    Cart()
                        .DeleteProductCart(
                            widget.data[index].getProductCart[i].produkId
                                .toString(),
                            widget.data[index].getProductCart[i].variantId
                                .toString())
                        .then((value) => setState(() {
                              _jsonBloc.add(GetCartProductList());
                            }));
                });
              },
              produkList: widget.data[index].getProductCart,
              produk_namaList: [
                for (var i = 0;
                    i < widget.data[index].getProductCart.length;
                    i++)
                  widget.data[index].getProductCart[i].namaProduk
              ],
              produk_hargaList: [
                for (var i = 0;
                    i < widget.data[index].getProductCart.length;
                    i++)
                  widget.data[index].getProductCart[i].hargaVariant
              ],
              produk_gambarList: [
                for (var i = 0;
                    i < widget.data[index].getProductCart.length;
                    i++)
                  widget.data[index].getProductCart[i].variantImg
              ],
              produk_idList: [
                for (var i = 0;
                    i < widget.data[index].getProductCart.length;
                    i++)
                  widget.data[index].getProductCart[i].produkId
              ],
              produk_idTokoList: [
                for (var i = 0;
                    i < widget.data[index].getProductCart.length;
                    i++)
                  widget.data[index].getProductCart[i].tokoId
              ],
              produk_variantIdList: [
                for (var i = 0;
                    i < widget.data[index].getProductCart.length;
                    i++)
                  widget.data[index].getProductCart[i].variantId
              ],
              produk_variantList: [
                for (var i = 0;
                    i < widget.data[index].getProductCart.length;
                    i++)
                  widget.data[index].getProductCart[i].variant
              ],
              inCart: [
                for (var i = 0;
                    i < widget.data[index].getProductCart.length;
                    i++)
                  widget.data[index].getProductCart[i].inCart
              ],
              status: [
                for (var i = 0;
                    i < widget.data[index].getProductCart.length;
                    i++)
                  widget.data[index].getProductCart[i].status
              ],
              cartId: []);
        });
  }
}

class Keranjang_bar extends StatefulWidget {
  Keranjang_bar({Key? key, required this.total_harga, required this.onPressed})
      : super(key: key);
  final VoidCallback onPressed;
  final double total_harga;

//
//    double calculateTotal() {
//      double total = 0.0;
//      for (var item in cartItems) {
//        if (item.isSelected) {
//          total += item.price;
//        }
//      }
//      return total;
//    }
// }

  @override
  State<Keranjang_bar> createState() => _Keranjang_barState();
}

String ProdukformatNumber(harga_produk) {
  final numberFormat = NumberFormat('#,##0', 'id_ID');
  return numberFormat.format(harga_produk);
}

class _Keranjang_barState extends State<Keranjang_bar> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.10,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(1, 0), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                  Text(
                    "Rp." + ProdukformatNumber(widget.total_harga) + ",00",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  )
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: widget.onPressed,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xff009245),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                      child: Text(
                    "Pesan",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  )),
                ),
              )
            ],
          ),
        ));
  }
}
