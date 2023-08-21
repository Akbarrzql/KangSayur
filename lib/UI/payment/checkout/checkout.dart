import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:kangsayur/API/cart/cart.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/profile_head.dart';
import 'package:kangsayur/UI/payment/checkout/checkout_alamat.dart';
import 'package:kangsayur/UI/payment/midtrans_screen/snap_screen.dart';
import 'package:kangsayur/bloc/alamat_bloc/alamat_bloc.dart';
import 'package:kangsayur/bloc/alamat_bloc/alamat_state.dart';
import 'package:kangsayur/bloc/json_bloc/json_event.dart';
import 'package:kangsayur/common/color_value.dart';
import 'package:kangsayur/model/alamatmodel.dart';
import 'package:kangsayur/model/checkoutmodel.dart';
import 'package:kangsayur/model/ordermodel.dart';
import 'package:shimmer/shimmer.dart';

import '../../../bloc/alamat_bloc/alamat_event.dart';
import '../../../bloc/json_bloc/json_bloc.dart';
import '../../../bloc/json_bloc/json_state.dart';
import '../keranjang/keranjang.dart';
import 'checkout_items.dart';

class Checkout extends StatefulWidget {
  Checkout({
    Key? key,
    required this.id,
  }) : super(key: key);
  final int id;

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  TextEditingController _controller = TextEditingController();
  final JsonBloc _jsonBloc = JsonBloc();
  late List<String> _note = [];

