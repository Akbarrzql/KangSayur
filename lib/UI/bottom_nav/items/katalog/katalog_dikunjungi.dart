import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kangsayur/UI/seller_detail/seller_detail.dart';
import 'package:kangsayur/model/tokopopularmodel.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../bloc/json_bloc/json_bloc.dart';
import '../../../../bloc/json_bloc/json_event.dart';
import '../../../../bloc/json_bloc/json_state.dart';
import '../home/promo_list.dart';
import '../profile/profile_head.dart';

class Katalog_dikunjungi extends StatefulWidget {
  const Katalog_dikunjungi({Key? key}) : super(key: key);

  @override
  State<Katalog_dikunjungi> createState() => _Katalog_dikunjungiState();
}

class _Katalog_dikunjungiState extends State<Katalog_dikunjungi> {
  final JsonBloc _jsonBloc = JsonBloc();

  @override
  void initState() {
    _jsonBloc.add(GetTokoPopularList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocProvider(
          create: (_) => _jsonBloc,
          child: BlocListener<JsonBloc, JsonState>(listener: (context, state) {
            if (state is JsonError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          }, child: BlocBuilder<JsonBloc, JsonState>(builder: (context, state) {
            if (state is JsonInitial) {
              return _TokoDikunjungiListLoading();
            } else if (state is JsonLoading) {
              return _TokoDikunjungiListLoading();
            } else if (state is JsonLoaded) {
              return _TokoDikunjungiList(widget: state.jsonTokoPopular);
            } else if (state is JsonError) {
              return Text(state.message);
            }
            return Container();
          })),
        ),
        SizedBox(
          height: 24,
        ),
      ],
    );
  }

  Widget _TokoDikunjungiList({required TokoPopularModel widget}) {
    if (widget.data.length == 0) {
      return Container();
    }else
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Paling Banyak dikunjungi",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 153,
          child: ListView.builder(
            padding: EdgeInsets.only(bottom: 0, right: 24),
            scrollDirection: Axis.horizontal,
            itemCount: widget.data.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Seller_Detail(tokoId: widget.data[index].id.toString()),
                    )),
                child: Container(
                  margin: EdgeInsets.fromLTRB(24, 0, 0, 10),
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              spreadRadius: 0,
                              blurRadius: 4,
                              offset: Offset(0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 10, bottom: 10),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white,
                            ),
                            child: Image.network(
                              "https://kangsayur.nitipaja.online" +
                                  widget.data[index].imgProfile,
                              fit: BoxFit.cover,
                              width: 70,
                              height: 70,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        widget.data[index].namaToko,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
  Widget _TokoDikunjungiListLoading() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Paling Banyak dikunjungi",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 153,
          child: ListView.builder(
            padding: EdgeInsets.only(bottom: 0, right: 24),
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.fromLTRB(24, 0, 0, 10),
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Center(
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            margin: EdgeInsets.only(top: 10, bottom: 10),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.grey[300]!,
                            ),
                            child: Container(
                              width: 70,
                              height: 70,
                            )
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey[300]!,
                        ),
                        child: Text(
                          "Loading",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
