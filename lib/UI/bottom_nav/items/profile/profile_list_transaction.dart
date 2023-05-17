import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Profile_list_transaction extends StatefulWidget {
  const Profile_list_transaction({Key? key}) : super(key: key);

  @override
  State<Profile_list_transaction> createState() => _Profile_list_transactionState();
}

class _Profile_list_transactionState extends State<Profile_list_transaction> {
  @override
  Widget build(BuildContext context) {
    return               Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
          height: MediaQuery.of(context).size.height * 0.155,
          padding: EdgeInsets.all(11),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 1),
              )
            ],
            borderRadius: BorderRadius.circular(5),),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Daftar Transaksi",
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      SvgPicture.asset("assets/icon/confirm.svg", height: 24,),
                      SizedBox(height: 10,),
                      Text("Konfirmasi",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffA0A0A0))),
                    ],
                  ),
                  Column(
                    children: [
                      SvgPicture.asset("assets/icon/delivery.svg", height: 24,),
                      SizedBox(height: 10,),
                      Text("Pengiriman",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffA0A0A0))),
                    ],
                  ),
                  Column(
                    children: [
                      SvgPicture.asset("assets/icon/box.svg", height: 24,),
                      SizedBox(height: 10,),
                      Text("Selesai",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffA0A0A0))),
                    ],
                  ),
                  Column(
                    children: [
                      SvgPicture.asset("assets/icon/chat.svg", height: 24,),
                      SizedBox(height: 10,),
                      Text("Ulasan",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffA0A0A0))),
                    ],
                  ),
                ],
              )
            ],
          )),
    );
  }
}
