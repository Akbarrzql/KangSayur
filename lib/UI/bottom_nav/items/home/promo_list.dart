import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kangsayur/UI/detail/detail.dart';
import 'package:kangsayur/UI/detailpromo/detailpromo.dart';
import 'package:kangsayur/bloc/productsale_bloc/productsale_bloc.dart';
import 'package:kangsayur/common/color_value.dart';
import 'package:kangsayur/model/productsalemodel.dart';
import 'package:kangsayur/widget/card_product.dart';
import 'package:kangsayur/widget/countdowntimewidget.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../../../bloc/productsale_bloc/productsale_event.dart';
import '../../../../bloc/productsale_bloc/productsale_state.dart';

class Promo_List extends StatefulWidget {
  const Promo_List({Key? key}) : super(key: key);

  @override
  State<Promo_List> createState() => _Promo_ListState();
}

class _Promo_ListState extends State<Promo_List> {
  ProductSaleBloc productSaleBloc = ProductSaleBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productSaleBloc.add(GetProductSaleList());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductSaleBloc, ProductSaleState>(
      bloc: productSaleBloc,
      builder: (context, state) {
        if (state is ProductSaleInitial) {
          return Container();
        } else if (state is ProductSaleLoading) {
          return Container();
        } else if (state is ProductSaleLoaded) {
          return _PromoList(state.productSale);
        } else if (state is ProductSaleError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const Center(
            child: Text(""),
          );
        }
      },
    );
  }

  Widget _PromoList(ProductSaleModel data) {
    int customRound(double number) {
      if (number - number.truncate() > 0.5) {
        return number.ceil();
      } else {
        return number.floor();
      }
    }



    if (data.data.length == 0) {
      return Container();
    }
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text(
                        "Promo kilat",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Spacer(),
                      Text(
                        "Lihat semua",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xffA0A0A0)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Berakhir dalam",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xffA0A0A0)),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      // Timer Countdown Widget
                      Countdown(
                          seconds: data.secDiff,
                          build: (_, double time) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Row(
                                children: [
                                  // Menit puluhan
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 3, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: ColorValue.primaryColor,
                                    ),
                                    child: Text(
                                      "${time ~/ 600}",
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  // Menit satuan
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 3, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: ColorValue.primaryColor,
                                    ),
                                    child: Text(
                                      "${(time ~/ 60) % 10}",
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    ":",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  // Detik puluhan
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 3, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: ColorValue.primaryColor,
                                    ),
                                    child: Text(
                                      "${(time % 60) ~/ 10}",
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  // Detik satuan
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 3, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: ColorValue.primaryColor,
                                    ),
                                    child: Text(
                                      "${time.toInt() % 10}",
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
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
                              builder: (context) => DetailPromo(
                                    id: data.data[index].produkId,
                                    hargaAkhir: data.data[index].hargaSale,
                                    namaVariant: data.data[index].variant,
                                    variantId: data.data[index].variantId,
                                    diskon: data.data[index].diskon.ceil(),
                                  )));
                    },
                    child: CardProduk(
                      imageProduk: data.data[index].gambarProduk,
                      jarakProduk: data.data[index].distance.toString(),
                      namaProduk: data.data[index].namaProduk,
                      penjualProduk: data.data[index].namaToko,
                      hargaProduk: data.data[index].hargaSale.toString(),
                      diskon: data.data[index].diskon.ceil().toString(),
                      hargaAwal: data.data[index].hargaAwal.toString(),
                      isSale: true,
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
}
