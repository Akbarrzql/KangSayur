import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kangsayur/UI/seller_detail/seller_detail.dart';
import 'package:kangsayur/bloc/json_bloc/json_event.dart';
import 'package:kangsayur/common/color_value.dart';
import 'package:kangsayur/model/nearesttokomodel.dart';
import 'package:shimmer/shimmer.dart';

import '../UI/bottom_nav/items/profile/profile_head.dart';
import '../bloc/json_bloc/json_bloc.dart';
import '../bloc/json_bloc/json_state.dart';

class PanelWidget extends StatefulWidget {
  const PanelWidget({Key? key, required this.controller}) : super(key: key);
  final ScrollController controller;

  @override
  State<PanelWidget> createState() => _PanelWidgetState();
}

class _PanelWidgetState extends State<PanelWidget> {
  final JsonBloc _jsonBloc = JsonBloc();

  @override
  void initState() {
    _jsonBloc.add(GetNearestTokoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(15), topLeft: Radius.circular(15)),
        color: Colors.white,
      ),
      child: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: ListView(
          scrollDirection: Axis.vertical,
          controller: widget.controller,
          shrinkWrap: true,
          children: <Widget>[
            Column(
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const Text(
                      "Toko disekitar",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 26,
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
                      return _TokoSekitarLoading();
                    } else if (state is JsonLoading) {
                      return _TokoSekitarLoading();
                    } else if (state is JsonLoaded) {
                      return Container(
                          child: _TokoSekitar(
                              context: context, widget: state.jsonNearestToko));
                    } else if (state is JsonError) {
                      return Text(state.message);
                    }
                    return Container();
                  })),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _TokoSekitarLoading() {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Container(
            height: 84,
            width: MediaQuery.of(context).size.width - 48,
            color: Colors.white,
            child: Row(
              children: [
                //make container image
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    width: 84,
                    height: 84,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.grey[300]),
                  ),
                ),
                const SizedBox(
                  width: 22,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 48 - 84 - 22,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: 20,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey[300]),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: 20,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey[300]),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: 20,
                              width: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey[300]),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text("|"),
                          const SizedBox(
                            width: 15,
                          ),
                          SvgPicture.asset("assets/icon/star.svg"),
                          const SizedBox(
                            width: 5,
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: 20,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey[300]),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _TokoSekitar(
      {required BuildContext context, required NearestTokoModel widget}) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.data.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Seller_Detail(tokoId: widget.data[index].id.toString()),)),
            child: _TokoSekitarList(
                widget: widget,
                context: context,
// gambar: "assets/images/toko.png",
                gambar: "https://kangsayur.nitipaja.online${widget.data[index].imgProfile}" ==
                        null
                    ? "https://images.unsplash.com/photo-1547721064-da6cfb341d50"
                    : "https://kangsayur.nitipaja.online${widget.data[index].imgProfile}",
                nama: widget.data[index].namaToko,
                alamat: widget.data[index].alamat,
                jarak: widget.data[index].distance.toString(),
                review: 3.4.toString()),
          ),
        );
      },
    );
  }

  Widget _TokoSekitarList(
      {required NearestTokoModel widget,
      required BuildContext context,
      required String gambar,
      required String nama,
      required String alamat,
      required String jarak,
      required String review}) {
    return Container(
      height: 84,
      width: MediaQuery.of(context).size.width - 48,
      color: Colors.white,
      child: Row(
        children: [
          //make container image
          Container(
            clipBehavior: Clip.antiAlias,
            width: 84,
            height: 84,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: Image.network(
              gambar,
              fit: BoxFit.cover,
              width: 84,
              height: 84,
            ),
          ),
          const SizedBox(
            width: 22,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 48 - 84 - 22,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  nama,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  child: Text(
                    alamat,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      jarak.length <= 4 ? jarak : jarak.substring(0, 4) + " km",
                      style:
                          const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text("|"),
                    const SizedBox(
                      width: 15,
                    ),
                    SvgPicture.asset("assets/icon/star.svg"),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(review,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
