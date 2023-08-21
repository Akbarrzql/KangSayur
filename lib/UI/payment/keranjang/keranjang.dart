import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:kangsayur/API/cart/cart.dart';
import 'package:kangsayur/UI/payment/checkout/checkout.dart';
import 'package:kangsayur/bloc/json_bloc/json_event.dart';
import 'package:kangsayur/model/cartproductmodel.dart';
import 'package:kangsayur/model/checkoutmodel.dart';
import 'package:kangsayur/model/subtotalcartmodel.dart';
import 'package:kangsayur/widget/card_keranjang.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

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
  double total = 0.0;
  bool isCheckedAll = false;

  final JsonBloc _jsonBloc = JsonBloc();
  final JsonBloc _cart = JsonBloc();
  final JsonBloc _subtotal = JsonBloc();

  @override
  void initState() {
    _jsonBloc.add(GetCartProductList());
    _cart.add(GetCartProductList());
    _subtotal.add(GetSubTotalCartList());
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
                BlocProvider(
                  create: (_) => _cart,
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
                      return _selectAllButtonLoading();
                    } else if (state is JsonLoading) {
                      return _selectAllButtonLoading();
                    } else if (state is JsonLoaded) {
                      return _selectAllButton(state.jsonCartProduct);
                    } else if (state is JsonError) {
                      return Text(state.message);
                    }
                    return Container();
                  })),
                ),
                // _cardinfo(),
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
                      return _cartProductListLoading();
                    } else if (state is JsonLoading) {
                      return _cartProductListLoading();
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
          // Keranjang_bar(
          //   total_harga: 10000,
          //   onPressed: () {
          //     Navigator.push(context, MaterialPageRoute(
          //       builder: (context) {
          //         return Checkout();
          //       },
          //     ));
          //   },
          // ),
          // BlocProvider(
          //   create: (_) => _cart,
          //   child: BlocListener<JsonBloc, JsonState>(
          //       listener: (context, state) {
          //     if (state is JsonError) {
          //       ScaffoldMessenger.of(context).showSnackBar(
          //         SnackBar(
          //           content: Text(state.message),
          //         ),
          //       );
          //     }
          //   }, child:
          //           BlocBuilder<JsonBloc, JsonState>(builder: (context, state) {
          //     if (state is JsonInitial) {
          //       return Loading();
          //     } else if (state is JsonLoading) {
          //       return Loading();
          //     } else if (state is JsonLoaded) {
          //       return _keranjangBar(state.jsonCartProduct);
          //     } else if (state is JsonError) {
          //       return Text(state.message);
          //     }
          //     return Container();
          //   })),
          // ),
          Positioned(
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
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14),
                        ),
                        BlocProvider(
                          create: (_) => _subtotal,
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
                              return _subTotalLoading();
                            } else if (state is JsonLoading) {
                              return _subTotalLoading();
                            } else if (state is JsonLoaded) {
                              return _Total(state.jsonSubTotalCart);
                            } else if (state is JsonError) {
                              return Text(state.message);
                            }
                            return Container();
                          })),
                        ),
                      ],
                    ),
                    Spacer(),
                    BlocProvider(
                      create: (_) => _cart,
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
                          return _pesanButtonLoading();
                        } else if (state is JsonLoading) {
                          return _pesanButtonLoading();
                        } else if (state is JsonLoaded) {
                          return _pesanButton(state.jsonCartProduct);
                        } else if (state is JsonError) {
                          return Text(state.message);
                        }
                        return Container();
                      })),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Widget _Total(SubTotalCartModel widget) {
    return Text(
      "Rp." + ProdukformatNumber(widget.subtotal) + ",00",
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
    );
  }

  Widget _pesanButton(CartProductModel widget) {
    List status = [
      for (var i = 0; i < widget.data.length; i++)
        for (var j = 0; j < widget.data[i].getProductCart.length; j++)
          widget.data[i].getProductCart[j].status
    ];
    bool isTrue = status.contains("true");

    return GestureDetector(
      onTap: isTrue
          ? () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Checkout(
                            id: 0,
                          )));
            }
          : null,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        height: 40,
        decoration: BoxDecoration(
          color: isTrue
              ? ColorValue.primaryColor
              : ColorValue.primaryColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
            child: Text(
          "Pesan",
          style: TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
        )),
      ),
    );
  }

  Widget _selectAllButton(CartProductModel data) {
    List status = [
      for (var i = 0; i < data.data.length; i++)
        for (var j = 0; j < data.data[i].getProductCart.length; j++)
          data.data[i].getProductCart[j].status
    ];
    bool isTrue = status.every((element) => element == "true");
    if (data.data.length == 0) {
      return Container();
    } else
      return Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Row(
          children: [
            Transform.scale(
              scale: 1.4,
              child: Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: isTrue,
                tristate: false,
                //turn off hover
                hoverColor: Colors.transparent,
                checkColor: Colors.white,
                visualDensity: VisualDensity.compact,
                activeColor: ColorValue.primaryColor,
                onChanged: (bool? value) async {
                  setState(() {
                    isTrue = value!;
                  });
                  await Cart().PilihSemua();
                  setState(() {
                    _jsonBloc.add(GetCartProductList());
                    _cart.add(GetCartProductList());
                    _subtotal.add(GetSubTotalCartList());
                  });
                },
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
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
          ],
        ),
      );
  }

  Widget _selectAllButtonLoading() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Row(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Transform.scale(
              scale: 1.4,
              child: Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: false,
                tristate: false,
                //turn off hover
                hoverColor: Colors.transparent,
                checkColor: Colors.white,
                visualDensity: VisualDensity.compact,
                activeColor: ColorValue.primaryColor,
                onChanged: (bool? value)  {
                },
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
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
        ],
      ),
    );
  }

  Widget _pesanButtonLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
            child: Text(
          "Pesan",
          style: TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
        )),
      ),
    );
  }

  Widget _subTotalLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        height: 15,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
            child: Text(
          "Pesan",
          style: TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
        )),
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
    if (widget.data.length == 0) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          children: [
            Spacer(),
            LottieBuilder.asset(
              "assets/icon/lottie/cart.json",
              height: 250,
            ),
            Center(
              child: Text(
                "Keranjang kamu kosong",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      );
    } else
      return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: widget.data.length,
          itemBuilder: (context, index) {
            return Card_keranjang(
              kurang: () {
                _cart.add(GetCartProductList());
                _subtotal.add(GetSubTotalCartList());
              },
              tambah: () {
                _cart.add(GetCartProductList());
                _subtotal.add(GetSubTotalCartList());
              },
              nama_toko: widget.data[index].namaToko,
              profil_toko: widget.data[index].imgProfile,
              alamat_toko: widget.data[index].alamatToko,
              hapus: () {
                setState(() {
                  widget.data.removeAt(index);
                });
              },
              checklist: () {
                _cart.add(GetCartProductList());
                _subtotal.add(GetSubTotalCartList());
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
              cartId: [],
            );
          });
  }

  Widget _cartProductListLoading() {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 1,
        itemBuilder: (context, index) {
          return Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        //make profile for toko
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                              clipBehavior: Clip.antiAlias,
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey[300]!,
                                borderRadius: BorderRadius.circular(500),
                              )),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //make nama toko dan alamat toko
                            Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey[300],
                                ),
                                height: 20,
                                width: MediaQuery.of(context).size.width * 0.5,
                              ),
                            ),
                            Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.65,
                                height: 14,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey[300],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 25),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Transform.scale(
                                    scale: 1.4,
                                    child: Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[100]!,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                        ),
                                        width: 20,
                                        height: 20,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                      clipBehavior: Clip.antiAlias,
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Container(
                                    height: 80,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Shimmer.fromColors(
                                          baseColor: Colors.grey[300]!,
                                          highlightColor: Colors.grey[100]!,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.grey[300],
                                            ),
                                          ),
                                        ),
                                        //make this widget isVariant
                                        Shimmer.fromColors(
                                          baseColor: Colors.grey[300]!,
                                          highlightColor: Colors.grey[100]!,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.grey[300],
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Shimmer.fromColors(
                                          baseColor: Colors.grey[300]!,
                                          highlightColor: Colors.grey[100]!,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.grey[300],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 18,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                      height: 35,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.grey[300]),
                                    ),
                                  ),
                                  Spacer(),
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 12),
                                      height: 35,
                                      width: MediaQuery.of(context).size.width *
                                              0.4 -
                                          24,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.grey[300]),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                          ),
                                          Center(
                                            child: Container(
                                              width: 20,
                                              height: 35,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  ]));
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
  void initState() {
    // TODO: implement initState
    bool isChecked = false;
    super.initState();
  }

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
