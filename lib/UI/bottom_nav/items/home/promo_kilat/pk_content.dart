import 'package:flutter/material.dart';
import 'package:kangsayur/UI/bottom_nav/items/home/promo_list.dart';

class Pk_content extends StatefulWidget {
  const Pk_content({Key? key}) : super(key: key);

  @override
  State<Pk_content> createState() => _Pk_contentState();
}

class _Pk_contentState extends State<Pk_content> with TickerProviderStateMixin {
  @override
  TabController _tabController =
      TabController(length: 3, vsync: _Pk_contentState());

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TabBar(
              controller: _tabController,
              tabs: [
            Tab(text: "Cek",),
            Tab(text: "Cek2",)
          ]),
          Container(
            child: TabBarView(
              controller: _tabController,
              children: [
                Text('asds'),
                Text('asds'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
