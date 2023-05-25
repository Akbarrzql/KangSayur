import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:flutter/material.dart';
import 'package:kangsayur/UI/seller_detail/seller_head.dart';
import 'package:kangsayur/UI/seller_detail/tabbar/items/seller_beranda.dart';
import 'package:sliver_header_delegate/sliver_header_delegate.dart';

import 'UI/seller_detail/tabbar/items/seller_produk.dart';
import 'common/color_value.dart';



class DetailDriver extends StatefulWidget {
  final String driverId;
  const DetailDriver({Key? key, required this.driverId}) : super(key: key);

  @override
  State<DetailDriver> createState() => _DetailDriverState();
}

class _DetailDriverState extends State<DetailDriver>
    with TickerProviderStateMixin {
  late ScrollController _scrollController;
  late TabController _tabController;

  final double _height = 150;
  bool _lastStatus = true;

  bool get _isShrink {
    return _scrollController != null &&
        _scrollController!.hasClients &&
        _scrollController!.offset > (_height - 1);
  }

  void _scrollListener() {
    if (_isShrink != _lastStatus) {
      setState(() {
        _lastStatus = _isShrink;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    _tabController.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, isScrolled) {
            return [
              SliverAppBar(
                elevation: 1,
                floating: false,
                pinned: true,
                snap: false,
                expandedHeight: _height,
                backgroundColor: Colors.white,
                title: _isShrink
                    ? Text(
                  "Charles Leclerc",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                )
                    : null,
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                      padding: const EdgeInsets.symmetric(),
                      child: Seller_head()),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate:
                  FlexibleHeaderDelegate(
                    children: [
                        TabBar(
                          controller: _tabController,
                          labelColor: ColorValue.primaryColor,
                          unselectedLabelColor: ColorValue.neutralColor,

                          indicator:  UnderlineTabIndicator(
                            borderSide:
                            BorderSide(width: 2, color: ColorValue.primaryColor),
                          ),
                          tabs: const [
                            Text("ASd"),
                            Text("dds")
                          ],
                        ),
                    ]
                  )
              ),
            ];
          },
          body: Expanded(
            child: AutoScaleTabBarView(
              controller: _tabController,
              children: [
                Seller_beranda(),
                Seller_produk()
              ],
            ),
          ),
        ));
  }
}