import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kangsayur/API/chat/chat.dart';
import 'package:kangsayur/API/resource/api_provider.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/inbox/navigate/chat_list/detail_chat/detail_chat.dart';
import 'package:kangsayur/UI/detail/detail_content.dart';
import 'package:kangsayur/UI/detail/detail_popup_beli.dart';
import 'package:kangsayur/UI/detail/detail_popup_keranjang.dart';
import 'package:kangsayur/UI/detail/detail_tokoini.dart';
import 'package:kangsayur/UI/detail/detail_ulasan.dart';
import 'package:kangsayur/bloc/json_bloc/json_event.dart';
import 'package:kangsayur/model/detailproductmodel.dart';
import 'package:shimmer/shimmer.dart';

import '../../bloc/json_bloc/json_bloc.dart';
import '../../bloc/json_bloc/json_state.dart';
import '../../common/color_value.dart';
import '../bottom_nav/items/profile/profile_head.dart';

class Detail extends StatefulWidget {
  Detail({Key? key, required this.id, this.diskon = 0, this.hargaAkhir = 0, this.isDiskon = false
  })
      : super(key: key);
  final int id;
  final int diskon;
  final int hargaAkhir;
  bool isDiskon = false;

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  DetailProductModel? _data;
  //loading chat
  bool isChatLoading = false;

  final JsonBloc _jsonBloc = JsonBloc();

