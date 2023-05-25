import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kangsayur/UI/bottom_nav/items/home/promo_kilat/items/pk_bahan_pokok.dart';
import 'package:kangsayur/UI/bottom_nav/items/home/promo_kilat/items/pk_buah.dart';
import 'package:kangsayur/UI/bottom_nav/items/home/promo_kilat/items/pk_daging.dart';
import 'package:kangsayur/UI/bottom_nav/items/home/promo_kilat/items/pk_sayuran.dart';
import 'package:kangsayur/UI/bottom_nav/items/home/promo_kilat/items/pk_telur.dart';
import 'package:kangsayur/UI/bottom_nav/items/home/promo_kilat/items/pk_unggas.dart';
import 'package:kangsayur/UI/bottom_nav/items/home/promo_list.dart';

class Pk_content extends StatefulWidget {
  const Pk_content({Key? key}) : super(key: key);

  @override
  State<Pk_content> createState() => _Pk_contentState();
}

class _Pk_contentState extends State<Pk_content>
    with SingleTickerProviderStateMixin {
  @override
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 6, vsync: this); // Ganti 2 dengan jumlah tab yang Anda inginkan
    _tabController.addListener(_handleTabSelection);

  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {
    });
  }

  Color _activeIndicatorColor = Color(0xffEE6C4D);

  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 24,),

                  TabBar(
                    onTap: (index) {
                      setState(() {
                        _tabController.index = index;
                      });
                    },
                      isScrollable: true,
                      controller: _tabController,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelPadding: EdgeInsets.only(right: 10),
                      indicator: BoxDecoration(
                        color: Colors.transparent
                      ),
                      tabs: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: _tabController.index == 0
                                  ? _activeIndicatorColor
                                  : Color(0xffF2F2F2)),
                          child: Center(
                            child: Text(
                              "Bahan Pokok",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: _tabController.index == 0
                                      ? Colors.white
                                      : Color(0xffEE6C4D)
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: _tabController.index == 1
                                  ? _activeIndicatorColor
                                  : Color(0xffF2F2F2)),
                          child: Center(
                            child: Text(
                              "Sayuran",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: _tabController.index == 1
                                      ? Colors.white
                                      : Color(0xffEE6C4D)
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: _tabController.index == 2
                                  ? _activeIndicatorColor
                                  : Color(0xffF2F2F2)),
                          child: Center(
                            child: Text(
                              "Buah-Buahan",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: _tabController.index == 2
                                      ? Colors.white
                                      : Color(0xffEE6C4D)
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: _tabController.index == 3
                                  ? _activeIndicatorColor
                                  : Color(0xffF2F2F2)),
                          child: Center(
                            child: Text(
                              "Daging",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: _tabController.index == 3
                                      ? Colors.white
                                      : Color(0xffEE6C4D)
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: _tabController.index == 4
                                  ? _activeIndicatorColor
                                  : Color(0xffF2F2F2)),
                          child: Center(
                            child: Text(
                              "Unggas",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: _tabController.index == 4
                                      ? Colors.white
                                      : Color(0xffEE6C4D)
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: _tabController.index == 5
                                  ? _activeIndicatorColor
                                  : Color(0xffF2F2F2)),
                          child: Center(
                            child: Text(
                              "Telur",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: _tabController.index == 5
                                      ? Colors.white
                                      : Color(0xffEE6C4D)
                              ),
                            ),
                          ),
                        ),
                      ]),
                ],
              ),
            ),
            Container(
              child: AutoScaleTabBarView(
                controller: _tabController,
                children: [
                  Pk_bahan_pokok(),
                  Pk_sayuran(),
                  Pk_buah(),
                  //call pk daging, unggas, telur
                  Pk_daging(),
                  Pk_telur(),
                  Pk_unggas()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
