import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/alamat/alamat.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/inbox/inbox.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/notifikasi/notifikasi.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/riwayat_pembelian/riwayat_pembelian.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/toko_favorit/toko_favorit.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/whistlist/whistlist.dart';
import 'package:kangsayur/UI/detail/detail.dart';

import '../home/home.dart';

class Profile_content extends StatefulWidget {
  const Profile_content({Key? key}) : super(key: key);

  @override
  State<Profile_content> createState() => _Profile_contentState();
}

class _Profile_contentState extends State<Profile_content> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Aktivitas Saya",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          SizedBox(
            height: 10,
          ),
          Profile_list(
              icon: "assets/icon/bill.svg",
              name: "Riwayat Transaksi",
              route: Riwayat_transaksi(),
              context: context),
          // Profile_list(
          //     icon: "assets/icon/love.svg",
          //     name: "Wishlist",
          //     route: Whistlist(),
          //     context: context),
          Profile_list(
              icon: "assets/icon/market.svg",
              name: "Toko Favorit",
              route: Toko_favorit(),
              context: context),
          // Text("Kategori",
          //     style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          // SizedBox(
          //   height: 10,
          // ),
          // Profile_list(
          //     icon: "assets/icon/wheat.svg",
          //     name: "Bahan Pokok",
          //     route: Home(),
          //     context: context),
          // Profile_list(
          //     icon: "assets/icon/vegetable.svg",
          //     name: "Sayuran",
          //     route: Home(),
          //     context: context),
          // Profile_list(
          //     icon: "assets/icon/fruit.svg",
          //     name: "Buah-Buahan",
          //     route: Home(),
          //     context: context),
          // Profile_list(
          //     icon: "assets/icon/meat.svg",
          //     name: "Daging",
          //     route: Home(),
          //     context: context),
          // Profile_list(
          //     icon: "assets/icon/bird.svg",
          //     name: "Unggas",
          //     route: Home(),
          //     context: context),
          // Profile_list(
          //     icon: "assets/icon/egg.svg",
          //     name: "Telur",
          //     route: Home(),
          //     context: context),
          // Text("Pengaturan",
          //     style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          // SizedBox(
          //   height: 10,
          // ),
          Profile_list(
              icon: "assets/icon/inbox.svg",
              name: "Inbox",
              route: Inbox(),
              context: context),
          Profile_list(
              icon: "assets/icon/notification.svg",
              name: "Notifikasi",
              route: Notifikasi(),
              context: context),
          Profile_list(
              icon: "assets/icon/store.svg",
              name: "Alamat",
              route: Alamat(),
              context: context),
          Profile_list(
              icon: "assets/icon/other.svg",
              name: "Lainnya",
              route: Home(),
              context: context),
        ],
      ),
    );
  }
}

Widget Profile_list(
    {required String icon,
    required String name,
    required Widget route,
    required BuildContext context}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return route;
        },
      ));
    },
    child: Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                width: 24,
              ),
              SizedBox(
                width: 13,
              ),
              Text(
                name,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        )
      ],
    ),
  );
}