  @override
  void initState() {
    _jsonBloc.add(GetDetailProductList(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
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
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
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
                      return Column(
                        children: [
                          const SizedBox(
                            height: 25,
                          ),
                          Detail_content(
                            widget: state.jsonDetailProduct,
                            photo: '',
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 15,
                          ),
                          Detail_tokoini(
                            widget: state.jsonDetailProduct,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Detail_ulasan(
                            widget: state.jsonDetailProduct,
                          ),
                          const SizedBox(
                            height: 80,
                          )
                        ],
                      );
                    } else if (state is JsonError) {
                      return Text(state.message);
                    }
                    return Container();
                  })),
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
                return _shimmerScreen();
              } else if (state is JsonLoading) {
                return _shimmerScreen();
              } else if (state is JsonLoaded) {
                return _bottomBar(widgetm: state.jsonDetailProduct);
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

  Widget _shimmerScreen() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          _shimmerContent(),
        ],
      ),
    );
  }

  Widget _shimmerContent() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 260,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Image.asset(
                        "assets/images/detail.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      left: 3,
                      bottom: 7,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: 40,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  bottomLeft: Radius.circular(15))),
                          child: Row(
                            children: [
                              Container(
                                color: Colors.grey[300]!,
                                child: RatingBar.builder(
                                  itemBuilder: (context, index) {
                                    return SvgPicture.asset(
                                        "assets/icon/star.svg");
                                  },
                                  onRatingUpdate: (value) {},
                                  initialRating: 5,
                                  ignoreGestures: true,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 14,
                                  itemPadding:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  minRating: 1,
                                  glow: false,
                                  unratedColor: ColorValue.neutralColor,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Center(
                                  child: Text(
                                "asdasdadsa",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  color: Colors.grey[300]!,
                  child: const Text(
                    "Rp. 20.000,00",
                    style: TextStyle(
                        color: Colors.transparent,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  color: Colors.grey[300]!,
                  child: const Text(
                    "asdasdasd",
                    // widget!.widget!.data.namaProduk,
                    style: TextStyle(
                        color: Colors.transparent,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey[300]!,
                  child: const Text(
                      "lorem ipsum dolor sit amet, consectetur adipiscing asdaf asfpija saojfoafjsoafj aosdja odjaojdsaj asojasod asdasda  asdasd sasdsad asda sda dapsjoasfp ssaj pa jpjdsjsa asdas",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.transparent)),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.grey[300]!,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/store.png",
                        height: 46,
                        width: 46,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "asdasasda",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: [
                              Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                      color: const Color(0xff25C570),
                                      borderRadius: BorderRadius.circular(50))),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Online",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black.withOpacity(0.5)),
                              ),
                            ],
                          )
                        ],
                      ),
                      const Spacer(),
                      // Container(width: 110, height: 43, decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(10),
                      //   border: Border.all(color: Color(0xff009245))
                      // ),
                      //   child: Center(child: Text("Langganan", textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xff009245)),)),
                      // ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _bottomBar({required DetailProductModel widgetm}) {
    List<String> namaVariant = [
      for (int i = 0; i < widgetm.data.variant.length; i++)
        widgetm.data.variant[i].variant
    ];
    List<int> hargaVariant = [
      for (int i = 0; i < widgetm.data.variant.length; i++)
        widgetm.data.variant[i].hargaVariant
    ];

    List<int> variantId = [
      for (int i = 0; i < widgetm.data.variant.length; i++)
        widgetm.data.variant[i].id
    ];

    return Positioned(
      bottom: 0,
      child: Container(
        height: 76,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Color(0xff0E4F55)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isChatLoading = true;
                  });
                  ChatFunc().startConversation(widgetm.data.sellerId.toString(), widgetm.data.namaToko, widgetm.data.imgProfile, widgetm.data.tokoId.toString(), context);
                },
                child: Container(
                  height: 48,
                  width: MediaQuery.of(context).size.width * 0.28 - 24 - 24,
                  decoration: BoxDecoration(
                      color: const Color(0xff009245),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: SvgPicture.asset(
                    "assets/icon/chat.svg",
                    color: Colors.white,
                  )),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    showModalBottomSheet(
                        context: context,
                        builder: (builder) {
                          return Detail_popup_keranjang(
                            gambarToko: widgetm.data.imgProfile,
                            namaToko: widgetm.data.namaToko,
                            namaProduk: widgetm.data.namaProduk,
                            produkId: widgetm.data.produkId,
                            tokoId: widgetm.data.tokoId,
                            jumlahVariant: widgetm.data.variant.length,
                            namaVariant: namaVariant,
                            variantId: variantId,
                            hargaVariant: hargaVariant,
                            stokVariant: [
                              for (int i = 0;
                                  i < widgetm.data.variant.length;
                                  i++)
                                widgetm.data.variant[i].stok
                            ],
                            gambarVariant: [
                              for (int i = 0;
                                  i < widgetm.data.variant.length;
                                  i++)
                                widgetm.data.variant[i].variantImg
                            ],
                          );
                        });
                  });
                },
                child: Container(
                  height: 46,
                  width: MediaQuery.of(context).size.width * 0.46 - 24 - 24,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff009245)),
                      borderRadius: BorderRadius.circular(5)),
                  child: const Center(
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
              const SizedBox(
                width: 4,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    showModalBottomSheet(
                        context: context,
                        builder: (builder) {
                          return Detail_popup_beli(
                            gambarToko: widgetm.data.imgProfile,
                            namaToko: widgetm.data.namaToko,
                            namaProduk: widgetm.data.namaProduk,
                            produkId: widgetm.data.produkId,
                            tokoId: widgetm.data.tokoId,
                            jumlahVariant: widgetm.data.variant.length,
                            namaVariant: namaVariant,
                            variantId: variantId,
                            diskon: widget.diskon,
                            hargaVariant: hargaVariant,
                            stokVariant: [
                              for (int i = 0;
                                  i < widgetm.data.variant.length;
                                  i++)
                                widgetm.data.variant[i].stok
                            ],
                            gambarVariant: [
                              for (int i = 0;
                                  i < widgetm.data.variant.length;
                                  i++)
                                widgetm.data.variant[i].variantImg
                            ],
                          );
                        });
                  });
                },
                child: Container(
                  height: 46,
                  width: MediaQuery.of(context).size.width * 0.5 - 48,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                      color: const Color(0xff009245),
                      borderRadius: BorderRadius.circular(5)),
                  child: const Center(
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
    );
  }
}
