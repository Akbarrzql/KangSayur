import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kangsayur/UI/detail/detail.dart';
import 'package:kangsayur/widget/card_riwayat.dart';

import '../../../../../../common/color_value.dart';
import '../../../home/home.dart';

class Riwayat_transaksi extends StatefulWidget {
  const Riwayat_transaksi({Key? key}) : super(key: key);

  @override
  State<Riwayat_transaksi> createState() => _Riwayat_transaksiState();
}

class _Riwayat_transaksiState extends State<Riwayat_transaksi> {
  String dropdownValueStatus = 'Semua Status';
  String dropdownValueTanggal = 'Semua Tanggal';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Riwayat Transaksi",
          style: TextStyle(color: ColorValue.neutralColor, fontSize: 16),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset("assets/icon/arrow_left.svg"),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width / 2 - 24 - 10,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: ColorValue.neutralColor,
                        width: 1,
                      ),
                    ),
                    child: dropDown_Status(),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width / 2 - 24 - 10,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: ColorValue.neutralColor,
                        width: 1,
                      ),
                    ),
                    child: dropDown_Tanggal(),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                height: 52,
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: ColorValue.primaryColor,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/icon/payment_card.svg", height: 24, width: 24,),
                    SizedBox(width: 16,),
Text("Menunggu Status Pembayaran", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3  ,
                itemBuilder: (BuildContext context, int index) {
                  return CardRiwayat(
                    jenisVerifikasiProduk: 'Bahan Pokok',
                    tanggalVerifikasiProduk: '12/12/2021',
                    namaVerifikasiProduk: 'Wortel',
                    descVerifikasiProduk: 'Wortel segar dari kebun sayur',
                    gambarVerifikasiProduk: 'assets/images/wortel.png',
                    statusVerifikasiProduk: 'Selesai',
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Home(),
                        ),
                      );
                    },
                  );
                },
              )

            ],
          ),
        ),
      ),
    );
  }

  Widget dropDown_Status() {
    return DropdownButton<String>(
      value: dropdownValueStatus,
      icon: const Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      underline: Container(
        height: 0,
        color: Colors.transparent,
      ),
      style: Theme.of(context).textTheme.subtitle1!.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: ColorValue.neutralColor,
          ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValueStatus = newValue!;
        });
      },
      items: <String>['Semua Status', 'Sedang Dikirim', 'Selesai']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(fontSize: 14, color: Color(0xff49454F)),
            ));
      }).toList(),
    );
  }

  Widget dropDown_Tanggal() {
    return DropdownButton<String>(
      value: dropdownValueTanggal,
      icon: const Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      underline: Container(
        height: 0,
        color: Colors.transparent,
      ),
      style: Theme.of(context).textTheme.subtitle1!.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: ColorValue.neutralColor,
          ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValueTanggal = newValue!;
        });
      },
      items: <String>[
        'Semua Tanggal',
        'Hari ini',
        'Kemarin',
        '7 Hari Terakhir',
        '30 Hari Terakhir',
        'Bulan ini',
        'Bulan lalu',
        'Tahun ini',
        'Tahun lalu'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(fontSize: 14, color: Color(0xff49454F)),
            ));
      }).toList(),
    );
  }
}
