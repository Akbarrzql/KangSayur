import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/riwayat_pembelian/detaiL_riwayat_pembelian/detail_riwayat_pembelian.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/profile_head.dart';
import 'package:kangsayur/UI/detail/detail.dart';
import 'package:kangsayur/bloc/statuspesanan_bloc/statuspesanan_bloc.dart';
import 'package:kangsayur/bloc/statuspesanan_bloc/statuspesanan_event.dart';
import 'package:kangsayur/bloc/statuspesanan_bloc/statuspesanan_state.dart';
import 'package:kangsayur/model/statuspesanandikemas.dart';
import 'package:kangsayur/model/statuspesananselesaiselesai.dart';
import 'package:kangsayur/widget/card_riwayat.dart';

import '../../../../../../common/color_value.dart';
import '../../../home/home.dart';

class Riwayat_transaksi extends StatefulWidget {
  const Riwayat_transaksi({Key? key}) : super(key: key);

  @override
  State<Riwayat_transaksi> createState() => _Riwayat_transaksiState();
}

class _Riwayat_transaksiState extends State<Riwayat_transaksi>
    with SingleTickerProviderStateMixin {
  final StatusPesananBloc _statusPesananBloc = StatusPesananBloc();
  final StatusPesananBloc _statusPesananBlocSelesai = StatusPesananBloc();
  String dropdownValueStatus = 'Semua Status';
  String dropdownValueTanggal = 'Semua Tanggal';
  late TabController _tabController;

  @override
  void initState() {
    _statusPesananBloc.add(GetStatusPesananAllList());
    _statusPesananBlocSelesai.add(GetStatusPesananSelesaiList());
    _tabController = TabController(
        length: 4,
        vsync: this); // Change the length to the number of tabs you want
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
        bottom: TabBar(
          labelColor: ColorValue.primaryColor,
          unselectedLabelColor:
              ColorValue.neutralColor, // Warna teks tab yang tidak dipilih

          controller: _tabController,
          tabs: [
            Tab(
              text: 'Dikemas',
            ),
            Tab(text: 'Tab 2'),
            Tab(text: 'Tab 3'),
            Tab(text: 'Selesai'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Add the content for each tab here
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
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
                        SvgPicture.asset(
                          "assets/icon/payment_card.svg",
                          height: 24.0,
                          width: 24.0,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          "Menunggu Status Pembayaran",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    child: BlocProvider(
                      create: (_) => _statusPesananBloc,
                      child: BlocListener<StatusPesananBloc,
                          StatusPesananState>(listener: (context, state) {
                        if (state is StatusPesananError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.message),
                            ),
                          );
                        }
                      }, child:
                          BlocBuilder<StatusPesananBloc, StatusPesananState>(
                              builder: (context, state) {
                        if (state is StatusPesananInitial) {
                          return Loading();
                        } else if (state is StatusPesananLoading) {
                          return Loading();
                        } else if (state is StatusPesananLoaded) {
                          return status_SemuaPesanan(
                              state.menungguKonfirmasiList);
                        } else if (state is StatusPesananError) {
                          return Text(state.message);
                        }
                        return Container();
                      })),
                    ),
                  )
                ],
              ),
            ),
          ),
          Center(child: Text('Tab 2 content')),
          Center(child: Text('Tab 3 content')),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
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
                        SvgPicture.asset(
                          "assets/icon/payment_card.svg",
                          height: 24.0,
                          width: 24.0,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          "Menunggu Status Pembayaran",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    child: BlocProvider(
                      create: (_) => _statusPesananBlocSelesai,
                      child: BlocListener<StatusPesananBloc,
                          StatusPesananState>(listener: (context, state) {
                        if (state is StatusPesananError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.message),
                            ),
                          );
                        }
                      }, child:
                          BlocBuilder<StatusPesananBloc, StatusPesananState>(
                              builder: (context, state) {
                        if (state is StatusPesananInitial) {
                          return Loading();
                        } else if (state is StatusPesananLoading) {
                          return Loading();
                        } else if (state is StatusPesananLoaded) {
                          return status_Selesai(state.seleseiList);
                        } else if (state is StatusPesananError) {
                          return Text(state.message);
                        }
                        return Container();
                      })),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
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
      items: <String>['Semua Status', 'Disiapkan', 'Dikirim', 'Selesai']
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

  Widget status_SemuaPesanan(StatusPesananAllModel data) {
    return ListView.builder(
      itemCount: data.data!.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, i) {
        return CardRiwayat(
          jenisVerifikasiProduk: data.data[i].namaToko.toString(),
          tanggalVerifikasiProduk: data.data[i].tanggal,
          namaVerifikasiProduk: data.data[i].barangPesanan[0].namaProduk,
          descVerifikasiProduk: data.data[i].barangPesanan[0].variant,
          gambarVerifikasiProduk: 'assets/images/wortel.png',
          statusVerifikasiProduk:
              data.data[i].barangPesanan[0].status.toString(),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Detail_Riwayat_Pembelian(
                  Status: data.data[i].barangPesanan[0].status,
                  Nama: data.data[i].alamatPengiriman.namaPemesan,
                  AlamatUser: "asdasdsdadsasadasd",
                  NoHP: "123018308132",
                  GambarProduk: [
                    for (int j = 0; j < data.data[i].barangPesanan.length; j++)
                      data.data[i].barangPesanan[j].variantImg
                  ],
                  GambarToko: data.data[i].profilToko,
                  HargaProduk: [
                    for (int j = 0; j < data.data[i].barangPesanan.length; j++)
                      data.data[i].barangPesanan[j].hargaVariant
                  ],
                  NamaProduk: [
                    for (int j = 0; j < data.data[i].barangPesanan.length; j++)
                      data.data[i].barangPesanan[j].namaProduk
                  ],
                  AlamatToko: data.data[i].alamatToko,
                  NamaToko: data.data[i].namaToko,
                  TotalHarga: data.data[i].tagihan.totalHarga,
                  VarianProduk: [
                    for (int j = 0; j < data.data[i].barangPesanan.length; j++)
                      data.data[i].barangPesanan[j].variant
                  ],
                  Ongkir: data.data[i].tagihan.ongkosKirim,
                  produkId: [
                    for (int j = 0; j < data.data[i].barangPesanan.length; j++)
                      data.data[i].barangPesanan[j].id
                  ],
                  tokoId: data.data[i].tokoId.toString(),
                  variantId: [
                    for (int j = 0; j < data.data[i].barangPesanan.length; j++)
                      data.data[i].barangPesanan[j].variantId
                  ],
                  transactionCode: data.data[i].kodeTransaksi.toString(),
                ),
              ),
            );
          },
          banyakVerifikasiProduk: [
            for (int j = 0; j < data.data[i].barangPesanan.length; j++)
              data.data[i].barangPesanan[j].variant
          ],
        );
      },
    );
  }

  Widget status_Selesai(StatusPesananSelesaiModel data) {
    return ListView.builder(
      itemCount: data.data!.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, i) {
        return CardRiwayat(
          jenisVerifikasiProduk: data.data[i].namaToko.toString(),
          tanggalVerifikasiProduk: data.data[i].tanggal,
          namaVerifikasiProduk: data.data[i].barangPesanan[0].namaProduk,
          descVerifikasiProduk: data.data[i].barangPesanan[0].variant,
          gambarVerifikasiProduk: 'assets/images/wortel.png',
          statusVerifikasiProduk:
              data.data[i].barangPesanan[0].status.toString(),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Detail_Riwayat_Pembelian(
                  Status: data.data[i].barangPesanan[0].status,
                  Nama: data.data[i].alamatPengiriman.namaPemesan,
                  AlamatUser: "asdasdsdadsasadasd",
                  NoHP: "123018308132",
                  GambarProduk: [
                    for (int j = 0; j < data.data[i].barangPesanan.length; j++)
                      data.data[i].barangPesanan[j].variantImg
                  ],
                  GambarToko: data.data[i].profilToko,
                  HargaProduk: [
                    for (int j = 0; j < data.data[i].barangPesanan.length; j++)
                      data.data[i].barangPesanan[j].hargaVariant
                  ],
                  NamaProduk: [
                    for (int j = 0; j < data.data[i].barangPesanan.length; j++)
                      data.data[i].barangPesanan[j].namaProduk
                  ],
                  AlamatToko: data.data[i].alamatToko,
                  NamaToko: data.data[i].namaToko,
                  TotalHarga: data.data[i].tagihan.totalHarga,
                  VarianProduk: [
                    for (int j = 0; j < data.data[i].barangPesanan.length; j++)
                      data.data[i].barangPesanan[j].variant
                  ],
                  Ongkir: data.data[i].tagihan.ongkosKirim,
                  produkId: [
                    for (int j = 0; j < data.data[i].barangPesanan.length; j++)
                      data.data[i].barangPesanan[j].id
                  ],
                  tokoId: data.data[i].tokoId.toString(),
                  variantId: [
                    for (int j = 0; j < data.data[i].barangPesanan.length; j++)
                      data.data[i].barangPesanan[j].variantId
                  ],
                  transactionCode: data.data[i].kodeTransaksi.toString(),

                ),
              ),
            );
          },
          banyakVerifikasiProduk: [
            for (int j = 0; j < data.data[i].barangPesanan.length; j++)
              data.data[i].barangPesanan[j].variant
          ],
        );
      },
    );
  }
}
