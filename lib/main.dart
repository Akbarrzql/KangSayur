import 'package:flutter/material.dart';
import 'package:kangsayur/UI/bottom_nav/bottom_nav.dart';
import 'package:kangsayur/UI/bottom_nav/items/home/promo_kilat/promo_kilat.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/alamat/alamat.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/alamat/isi_alamat.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/inbox/inbox.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/inbox/navigate/chat_list/chat_list.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/inbox/navigate/chat_list/detail_chat/detail_chat.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/inbox/navigate/ulasan_anda/mengulas/mengulas.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/inbox/navigate/ulasan_anda/menunggu_diulas.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/inbox/navigate/ulasan_anda/ulasan_anda.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/notifikasi/notifikasi.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/riwayat_pembelian/riwayat_pembelian.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/toko_favorit/toko_favorit.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/ubah_profile/ubah_profile.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/whistlist/whistlist.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/profile.dart';
import 'package:kangsayur/UI/detail/detail.dart';
import 'package:kangsayur/UI/seller_detail/seller_detail.dart';
import 'package:kangsayur/register/register.dart';
import 'package:kangsayur/register/set_password.dart';
import 'package:kangsayur/splash_screen/splash_screen.dart';
import 'package:kangsayur/test.dart';
import 'package:kangsayur/test2.dart';
import 'UI/bottom_nav/items/home/home.dart';
import 'common/color_value.dart';
import 'on_boarding/on_boarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.white,
        textTheme: TextTheme(
            headline1: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: ColorValue.neutralColor),
            headline2: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: ColorValue.neutralColor),
            headline3: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: ColorValue.neutralColor),
            headline4: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: ColorValue.neutralColor),
            headline5: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: ColorValue.neutralColor),
            headline6: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: ColorValue.neutralColor),
            bodyText1: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: ColorValue.neutralColor),
            bodyText2: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: ColorValue.neutralColor),
            subtitle1: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: ColorValue.neutralColor),
            subtitle2: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w400,
                color: ColorValue.neutralColor),
            caption: TextStyle(
                fontSize: 6,
                fontWeight: FontWeight.w400,
                color: ColorValue.neutralColor),
            button: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: ColorValue.neutralColor),
            overline: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: ColorValue.neutralColor)),

        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home:  Promo_kilat(

      ),

    );
  }
}

