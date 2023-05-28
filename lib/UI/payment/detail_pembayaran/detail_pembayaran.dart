import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:kangsayur/common/color_value.dart';

class Detail_pembayaran extends StatefulWidget {
  const Detail_pembayaran(
      {Key? key,
      required this.nomor_virtual_account,
      required this.total_pembayaran})
      : super(key: key);
  final int nomor_virtual_account;
  final double total_pembayaran;

  @override
  State<Detail_pembayaran> createState() => _Detail_pembayaranState();
}

class _Detail_pembayaranState extends State<Detail_pembayaran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Detail Pembayaran",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          leading: IconButton(
            icon: SvgPicture.asset("assets/icon/arrow_left.svg"),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Detail_pembayaran_waktu(
            hours: 23,
            minutes: 59,
            seconds: 59,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                // make row image bca, column text transfer ke nomor virtual account, and column text 123125121121513, spacer outside column and text salin
                Image.asset(
                  "assets/images/bca.png",
                  width: 64,
                  height: 64,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Transfer ke nomor virtual account",
                      style: TextStyle(
                          color: ColorValue.hinttext,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.nomor_virtual_account.toString().replaceAllMapped(
                          RegExp(r".{4}"), (match) => "${match.group(0)} "),
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Clipboard.setData(new ClipboardData(
                        text: widget.nomor_virtual_account.toString()));
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Nomor Virtual Account berhasil disalin"),
                      duration: Duration(seconds: 2),
                    ));
                  },
                  child: Text(
                    "Salin",
                    style: TextStyle(
                        color: ColorValue.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Divider(
              color: ColorValue.hinttext,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Detail_pembayaran_cara_pembayaran(),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            decoration: BoxDecoration(
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
            child: Container(
              //make Konfirmasi button using container
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => Detail_pembayaran()));
                },
                child: Text(
                  "Konfirmasi",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                    primary: ColorValue.primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Detail_pembayaran_waktu extends StatefulWidget {
  Detail_pembayaran_waktu(
      {Key? key,
      required this.hours,
      required this.minutes,
      required this.seconds})
      : super(key: key);
  late Timer timer;
  int hours = 0;
  int minutes = 0;
  int seconds = 0;

  @override
  State<Detail_pembayaran_waktu> createState() =>
      _Detail_pembayaran_waktuState();
}

class _Detail_pembayaran_waktuState extends State<Detail_pembayaran_waktu> {
  void _startTimer() {
    const oneSec = const Duration(seconds: 1);
    widget.timer = Timer.periodic(oneSec, (Timer timer) {
      setState(() {
        if (widget.hours == 0 && widget.minutes == 0 && widget.seconds == 0) {
          timer
              .cancel(); // Timer berhenti ketika mencapai 0 jam, 0 menit, dan 0 detik
        } else {
          if (widget.seconds > 0) {
            widget.seconds--;
          } else {
            if (widget.minutes > 0) {
              widget.minutes--;
              widget.seconds = 59;
            } else {
              if (widget.hours > 0) {
                widget.hours--;
                widget.minutes = 59;
                widget.seconds = 59;
              }
            }
          }
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    widget.timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 24,
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffECFDF3),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Text(
            "Selesaikan pembayaran dalam waktu",
            style: TextStyle(
                fontSize: 12,
                color: ColorValue.neutralColor,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 12,
          ),
          //make timer here with 3 container each container represent hour, minute, second
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: ColorValue.primaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                    child: Text(
                  widget.hours.toString(),
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                ":",
                style: TextStyle(
                    fontSize: 16,
                    color: ColorValue.neutralColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: ColorValue.primaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                    child: Text(
                  widget.minutes.toString(),
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                ":",
                style: TextStyle(
                    fontSize: 16,
                    color: ColorValue.neutralColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: ColorValue.primaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                    child: Text(
                  widget.seconds.toString(),
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Detail_pembayaran_cara_pembayaran extends StatelessWidget {
  const Detail_pembayaran_cara_pembayaran({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        children: [
          //text Cara pembayaran sub judul
          Row(
            children: [
              Text(
                "Cara Pembayaran",
                style: TextStyle(
                    fontSize: 14,
                    color: ColorValue.neutralColor,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),

          //make expansion tile
          ListView(
            shrinkWrap: true,
            children: [
              ExpansionTileTheme(
                data: ExpansionTileThemeData(
                  iconColor: ColorValue.primaryColor,
                  tilePadding: EdgeInsets.symmetric(horizontal: 0),
                ),
                child: ExpansionTile(
                  title: Text('ATM BCA', style: TextStyle(
                      fontSize: 12,
                      color: ColorValue.neutralColor,
                      fontWeight: FontWeight.w600,
                  ),),
                  children: [],
                ),
              ),
              //make 2 more of expansion tile mobile bangking bca, and internet bangking
ExpansionTileTheme(
                data: ExpansionTileThemeData(
                  iconColor: ColorValue.primaryColor,
                  tilePadding: EdgeInsets.symmetric(horizontal: 0),
                ),
                child: ExpansionTile(
                  title: Text('Mobile Banking BCA', style: TextStyle(
                    fontSize: 12,
                    color: ColorValue.neutralColor,
                    fontWeight: FontWeight.w600,
                  ),),
                  children: [],
                ),
              ),
              ExpansionTileTheme(
                data: ExpansionTileThemeData(
                  iconColor: ColorValue.primaryColor,
                  tilePadding: EdgeInsets.symmetric(horizontal: 0),
                ),
                child: ExpansionTile(
                  title: Text('Internet Banking BCA', style: TextStyle(
                    fontSize: 12,
                    color: ColorValue.neutralColor,
                    fontWeight: FontWeight.w600,
                  ),),
                  children: [],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
