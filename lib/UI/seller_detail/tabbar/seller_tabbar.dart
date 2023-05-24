import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:flutter/material.dart';
import 'package:kangsayur/UI/seller_detail/tabbar/items/seller_beranda.dart';
import 'package:kangsayur/UI/seller_detail/tabbar/items/seller_produk.dart';
import 'package:kangsayur/UI/seller_detail/tabbar/items/seller_tentang.dart';
import 'package:kangsayur/common/color_value.dart';

class Seller_tabbar extends StatefulWidget {
  const Seller_tabbar({Key? key}) : super(key: key);

  @override
  State<Seller_tabbar> createState() => _Seller_tabbarState();
}

class _Seller_tabbarState extends State<Seller_tabbar> with SingleTickerProviderStateMixin{
  //make controller for tabbar
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //make Tabbar without appbar
        Container(
          color: Color(0xffF6F6F6),
          child: TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: ColorValue.quaternaryColor,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              //make 4 tabs beranda, produk, ulasan, tentang
              Tab(
                child: Text("Beranda", style: TextStyle(fontSize: 14),),
              ),
              Tab(
                child: Text("Produk", style: TextStyle(fontSize: 14),),
              ),
              Tab(
                child: Text("Katalog", style: TextStyle(fontSize: 14),),
              ),
              Tab(
                child: Text("Tentang", style: TextStyle(fontSize: 14),),
              ),

            ],
          ),
        ),
        //make tabbar view
        Container(
          child: AutoScaleTabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              //make tabbar view for first tab
              Seller_beranda(),
              Seller_produk(),
              //make tabbar view for third tab
              Container(
                child: Center(
                  child: Text("Ulasan"),
                ),
              ),
              Seller_tentang()
            ],
          ),
        ),
      ],
    );
  }
}


