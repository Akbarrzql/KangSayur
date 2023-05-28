import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:kangsayur/common/color_value.dart';

class Card_pembayaran extends StatefulWidget {
  const Card_pembayaran(
      {Key? key,
      required this.gambar_pembayaran,
      required this.nama_pembayaran,
      required this.metode_pembayaran,
      required this.nomor_virtual_account,
      required this.total_pembayaran,
      required this.onTap})
      : super(key: key);
  final String gambar_pembayaran, nama_pembayaran, metode_pembayaran;
  final int nomor_virtual_account;
  final double total_pembayaran;

  // declare variable for ontap
  final Function() onTap;

  @override
  State<Card_pembayaran> createState() => _Card_pembayaranState();
}

class _Card_pembayaranState extends State<Card_pembayaran> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 24, right: 24, bottom: 20),
      child: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    widget.gambar_pembayaran,
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.nama_pembayaran,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          NumberFormat.currency(
                                      locale: 'id',
                                      symbol: 'Rp ',
                                      decimalDigits: 0)
                                  .format(widget.total_pembayaran) +
                              ",00",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: ColorValue.primaryColor,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(left: 12, right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nomor Virtual Account",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          Text(
                            widget.nomor_virtual_account
                                .toString()
                                .replaceAllMapped(RegExp(r".{4}"),
                                    (match) => "${match.group(0)} "),
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          Spacer(),
                          GestureDetector(
                              onTap: () {
                                Clipboard.setData(new ClipboardData(
                                    text: widget.nomor_virtual_account
                                        .toString()));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                      "Nomor Virtual Account berhasil disalin"),
                                  duration: Duration(seconds: 2),
                                ));
                              },
                              child: Text(
                                "Salin",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: ColorValue.primaryColor),
                              ))
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Metode Pembayaran",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400)),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        widget.metode_pembayaran,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: GestureDetector(
                      onTap: widget.onTap,
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: ColorValue.primaryColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Text(
                            "Detail Pembayaran",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
