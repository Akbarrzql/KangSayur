import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:flutter/material.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/profile_head.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/profile_two.dart';
import 'package:kangsayur/common/color_value.dart';

import 'UI/seller_detail/tabbar/items/seller_beranda.dart';
import 'UI/seller_detail/tabbar/items/seller_produk.dart';
import 'UI/seller_detail/tabbar/items/seller_tentang.dart';

class Tabbartest extends StatefulWidget {
  const Tabbartest({Key? key}) : super(key: key);

  @override
  State<Tabbartest> createState() => _TabbartestState();
}

class _TabbartestState extends State<Tabbartest> {
  late ScrollController _scrollController;
  bool _isAppBarExpanded = true;
  double _appBarOpacity = 1.0;
  Color _appBarColor = Colors.white;


  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _handleScroll() {
    setState(() {
      if (_scrollController.offset > 100) {
        _isAppBarExpanded = false;
        _appBarColor = Colors.transparent; // Set opacity value as per your preference
      } else {
        _isAppBarExpanded = true;
        _appBarColor = Colors.white;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4, // Jumlah tab
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverAppBar(
              elevation: 0,
              backgroundColor:
              _isAppBarExpanded ? Colors.transparent : Colors.white,
              flexibleSpace: FlexibleSpaceBar(),
              pinned: true, // Tetap berada di atas saat digulir
              snap: true,
              floating: true,
              title: Text('Judul Aplikasi', style: TextStyle(
                color: _isAppBarExpanded ? Colors.transparent : ColorValue.neutralColor,
              ),),
            ),
            SliverToBoxAdapter(
              child: Container(
                child: Column(
                  children: [
                    Profile_head(),
                    SizedBox(
                      height: 21,
                    ),
                    Profile_two()
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                TabBar(
                  tabs: [
                    Tab(
                      child: Text(
                        "Beranda",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Produk",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Katalog",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Tentang",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
              pinned: true,
            ),
            SliverToBoxAdapter(
              child: Container(
                child: AutoScaleTabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    //make tabbar view for first tab
                    Seller_beranda(),
                    Seller_produk(),
                    //make tabbar view for third tab
                    Container(
                      child: Center(
                        child: Text("Katalog"),
                      ),
                    ),
                    Seller_tentang()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}