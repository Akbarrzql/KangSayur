import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../common/color_value.dart';

class CardRiwayat extends StatelessWidget {
  CardRiwayat(
      {Key? key,
      required this.jenisVerifikasiProduk,
      required this.tanggalVerifikasiProduk,
      required this.namaVerifikasiProduk,
      required this.descVerifikasiProduk,
      required this.gambarVerifikasiProduk,
      required this.statusVerifikasiProduk,
      required this.onPressed,
      required this.banyakVerifikasiProduk})
      : super(key: key);
  final String jenisVerifikasiProduk;
  final List banyakVerifikasiProduk;
  final String tanggalVerifikasiProduk;
  final String namaVerifikasiProduk;
  final String descVerifikasiProduk;
  final String gambarVerifikasiProduk;
  final String statusVerifikasiProduk;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: ColorValue.hinttext,
          width: 0.5,
        ),
      ),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        child: SvgPicture.asset(
                          'assets/icon/shoppingbag.svg',
                          width: 25,
                          height: 25,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            jenisVerifikasiProduk,
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: ColorValue.neutralColor,
                                    ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            DateFormat('dd-MM-yyyy').format(
                                DateTime.parse(tanggalVerifikasiProduk)),
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                      color: ColorValue.neutralColor,
                                    ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            const Divider(
              color: ColorValue.hinttext,
              thickness: 0.5,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        'https://kangsayur.nitipaja.online'+gambarVerifikasiProduk,
                        fit: BoxFit.cover,
                      ),
                    )
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        namaVerifikasiProduk,
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: ColorValue.neutralColor,
                            ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        descVerifikasiProduk,
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: ColorValue.hinttext,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            if (banyakVerifikasiProduk.length > 1)
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: ColorValue.neutralColor.withOpacity(0.1),
                      ),
                      child: Text(
                        "+ ${banyakVerifikasiProduk.length - 1} produk lainnya",
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: ColorValue.neutralColor,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFFD7FEDF),
                    ),
                    child: Text(
                      statusVerifikasiProduk,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: ColorValue.primaryColor,
                          ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: onPressed,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(85, 25),
                        primary: ColorValue.primaryColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        "Detail",
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: Colors.white,
                            ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
