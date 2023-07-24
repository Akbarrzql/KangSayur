import 'package:flutter/material.dart';


class CobaPage extends StatefulWidget {
  @override
  _CobaPageState createState() => _CobaPageState();
}

class _CobaPageState extends State<CobaPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // Change the length to the number of tabs you want
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBarView Example'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Tab 1'),
            Tab(text: 'Tab 2'),
            Tab(text: 'Tab 3'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Add the content for each tab here
          ListView.builder(itemCount: 5, itemBuilder: (context, index) {

            return Container(height: 200, width: 300, color: Colors.red, margin: EdgeInsets.only(bottom: 20), child: Text('Tab 1 content'),);
          },),
          Center(child: Text('Tab 2 content')),
          Center(child: Text('Tab 3 content')),
        ],
      ),
    );
  }
}
