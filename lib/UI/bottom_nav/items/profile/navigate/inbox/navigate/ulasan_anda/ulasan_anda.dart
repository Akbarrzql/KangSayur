import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/inbox/navigate/ulasan_anda/menunggu_diulas.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/inbox/navigate/ulasan_anda/riwayat.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/riwayat_pembelian/riwayat_transaksi.dart';
import 'package:kangsayur/bloc/historyreview_bloc/historyreview_bloc.dart';
import 'package:kangsayur/bloc/menuunggudiulas_bloc/menunggudiulas_bloc.dart';
import 'package:kangsayur/model/historyreviewmodel.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../../../bloc/historyreview_bloc/historyreview_event.dart';
import '../../../../../../../../bloc/historyreview_bloc/historyreview_states.dart';
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
  HistoryReviewBloc historyReviewBloc = HistoryReviewBloc();
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    //bloc
    menungguDiulasBloc.add(GetMenungguDiulasList());
    historyReviewBloc.add(GetHistoryReviewList());
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
                        return _menungguDiulasListLoading();
                      } else if (state is MenungguDiulasLoaded) {
                        return Menunggu_diulas(
                          menungguDiulasModel: state.menungguDiulas,
                        );
                      } else if (state is MenungguDiulasError) {
                        return _menungguDiulasListLoading();
                      } else {
                        return _menungguDiulasListLoading();
                      }
                    },
                  ),
                  // Widget konten untuk Tab 2
                  BlocBuilder<HistoryReviewBloc, HistoryReviewState>(
                    bloc: historyReviewBloc,
                    builder: (context, state) {
                      if (state is HistoryReviewLoading) {
                        return _riwayatDiulasListLoading();
                      } else if (state is HistoryReviewLoaded) {
                        return Riwayat_ulasan(
                          historyReviewModel: state.history,
                        );
                      } else if (state is HistoryReviewError) {
                        return _riwayatDiulasListLoading();
                      } else {
                        return _riwayatDiulasListLoading();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menungguDiulasListLoading() {
    return ListView.builder(
      itemCount: 5,
      padding: EdgeInsets.only(top: 20),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 24, vertical:8 ),
          height: 123,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: ColorValue.blackColor.withOpacity(0.25),
                blurRadius: 4,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  margin: EdgeInsets.only(left: 15),
                  height: 75,
                  width: 75,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.grey[300]!,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                height: 75,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey[300],
                        ),
                        child: Text(
                          "Nama Produk",
                          style: TextStyle(
                              color: ColorValue.blackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey[300],
                        ),
                        child: Text(
                          "Nama Produk",
                          style: TextStyle(
                              color: ColorValue.blackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Spacer(),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 30,
                        width: 102,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey[300],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _riwayatDiulasListLoading() {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.white,
          child: Column(
            children: [
              //make divider with color hinttext
              Divider(
                color: ColorValue.hinttext,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              clipBehavior: Clip.hardEdge,
                              height: 61,
                              width: 61,
                              decoration: BoxDecoration(
                                color: Colors.grey[300]!,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey[300],
                                ),
                                child: Text(
                                  "Nama Produk",
                                  style: TextStyle(
                                    color: ColorValue.neutralColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: RatingBar.builder(
                                      initialRating: 5,
                                      direction: Axis.horizontal,
                                      itemCount: 5,
                                      itemSize: 18,
                                      itemPadding:
                                          const EdgeInsets.only(right: 2.5),
                                      itemBuilder: (context, _) =>
                                          SvgPicture.asset(
                                        "assets/icon/star.svg",
                                        color: Colors.grey[300]!,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  //make small circle 6x6 with color 0xffd9d9d9
                                  Container(
                                    height: 6,
                                    width: 6,
                                    decoration: BoxDecoration(
                                      color: Color(0xffD9D9D9),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.grey[300],
                                      ),
                                      child: Text(
                                        "tanggal",
                                        style: TextStyle(
                                          color: ColorValue.hinttext,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //text review with color black and size 14 weight 400
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey[300],
                          ),
                          child: Text(
                            "Review",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      //make text : 1 balasan dari penjual with color hinttext and size 12 weight 600
                      //make if balas true return text
                      Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey[300],
                              ),
                              child: Text(
                                "2 balasan dari penjual",
                                style: TextStyle(
                                  color: ColorValue.hinttext,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
              Divider(
                color: ColorValue.hinttext,
              ),
            ],
          ),
        );
        ;
      },
    );
  }
}
