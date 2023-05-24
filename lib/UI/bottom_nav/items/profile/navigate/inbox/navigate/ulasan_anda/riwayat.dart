import 'package:flutter/material.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/inbox/navigate/ulasan_anda/detail_ulasan/detail_ulasan.dart';
import 'package:kangsayur/widget/list_riwayat_ulasan.dart';

class Riwayat_ulasan extends StatefulWidget {
  const Riwayat_ulasan({Key? key}) : super(key: key);

  @override
  State<Riwayat_ulasan> createState() => _Riwayat_ulasanState();
}

class _Riwayat_ulasanState extends State<Riwayat_ulasan> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              // make 2 container with same width which is mediaquery/2-24-10 and the child text : Terbaru and Tertua text color is 0xff49454F and outline is 0xff79747E the text is w500 height 33
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width / 2 - 24 - 10,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Color(0xff79747E),
                    width: 1,
                  ),
                ),
                child: Text(
                  "Terbaru",
                  style: TextStyle(
                    color: Color(0xff49454F),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Spacer(),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width / 2 - 24 - 10,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Color(0xff79747E),
                    width: 1,
                  ),
                ),
                child: Text(
                  "Tertua",
                  style: TextStyle(
                    color: Color(0xff49454F),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        //make listview.builder with itemCount 3 and the inside call list_riwayat_review.dart
        Expanded(
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
padding: const EdgeInsets.only(bottom: 14),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Detail_ulasan()));
                  },
                  child: List_riwayatulasan(
                    gambar: "assets/images/wortel.png",
                    produk: "Sayur Bayam",
                    pcs: "1 pcs",
                    rating: 4,
                    tanggal: "12/12/2021",
                    ulasan: "Sayur bayamnya segar dan enak",
                    balas: true,
                    banyak_balas: 2,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