  @override
  void initState() {
    _jsonBloc.add(GetCheckoutList(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Checkout",
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
                SizedBox(
                  height: 25,
                ),
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
                      return _infoPengirimanLoading();
                    } else if (state is JsonLoading) {
                      return _infoPengirimanLoading();
                    } else if (state is JsonLoaded) {
                      return _infoPengiriman(state.jsonCheckout);
                    } else if (state is JsonError) {
                      return Text(state.message);
                    }
                    return Container();
                  })),
                ),
                SizedBox(
                  height: 10,
                ),
                // Checkout_items(
                //   profil_seller: "assets/images/store.png",
                //   nama_seller: "Toko Sayur Segar",
                //   nama_produk: "Kangkung",
                //   gambar_produk: "assets/images/wortel.png",
                //   variant: "1 Kg",
                //   harga: 10000,
                //   jumlah: "1",
                //   subtotal: 10000,
                //   isVariant: true,
                //   itemCount_toko: 2,
                //   itemCount_produk: 2,
                // ),

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
                      return _chekoutItemsLoading();
                    } else if (state is JsonLoading) {
                      return _chekoutItemsLoading();
                    } else if (state is JsonLoaded) {
                      return _chekoutItems(state.jsonCheckout);
                    } else if (state is JsonError) {
                      return Text(state.message);
                    }
                    return Container();
                  })),
                ),

                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                ),
                Promo(),
                SizedBox(
                  height: 20,
                ),
                //checkout ringkasan
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
                      return _ringkasanPembayaranLoading();
                    } else if (state is JsonLoading) {
                      return _ringkasanPembayaranLoading();
                    } else if (state is JsonLoaded) {
                      return _ringkasanPembayaran(state.jsonCheckout);
                    } else if (state is JsonError) {
                      return Text(state.message);
                    }
                    return Container();
                  })),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.10,
                ),
              ],
            ),
          ),
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
            }, child:
                    BlocBuilder<JsonBloc, JsonState>(builder: (context, state) {
              if (state is JsonInitial) {
                return Positioned(
                  bottom: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.10,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                height: 20,
                                width: 100,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color(0xff009245),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                                child: Text(
                              "Bayar",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              } else if (state is JsonLoading) {
                return Positioned(
                  bottom: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.10,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                height: 20,
                                width: 100,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color(0xff009245),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                                child: Text(
                              "Bayar",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              } else if (state is JsonLoaded) {
                return Positioned(
                    bottom: 0, child: Bar(widget: state.jsonCheckout));
              } else if (state is JsonError) {
                return Text(state.message);
              }
              return Container();
            })),
          ),
        ],
      ),
    );
  }

  Widget _infoPengiriman(CheckoutModel data) {
    return Checkout_alamat(data.infoPengiriman.nama, data.infoPengiriman.alamat,
        data.infoPengiriman.nomotTelepon.toString(), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CheckoutAlamat()));
    });
  }

  Widget _infoPengirimanLoading() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Text(
                    "Alamat Pengiriman",
                    style: TextStyle(
                        color: Color(0xff222222),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  Text(
                    "Pilih Alamat Lain",
                    style: TextStyle(
                        color: ColorValue.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                color: ColorValue.hinttext,
                thickness: 0.5,
              ),
              SizedBox(
                height: 4,
              ),
            ],
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _ringkasanPembayaran(CheckoutModel widget) {
    return Checkout_ringkasan(
      sub_total: widget.rincian.subtotalProduk.toDouble(),
      ongkos_kirim: widget.rincian.subtotalOngkir,
      total_harga: widget.rincian.subtotalProduk.toDouble(),
    );
  }

  Widget _ringkasanPembayaranLoading() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 20,
              width: MediaQuery.of(context).size.width * 0.3,
            ),
          ),
          Divider(
            color: ColorValue.hinttext,
            thickness: 0.5,
          ),
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Text("SubTotal",
                        style: TextStyle(
                            color: ColorValue.neutralColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400)),
                    Spacer(),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("Ongkos Kirim",
                        style: TextStyle(
                            color: ColorValue.neutralColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400)),
                    Spacer(),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("Total",
                        style: TextStyle(
                            color: ColorValue.neutralColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400)),
                    Spacer(),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget Bar({required CheckoutModel widget}) {
    List<Map<String, dynamic>> dataArray = [
      for (var i = 0; i < widget.data.length; i++)
        for (var j = 0; j < widget.data[i].getProdukCheckout.length; j++)
          for (var k = 0; k < widget.data[i].getProdukCheckout[j].inCart; k++)
            {
              "product_id": widget.data[i].getProdukCheckout[j].produkId,
              "variant_id": widget.data[i].getProdukCheckout[j].variantId,
              "store_id": widget.data[i].getProdukCheckout[j].tokoId,
              for (var n = 0; n < _note.length; n++) "notes": _note[j],
              "alamat_id": widget.infoPengiriman.alamatId
            },
    ];
    return Container(
      height: MediaQuery.of(context).size.height * 0.10,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                NumberFormat.currency(
                  locale: 'id',
                  symbol: 'Rp',
                  decimalDigits: 0,
                ).format(widget.rincian.totalKeseluruhan),
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: () async {
              var data = await Cart()
                  .Order(dataArray, widget.rincian.totalKeseluruhan.toInt());
              print('object');
              print(data.data.snapToken);
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Snap_screen(
                            snap_token: data.data.snapToken,
                          )));
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xff009245),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                  child: Text(
                "Bayar",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              )),
            ),
          )
        ],
      ),
    );
  }

  Widget _chekoutItems(CheckoutModel widget) {
    List<String> notes = [
      for (var i = 0; i < widget.data.length; i++)
        for (var j = 0; j < widget.data[i].getProdukCheckout.length; j++) "",
    ];
    return Column(children: [
      ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: widget.data.length,
        itemBuilder: (context, index) {
          return Checkout_items(
            jumlah_barang: [
              for (var i = 0;
                  i < widget.data[index].getProdukCheckout.length;
                  i++)
                widget.data[index].getProdukCheckout[i].inCart.toString()
            ],
            seller_list: [
              for (var i = 0; i < widget.data.length; i++)
                widget.data[index].namaToko
            ],
            profil_seller: widget.data[index].imgProfile.toString(),
            nama_seller: widget.data[index].namaToko.toString(),
            notes: notes,
            onDataChanged: (data) {
              setState(() {
                notes = data;
                _note = notes;
                print('notes');
                print(notes);
              });
            },
            nama_produk: [
              for (var i = 0;
                  i < widget.data[index].getProdukCheckout.length;
                  i++)
                widget.data[index].getProdukCheckout[i].namaProduk
            ],
            gambar_produk: [
              for (var i = 0;
                  i < widget.data[index].getProdukCheckout.length;
                  i++)
                widget.data[index].getProdukCheckout[i].variantImg
            ],
            variant: [
              for (var i = 0;
                  i < widget.data[index].getProdukCheckout.length;
                  i++)
                widget.data[index].getProdukCheckout[i].variant
            ],
            harga: [
              for (var i = 0;
                  i < widget.data[index].getProdukCheckout.length;
                  i++)
                widget.data[index].getProdukCheckout[i].hargaVariant
            ],
            jumlah: [
              for (var i = 0;
                  i < widget.data[index].getProdukCheckout.length;
                  i++)
                "1"
            ],
            isVariant: true,
            itemCount_produk: widget.data[index].getProdukCheckout.length,
          );
        },
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Divider(
              height: 0.5,
              color: ColorValue.hinttext,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Subtotal",
                  style:
                      TextStyle(color: ColorValue.neutralColor, fontSize: 14),
                ),
                Text(
                  "Rp" +
                      ProdukformatNumber(widget.rincian.subtotalProduk) +
                      ",00",
                  style: TextStyle(
                      fontSize: 14,
                      color: ColorValue.neutralColor,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    ]);
  }

  Widget _chekoutItemsLoading() {
    return Column(children: [
      ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 1,
        itemBuilder: (context, index) {
          return Container(
              padding: EdgeInsets.only(left: 24, right: 24, top: 18),
              color: Colors.white,
              child: Column(children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: 35,
                            width: 35,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        //text name seller
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(
                      height: 0.5,
                      color: ColorValue.hinttext,
                    ),
                    SizedBox(height: 10),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(children: [
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 12),
                                  clipBehavior: Clip.antiAlias,
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[300],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Container(
                                height: 80,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[100]!,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                    ),
                                    Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[100]!,
                                      child: Container(
                                        height: 15,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[100]!,
                                      child: Container(
                                        height: 20,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 18,
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ]));
        },
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Divider(
              height: 0.5,
              color: ColorValue.hinttext,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    ]);
  }

  Widget Promo() {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Promo",
              style: TextStyle(
                  color: ColorValue.neutralColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 46,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Color(0xff009245),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icon/promo.svg",
                      color: Colors.white,
                      height: 24,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "  Makin hemat pakai promo",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    SvgPicture.asset(
                      "assets/icon/arrow_right.svg",
                      color: Colors.white,
                      height: 20,
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Widget Checkout_alamat(String nama_penerima, String alamat, String no_telp,
      VoidCallback onPressed) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Text(
                    "Alamat Pengiriman",
                    style: TextStyle(
                        color: Color(0xff222222),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      onPressed();
                    },
                    child: Text(
                      "Pilih Alamat Lain",
                      style: TextStyle(
                          color: ColorValue.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                color: ColorValue.hinttext,
                thickness: 0.5,
              ),
              SizedBox(
                height: 4,
              ),
            ],
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nama_penerima,
                  style: TextStyle(
                      color: ColorValue.neutralColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  no_telp,
                  style: TextStyle(
                      color: ColorValue.neutralColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  alamat,
                  style: TextStyle(
                      color: ColorValue.neutralColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Checkout_ringkasan extends StatelessWidget {
  Checkout_ringkasan(
      {Key? key,
      required this.total_harga,
      required this.sub_total,
      required this.ongkos_kirim,
      this.isDiscount = false,
      this.discount = 0})
      : super(key: key);

  // make final int of  total harga, ongkos kirim, biaya_layanan
  final double total_harga, ongkos_kirim;
  final double sub_total;
  late double discount = 0;
  late bool isDiscount = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Ringkasan Pembayaran",
              style: TextStyle(
                  color: Color(0xff222222),
                  fontSize: 14,
                  fontWeight: FontWeight.w600)),
          Divider(
            color: ColorValue.hinttext,
            thickness: 0.5,
          ),
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Text("SubTotal",
                        style: TextStyle(
                            color: ColorValue.neutralColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400)),
                    Spacer(),
                    Text("Rp. " + ProdukformatNumber(total_harga) + ",00",
                        style: TextStyle(
                            color: ColorValue.neutralColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
                Row(
                  children: [
                    Text("Ongkos Kirim",
                        style: TextStyle(
                            color: ColorValue.neutralColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400)),
                    Spacer(),
                    Text("Rp. " + ProdukformatNumber(ongkos_kirim) + ",00",
                        style: TextStyle(
                            color: ColorValue.neutralColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
                Row(
                  children: [
                    Text("Total",
                        style: TextStyle(
                            color: ColorValue.neutralColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400)),
                    Spacer(),
                    Text("Rp. " + ProdukformatNumber(total_harga) + ",00",
                        style: TextStyle(
                            color: ColorValue.neutralColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
                //make this widget isDiscount
                isDiscount
                    ? Row(
                        children: [
                          Text("Discount",
                              style: TextStyle(
                                  color: ColorValue.neutralColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400)),
                          Spacer(),
                          Text("- Rp. " + ProdukformatNumber(discount) + ",00",
                              style: TextStyle(
                                  color: ColorValue.neutralColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400)),
                        ],
                      )
                    : SizedBox(),
              ],
            ),
          )
        ],
      ),
    );
  }

  String ProdukformatNumber(harga_produk) {
    final numberFormat = NumberFormat('#,##0', 'id_ID');
    return numberFormat.format(harga_produk);
  }
}
