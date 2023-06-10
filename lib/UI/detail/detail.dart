import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kangsayur/API/resource/api_provider.dart';
import 'package:kangsayur/UI/detail/detail_content.dart';
import 'package:kangsayur/UI/detail/detail_popup.dart';
import 'package:kangsayur/UI/detail/detail_storebox.dart';
import 'package:kangsayur/UI/detail/detail_tokoini.dart';
import 'package:kangsayur/UI/detail/detail_ulasan.dart';
import 'package:kangsayur/bloc/json_bloc/json_event.dart';
import 'package:kangsayur/model/detailproductmodel.dart';

import '../../bloc/json_bloc/json_bloc.dart';
import '../../bloc/json_bloc/json_state.dart';
import '../../common/color_value.dart';
import '../bottom_nav/items/profile/profile_head.dart';

class Detail extends StatefulWidget {
  Detail({Key? key, required this.id, this.idToko}) : super(key: key);
  final int id;
  int? idToko;

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
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
                          SizedBox(
                            height: 25,
                          ),
                          Detail_content(widget: state.jsonDetailProduct),
                          SizedBox(
                            height: 15,
                          ),
                          Detail_storebox(),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 15,
                          ),
                          Detail_tokoini(),
                          SizedBox(
                            height: 15,
                          ),
                          Detail_ulasan(
                            widget: state.jsonDetailProduct,
                          ),
                          SizedBox(
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
                return Container();
              } else if (state is JsonLoading) {
                return Container();
              } else if (state is JsonLoaded) {
                return _bottomBar(state.jsonDetailProduct);
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

  // make void modal bottom sheet
  void _showModalBottomSheet() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        context: context,
        builder: (builder) {
          return Detail_popup();
        });
  }

  Widget _bottomBar(DetailProductModel widget) {
    return Positioned(
      bottom: 0,
      child: Container(
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
                child: Center(child: SvgPicture.asset("assets/icon/chat.svg")),
              ),
              SizedBox(
                width: 4,
              ),
              GestureDetector(
                onTap: () async {
                //make condition
                //   ApiProvider().AddProductCart(widget.data!.id.toString(),
                //       widget.data!.tokoId!.toString());
                //   if (ApiProvider().AddProductCart(widget.data!.id.toString(), widget.data!.tokoId!.toString())) {
                //     ScaffoldMessenger.of(context).showSnackBar(
                //       SnackBar(
                //         content: Text("Berhasil ditambahkan ke keranjang"),
                //       ),
                //     );
                //   } else {
                //     ScaffoldMessenger.of(context).showSnackBar(
                //       SnackBar(
                //         content: Text("Gagal ditambahkan ke keranjang"),
                //       ),
                //     );
                //   }
                    await ApiProvider().AddProductCart(widget.data!.id.toString(), widget.data!.tokoId!.toString()) ? ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Berhasil ditambahkan ke keranjang"),
                      ),
                    ) : ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Gagal ditambahkan ke keranjang"),
                      ),
                    );
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
                  _showModalBottomSheet();
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
    );
  }
}
