import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kangsayur/UI/detail/detail.dart';
import 'package:kangsayur/model/produkterlarismodel.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../bloc/kategori_bloc/kategori_event.dart';
import '../../../../bloc/produkterlaris_bloc/produkterlaris_bloc.dart';
import '../../../../bloc/produkterlaris_bloc/produkterlaris_event.dart';
import '../../../../bloc/produkterlaris_bloc/produkterlaris_states.dart';
import '../../../../widget/card_product.dart';
import '../home/promo_list.dart';

class Katalog_terjual extends StatefulWidget {
  const Katalog_terjual({Key? key}) : super(key: key);

  @override
  State<Katalog_terjual> createState() => _Katalog_terjualState();
}

class _Katalog_terjualState extends State<Katalog_terjual> {
  //bloc
  final _bloc = ProdukTerlarisBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc.add(GetProdukTerlarisList());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<ProdukTerlarisBloc, ProdukTerlarisState>(
          bloc: _bloc,
          builder: (context, state) {
            if (state is ProdukTerlarisLoading) {
              return _produkTerlarisListLoading();
            } else if (state is ProdukTerlarisLoaded) {
              return _produkTerlarisList(state.produkterlaris);
            } else if (state is ProdukTerlarisError) {
              return Center(
                child: Text("Error"),
              );
            } else {
             return _produkTerlarisListLoading();
            }
          },
        ),
      ],
    );
  }

  Widget _produkTerlarisList(ProdukTerlarisModel data) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Paling banyak terjual",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  Spacer(),
                  Text(
                    "Lihat semua",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF5F5F5F)),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            height: 248,
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 24, bottom: 5),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: data.data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Detail(
                                    id: data.data[index].produkId,
                                  )));
                    },
                    child: CardProduk(
                      imageProduk: data.data[index].variantImg,
                      jarakProduk: data.data[index].distance.toString(),
                      namaProduk: data.data[index].namaProduk,
                      penjualProduk: data.data[index].namaToko,
                      hargaProduk: data.data[index].hargaVariant.toString(),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
  Widget _produkTerlarisListLoading() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Paling banyak terjual",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  Spacer(),
                  Text(
                    "Lihat semua",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF5F5F5F)),
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
          height: 248,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 24, bottom: 5),
            itemCount: 5,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 24),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: CardProduk(
                    imageProduk: 'https://via.placeholder.com/150',
                    jarakProduk: '20',
                    namaProduk: 'dadang 27',
                    penjualProduk: 'widget.data[index].namaToko',
                    hargaProduk: '3000',
                  ),
                ),
              );
            },
          ),
        )      ],
    );
  }
}
