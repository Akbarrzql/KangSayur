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
    String timeString1 = "19:00:00";
    String timeString2 = "17:00:00";

    // Convert time strings to DateTime objects
    DateTime time1 = DateTime.parse("2023-01-01 $timeString1");
    DateTime time2 = DateTime.parse("2023-01-01 $timeString2");

    // Calculate the time difference in hours
    double hoursDifference = time1.difference(time2).inHours.toDouble();

    // Convert hours to seconds (1 hour = 3600 seconds)
    int secondsDifference = (hoursDifference * 3600).round();
    // subtracting the current time with seconds difference

    print(
        "wuiiii${DateTime.now().subtract(Duration(seconds: secondsDifference))}");

    DateTime now = DateTime.now();
    DateTime endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);

    // Calculate the time difference between now and the end of the day
    Duration timeDifference = endOfDay.difference(now);

    int secondsRemaining = timeDifference.inSeconds;

    // Convert the duration to seconds

    print('Current time: $now');
    print('End of the day: $endOfDay');
    print('Seconds remaining in the day: $secondsRemaining seconds');

    print(DateTime.now());
    int seconds = DateTime.now().second;
    print("asdasd${secondsDifference - seconds}");
    print('Time difference in hours: $hoursDifference');
    print('Time difference in seconds: $secondsDifference');

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
                      //make timer here
                      Container(
                        width: 10,
                        height: 15,
                        decoration: const BoxDecoration(
                          color: Color(0xffD9D9D9),
                        ),
                        child: const Center(
                            child: Text(
                          "2",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        )),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Container(
                        width: 10,
                        height: 15,
                        decoration: const BoxDecoration(
                          color: Color(0xffD9D9D9),
                        ),
                        child: const Center(
                            child: Text(
                          "3",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        )),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Container(
                        width: 10,
                        height: 15,
                        decoration: const BoxDecoration(
                          color: Color(0xffD9D9D9),
                        ),
                        child: const Center(
                            child: Text(
                          "5",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        )),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Container(
                        width: 10,
                        height: 15,
                        decoration: const BoxDecoration(
                          color: Color(0xffD9D9D9),
                        ),
                        child: const Center(
                            child: Text(
                          "0",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        )),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
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
