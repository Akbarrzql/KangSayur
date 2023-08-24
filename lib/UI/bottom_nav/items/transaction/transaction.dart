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
import 'package:kangsayur/model/statuspesanandiantarmodel.dart';
import 'package:kangsayur/model/statuspesanandikemas.dart';
import 'package:kangsayur/model/statuspesanandisiapkanmodel.dart';
import 'package:kangsayur/model/statuspesananselesaiselesai.dart';
import 'package:kangsayur/widget/card_riwayat.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../common/color_value.dart';

class Transaction extends StatefulWidget {
  const Transaction({Key? key}) : super(key: key);

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction>
    with SingleTickerProviderStateMixin {
  final StatusPesananBloc _statusPesananBloc = StatusPesananBloc();
  final StatusPesananBloc _statusPesananBlocDikemas = StatusPesananBloc();
  final StatusPesananBloc _statusPesananBlocDiantar = StatusPesananBloc();
  final StatusPesananBloc _statusPesananBlocSelesai = StatusPesananBloc();
  late TabController _tabController;

  @override
  void initState() {
    _statusPesananBloc.add(GetStatusPesananKonfirmasiList());
    _statusPesananBlocDikemas.add(GetStatusPesananDisiapkanList());
    _statusPesananBlocDiantar.add(GetStatusPesananDiantarList());
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
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: kToolbarHeight,
              color: Colors.white,
              child: TabBar(
                isScrollable: true,
                labelColor: ColorValue.primaryColor,
                unselectedLabelColor: ColorValue.neutralColor,
                // Warna teks tab yang tidak dipilih
                controller: _tabController,
                tabs: [
                  Tab(
                    text: 'Konfirmasi',
                  ),
                  Tab(text: 'Disiapkan'),
                  Tab(text: 'Diantar'),
                  Tab(text: 'Selesai'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
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
                            height: 16,
                          ),
                          Container(
                            child: BlocProvider(
                              create: (_) => _statusPesananBloc,
                              child: BlocListener<StatusPesananBloc,
                                  StatusPesananState>(
                                  listener: (context, state) {
                                    if (state is StatusPesananError) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(state.message),
                                        ),
                                      );
                                    }
                                  }, child: BlocBuilder<StatusPesananBloc,
                                  StatusPesananState>(
                                  builder: (context, state) {
                                    if (state is StatusPesananInitial) {
                                      return loading_status();
                                    } else if (state is StatusPesananLoading) {
                                      return loading_status();
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
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          Container(
                            child: BlocProvider(
                              create: (_) => _statusPesananBlocDikemas,
                              child: BlocListener<StatusPesananBloc,
                                  StatusPesananState>(
                                  listener: (context, state) {
                                    if (state is StatusPesananError) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(state.message),
                                        ),
                                      );
                                    }
                                  }, child: BlocBuilder<StatusPesananBloc,
                                  StatusPesananState>(
                                  builder: (context, state) {
                                    if (state is StatusPesananInitial) {
                                      return loading_status();
                                    } else if (state is StatusPesananLoading) {
                                      return loading_status();
                                    } else if (state is StatusPesananLoaded) {
                                      return status_Disiapkan(
                                          state.seleseiList);
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
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          Container(
                            child: BlocProvider(
                              create: (_) => _statusPesananBlocDiantar,
                              child: BlocListener<StatusPesananBloc,
                                  StatusPesananState>(
                                  listener: (context, state) {
                                    if (state is StatusPesananError) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(state.message),
                                        ),
                                      );
                                    }
                                  }, child: BlocBuilder<StatusPesananBloc,
                                  StatusPesananState>(
                                  builder: (context, state) {
                                    if (state is StatusPesananInitial) {
                                      return loading_status();
                                    } else if (state is StatusPesananLoading) {
                                      return loading_status();
                                    } else if (state is StatusPesananLoaded) {
                                      return status_Diantar(state.diantarList);
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
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          Container(
                            child: BlocProvider(
                              create: (_) => _statusPesananBlocSelesai,
                              child: BlocListener<StatusPesananBloc,
                                  StatusPesananState>(
                                  listener: (context, state) {
                                    if (state is StatusPesananError) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(state.message),
                                        ),
                                      );
                                    }
                                  }, child: BlocBuilder<StatusPesananBloc,
                                  StatusPesananState>(
                                  builder: (context, state) {
                                    if (state is StatusPesananInitial) {
                                      return loading_status();
                                    } else if (state is StatusPesananLoading) {
                                      return loading_status();
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
            ),
          ],
        ),
      ),
    );
  }

  // Widget dropDown_Status() {
  //   return DropdownButton<String>(
  //     value: dropdownValueStatus,
  //     icon:  Icon(Icons.arrow_drop_down),
  //     iconSize: 24,
  //     elevation: 16,
  //     underline: Container(
  //       height: 0,
  //       color: Colors.transparent,
  //     ),
  //     style: Theme.of(context).textTheme.subtitle1!.copyWith(
  //           fontWeight: FontWeight.w400,
  //           fontSize: 16,
  //           color: ColorValue.neutralColor,
  //         ),
  //     onChanged: (String? newValue) {
  //       setState(() {
  //         dropdownValueStatus = newValue!;
  //       });
  //     },
  //     items: <String>['Semua Status', 'Disiapkan', 'Dikirim', 'Selesai']
  //         .map<DropdownMenuItem<String>>((String value) {
  //       return DropdownMenuItem<String>(
  //           value: value,
  //           child: Text(
  //             value,
  //             style: TextStyle(fontSize: 14, color: Color(0xff49454F)),
  //           ));
  //     }).toList(),
  //   );
  // }

  // Widget dropDown_Tanggal() {
  //   return DropdownButton<String>(
  //     value: dropdownValueTanggal,
  //     icon: const Icon(Icons.arrow_drop_down),
  //     iconSize: 24,
  //     elevation: 16,
  //     underline: Container(
  //       height: 0,
  //       color: Colors.transparent,
  //     ),
  //     style: Theme.of(context).textTheme.subtitle1!.copyWith(
  //           fontWeight: FontWeight.w400,
  //           fontSize: 16,
  //           color: ColorValue.neutralColor,
  //         ),
  //     onChanged: (String? newValue) {
  //       setState(() {
  //         dropdownValueTanggal = newValue!;
  //       });
  //     },
  //     items: <String>[
  //       'Semua Tanggal',
  //       'Hari ini',
  //       'Kemarin',
  //       '7 Hari Terakhir',
  //       '30 Hari Terakhir',
  //       'Bulan ini',
  //       'Bulan lalu',
  //       'Tahun ini',
  //       'Tahun lalu'
  //     ].map<DropdownMenuItem<String>>((String value) {
  //       return DropdownMenuItem<String>(
  //           value: value,
  //           child: Text(
  //             value,
  //             style: TextStyle(fontSize: 14, color: Color(0xff49454F)),
  //           ));
  //     }).toList(),
  //   );
  // }

  Widget status_SemuaPesanan(StatusPesananDikemasModel data) {
    if (data.data!.isEmpty)
      return Container(
        height: MediaQuery
            .of(context)
            .size
            .height * 0.5,
        child: Column(
          children: [
            Spacer(),
            LottieBuilder.asset(
              'assets/icon/lottie/confirmstatus.json',
            ),
            Center(
              child: Text(
                "Tidak ada pesanan",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ColorValue.neutralColor,
                ),
              ),
            ),
          ],
        ),
      );
    else
      return ListView.builder(
        itemCount: data.data!.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, i) {
          return CardRiwayat(
            jenisVerifikasiProduk: data.data[i].namaToko.toString(),
            tanggalVerifikasiProduk: data.data[i].tanggal.toString(),
            namaVerifikasiProduk: data.data[i].barangPesanan[0].namaProduk,
            descVerifikasiProduk: data.data[i].barangPesanan[0].variant,
            gambarVerifikasiProduk: data.data[i].barangPesanan[0].variantImg,
            statusVerifikasiProduk:
            data.data[i].barangPesanan[0].status.toString(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      Detail_Riwayat_Pembelian(
                        idDriver: 0,
                        photoKendaraan: "",
                        photorDriver: "",
                        platKendaraan: "",
                        nameKendaraan: "",
                        namaDriver: "",
                        StatusDiulas: [],
                        banyakBarang: [
                          for (int j = 0;
                          j < data.data[i].barangPesanan.length;
                          j++)
                            data.data[i].barangPesanan[j].jumlahPembelian
                        ],
                        latitude: 0,
                        longitude: 0,
                        Status: data.data[i].barangPesanan[0].status,
                        Nama: data.data[i].alamatPengiriman.namaPemesan,
                        AlamatUser: data.data[i].alamatPengiriman.alamat,
                        NoHP: data.data[i].alamatPengiriman.nomorTelfon.toString(),
                        GambarProduk: [
                          for (int j = 0;
                          j < data.data[i].barangPesanan.length;
                          j++)
                            data.data[i].barangPesanan[j].variantImg
                        ],
                        GambarToko: data.data[i].profilToko,
                        HargaProduk: [
                          for (int j = 0;
                          j < data.data[i].barangPesanan.length;
                          j++)
                            data.data[i].barangPesanan[j].hargaVariant
                        ],
                        NamaProduk: [
                          for (int j = 0;
                          j < data.data[i].barangPesanan.length;
                          j++)
                            data.data[i].barangPesanan[j].namaProduk
                        ],
                        AlamatToko: data.data[i].alamatToko,
                        NamaToko: data.data[i].namaToko,
                        TotalHarga: data.data[i].tagihan.totalHarga,
                        VarianProduk: [
                          for (int j = 0;
                          j < data.data[i].barangPesanan.length;
                          j++)
                            data.data[i].barangPesanan[j].variant
                        ],
                        Ongkir: data.data[i].tagihan.ongkosKirim.toInt(),
                        produkId: [
                          for (int j = 0;
                          j < data.data[i].barangPesanan.length;
                          j++)
                            data.data[i].barangPesanan[j].id
                        ],
                        tokoId: data.data[i].tokoId.toString(),
                        variantId: [
                          for (int j = 0;
                          j < data.data[i].barangPesanan.length;
                          j++)
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

  Widget status_Disiapkan(StatusPesananDisiapkan data) {
    if (data.data!.isEmpty)
      return Container(
        height: MediaQuery
            .of(context)
            .size
            .height * 0.5,
        child: Column(
          children: [
            Spacer(),
            LottieBuilder.asset(
              'assets/icon/lottie/packingstatus.json',
              height: 250,
            ),
            Center(
              child: Text(
                "Tidak ada pesanan",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ColorValue.neutralColor,
                ),
              ),
            ),
          ],
        ),
      );
    else
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
            gambarVerifikasiProduk: data.data[i].barangPesanan[0].variantImg,
            statusVerifikasiProduk:
            data.data[i].barangPesanan[0].status.toString(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      Detail_Riwayat_Pembelian(
                        idDriver: 0,
                        photoKendaraan: "",
                        photorDriver: "",
                        platKendaraan: "",
                        nameKendaraan: "",
                        namaDriver: "",
                        StatusDiulas: [],
                        banyakBarang: [
                          for (int j = 0;
                          j < data.data[i].barangPesanan.length;
                          j++)
                            data.data[i].barangPesanan[j].jumlahPembelian
                        ],
                        latitude: 0,
                        longitude: 0,
                        Status: data.data[i].barangPesanan[0].status,
                        Nama: data.data[i].alamatPengiriman.namaPemesan,
                        AlamatUser: data.data[i].alamatPengiriman.alamat,
                        NoHP: data.data[i].alamatPengiriman.nomorTelfon.toString(),
                        GambarProduk: [
                          for (int j = 0;
                          j < data.data[i].barangPesanan.length;
                          j++)
                            data.data[i].barangPesanan[j].variantImg
                        ],
                        GambarToko: data.data[i].profilToko,
                        HargaProduk: [
                          for (int j = 0;
                          j < data.data[i].barangPesanan.length;
                          j++)
                            data.data[i].barangPesanan[j].hargaVariant
                        ],
                        NamaProduk: [
                          for (int j = 0;
                          j < data.data[i].barangPesanan.length;
                          j++)
                            data.data[i].barangPesanan[j].namaProduk
                        ],
                        AlamatToko: data.data[i].alamatToko,
                        NamaToko: data.data[i].namaToko,
                        TotalHarga: data.data[i].tagihan.totalHarga,
                        VarianProduk: [
                          for (int j = 0;
                          j < data.data[i].barangPesanan.length;
                          j++)
                            data.data[i].barangPesanan[j].variant
                        ],
                        Ongkir: data.data[i].tagihan.ongkosKirim.toInt(),
                        produkId: [
                          for (int j = 0;
                          j < data.data[i].barangPesanan.length;
                          j++)
                            data.data[i].barangPesanan[j].id
                        ],
                        tokoId: data.data[i].tokoId.toString(),
                        variantId: [
                          for (int j = 0;
                          j < data.data[i].barangPesanan.length;
                          j++)
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

  Widget status_Diantar(StatusPesananDiantarModel data) {
    if (data.data!.isEmpty)
      return Container(
        height: MediaQuery
            .of(context)
            .size
            .height * 0.5,
        child: Column(
          children: [
            Spacer(),
            LottieBuilder.asset(
              'assets/icon/lottie/deliverystatus.json',
              height: 250,
            ),
            Center(
              child: Text(
                "Tidak ada pesanan",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ColorValue.neutralColor,
                ),
              ),
            ),
          ],
        ),
      );
    else
      return ListView.builder(
        itemCount: data.data!.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, i) {
          return CardRiwayat(
            jenisVerifikasiProduk: data.data[i].namaToko.toString(),
            tanggalVerifikasiProduk: data.data[i].tanggal.toString(),
            namaVerifikasiProduk: data.data[i].barangPesanan[0].namaProduk,
            descVerifikasiProduk: data.data[i].barangPesanan[0].variant,
            gambarVerifikasiProduk: data.data[i].barangPesanan[0].variantImg,
            statusVerifikasiProduk:
            data.data[i].barangPesanan[0].status.toString(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      Detail_Riwayat_Pembelian(
                        idDriver: 0,
                        photoKendaraan: data.data[i].driver.photoKendaraan,
                        photorDriver: data.data[i].driver.fotoDriver,
                        platKendaraan: data.data[i].driver.platKendaraan,
                        nameKendaraan: data.data[i].driver.namaKendaraan,
                        namaDriver: data.data[i].driver.namaDriver,
                        StatusDiulas: [],
                        banyakBarang: [
                          for (int j = 0;
                          j < data.data[i].barangPesanan.length;
                          j++)
                            data.data[i].barangPesanan[j].jumlahPembelian
                        ],
                        latitude: data.data[i].alamatPengiriman.userLat,
                        longitude: data.data[i].alamatPengiriman.userLong,
                        Status: data.data[i].barangPesanan[0].status,
                        Nama: data.data[i].alamatPengiriman.namaPemesan,
                        AlamatUser: data.data[i].alamatPengiriman.alamat,
                        NoHP: data.data[i].alamatPengiriman.nomorTelfon.toString(),
                        GambarProduk: [
                          for (int j = 0;
                          j < data.data[i].barangPesanan.length;
                          j++)
                            data.data[i].barangPesanan[j].variantImg
                        ],
                        GambarToko: data.data[i].profilToko,
                        HargaProduk: [
                          for (int j = 0;
                          j < data.data[i].barangPesanan.length;
                          j++)
                            data.data[i].barangPesanan[j].hargaVariant
                        ],
                        NamaProduk: [
                          for (int j = 0;
                          j < data.data[i].barangPesanan.length;
                          j++)
                            data.data[i].barangPesanan[j].namaProduk
                        ],
                        AlamatToko: data.data[i].alamatToko,
                        NamaToko: data.data[i].namaToko,
                        TotalHarga: data.data[i].tagihan.totalHarga,
                        VarianProduk: [
                          for (int j = 0;
                          j < data.data[i].barangPesanan.length;
                          j++)
                            data.data[i].barangPesanan[j].variant
                        ],
                        Ongkir: data.data[i].tagihan.ongkosKirim.toInt(),
                        produkId: [
                          for (int j = 0;
                          j < data.data[i].barangPesanan.length;
                          j++)
                            data.data[i].barangPesanan[j].id
                        ],
                        tokoId: data.data[i].tokoId.toString(),
                        variantId: [
                          for (int j = 0;
                          j < data.data[i].barangPesanan.length;
                          j++)
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
    if (data.data!.isEmpty)
      return Container(
        height: MediaQuery
            .of(context)
            .size
            .height * 0.5,
        child: Column(
          children: [
            Spacer(),
            LottieBuilder.asset(
              'assets/icon/lottie/completestatus.json',
              height: 250,
            ),
            Center(
              child: Text(
                "Tidak ada pesanan",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ColorValue.neutralColor,
                ),
              ),
            ),
          ],
        ),
      );
    else
      return ListView.builder(
        itemCount: data.data!.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, i) {
          return CardRiwayat(
            jenisVerifikasiProduk: data.data[i].namaToko.toString(),
            tanggalVerifikasiProduk: data.data[i].tanggal.toString(),
            namaVerifikasiProduk:
            data.data[i].barangPesanan[0].namaProduk.toString(),
            descVerifikasiProduk:
            data.data[i].barangPesanan[0].variant.toString(),
            gambarVerifikasiProduk:
            data.data[i].barangPesanan[0].variantImg.toString(),
            statusVerifikasiProduk:
            data.data[i].barangPesanan[0].status.toString(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      Detail_Riwayat_Pembelian(
                        idDriver: 0,
                        photoKendaraan: "",
                        photorDriver: "",
                        platKendaraan: "",
                        nameKendaraan: "",
                        namaDriver: "",
                        StatusDiulas: [
                          for (int j = 0;
                          j < data.data[i].barangPesanan.length;
                          j++)
                            data.data[i].barangPesanan[j].statusDiulas
                        ],
                        banyakBarang: [
                          for (int j = 0;
                          j < data.data[i].barangPesanan.length;
                          j++)
                            data.data[i].barangPesanan[j].jumlahPembelian
                        ],
                        latitude: 0,
                        longitude: 0,
                        Status: data.data[i].barangPesanan[0].status.toString(),
                        Nama: data.data[i].alamatPengiriman.namaPemesan
                            .toString(),
                        AlamatUser: data.data[i].alamatPengiriman.alamat,
                        NoHP: data.data[i].alamatPengiriman.nomorTelfon.toString(),
                        GambarProduk: [
                          for (int j = 0;
                          j < data.data[i].barangPesanan.length;
                          j++)
                            data.data[i].barangPesanan[j].variantImg
                        ],
                        GambarToko: data.data[i].profilToko.toString(),
                        HargaProduk: [
                          for (int j = 0;
                          j < data.data[i].barangPesanan.length;
                          j++)
                            data.data[i].barangPesanan[j].hargaVariant
                        ],
                        NamaProduk: [
                          for (int j = 0;
                          j < data.data[i].barangPesanan.length;
                          j++)
                            data.data[i].barangPesanan[j].namaProduk
                        ],
                        AlamatToko: data.data[i].alamatToko.toString(),
                        NamaToko: data.data[i].namaToko.toString(),
                        TotalHarga: data.data[i].tagihan.totalHarga,
                        VarianProduk: [
                          for (int j = 0;
                          j < data.data[i].barangPesanan.length;
                          j++)
                            data.data[i].barangPesanan[j].variant
                        ],
                        Ongkir: data.data[i].tagihan.ongkosKirim.toInt(),
                        produkId: [
                          for (int j = 0;
                          j < data.data[i].barangPesanan.length;
                          j++)
                            data.data[i].barangPesanan[j].id
                        ],
                        tokoId: data.data[i].tokoId.toString(),
                        variantId: [
                          for (int j = 0;
                          j < data.data[i].barangPesanan.length;
                          j++)
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

  Widget loading_status() {
    return ListView.builder(
      itemCount: 3,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, i) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            margin: EdgeInsets.only(bottom: 5),
            color: Colors.grey[300],
            child: CardRiwayat(
              onPressed: () {},
              jenisVerifikasiProduk: 'asdasdasdasd',
              tanggalVerifikasiProduk: '12123123',
              namaVerifikasiProduk: 'asfasf',
              descVerifikasiProduk: 'jajang ajsdasfk',
              gambarVerifikasiProduk: '123123',
              statusVerifikasiProduk: 'afksfas',
              banyakVerifikasiProduk: ['asdasd'],
            ),
          ),
        );
      },
    );
  }
}
