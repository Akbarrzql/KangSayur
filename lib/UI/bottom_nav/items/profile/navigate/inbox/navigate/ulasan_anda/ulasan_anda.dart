import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/inbox/navigate/ulasan_anda/menunggu_diulas.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/inbox/navigate/ulasan_anda/riwayat.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/riwayat_pembelian/riwayat_pembelian.dart';
import 'package:kangsayur/bloc/menuunggudiulas_bloc/menunggudiulas_bloc.dart';

import '../../../../../../../../bloc/menuunggudiulas_bloc/menunggudiulas_event.dart';
import '../../../../../../../../bloc/menuunggudiulas_bloc/menunggudiulas_state.dart';
import '../../../../../../../../common/color_value.dart';

class Ulasan_anda extends StatefulWidget {
  const Ulasan_anda({Key? key}) : super(key: key);

  @override
  State<Ulasan_anda> createState() => _Ulasan_andaState();
}

class _Ulasan_andaState extends State<Ulasan_anda>
    with SingleTickerProviderStateMixin {
  //call bloc menunggu diulas
  MenungguDiulasBloc menungguDiulasBloc = MenungguDiulasBloc();
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    //bloc
    menungguDiulasBloc.add(GetMenungguDiulasList());
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
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
          "Ulasan Anda",
          style: TextStyle(color: ColorValue.neutralColor, fontSize: 16),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset("assets/icon/arrow_left.svg"),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 50, // Ubah tinggi sesuai kebutuhan Anda
              child: AppBar(
                elevation: 0,
                // Menghilangkan bayangan di bawah AppBar
                backgroundColor: Colors.white,
                // Menghilangkan background AppBar
                flexibleSpace: TabBar(
                  unselectedLabelColor: ColorValue.neutralColor,
                  // Warna teks tab yang tidak aktif
                  labelColor: ColorValue.primaryColor,
                  // Warna teks tab yang aktif
                  controller: _tabController,
                  tabs: const [
                    Tab(text: 'Menunggu Diulas'),
                    Tab(text: 'Riwayat'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Widget konten untuk Tab 1
                  //Bloc
                  BlocBuilder<MenungguDiulasBloc, MenungguDiulasState>(
                    bloc: menungguDiulasBloc,
                    builder: (context, state) {
                      if (state is MenungguDiulasLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is MenungguDiulasLoaded) {
                        return                   Menunggu_diulas(
                          menungguDiulasModel: state.menungguDiulas,

                        );
                      } else if (state is MenungguDiulasError) {
                        return Container();
                      } else {
                        return Center(
                          child: Text(""),
                        );
                      }
                    },
                  ),
                  // Widget konten untuk Tab 2
                  Riwayat_ulasan()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
