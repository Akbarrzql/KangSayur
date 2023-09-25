import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kangsayur/API/chat/chat.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/profile_head.dart';
import 'package:kangsayur/UI/seller_detail/seller_twobox.dart';
import 'package:kangsayur/UI/seller_detail/tabbar/items/seller_beranda.dart';
import 'package:kangsayur/UI/seller_detail/tabbar/items/seller_tentang.dart';
import 'package:kangsayur/model/tokodetailmodel.dart';
import 'package:shimmer/shimmer.dart';
import '../../widget/card_product.dart';
import 'tabbar/items/Seller_katalog.dart';
import 'tabbar/items/seller_produk.dart';
import '../../bloc/tokodetail_bloc/tokodetail_bloc.dart';
import '../../bloc/tokodetail_bloc/tokodetail_event.dart';
import '../../bloc/tokodetail_bloc/tokodetail_state.dart';
import '../../common/color_value.dart';

class Seller_Detail extends StatefulWidget {
  String tokoId;

  Seller_Detail({Key? key, required this.tokoId}) : super(key: key);

  @override
  State<Seller_Detail> createState() => _Seller_DetailState();
}

class _Seller_DetailState extends State<Seller_Detail>
    with TickerProviderStateMixin {
  late ScrollController _scrollController;
  late TabController _tabController;
  final double _height = 300;

  //bloc
  final TokoDetailBloc _tokoDetailBloc = TokoDetailBloc();

  bool _lastStatus = true;

  bool get _isShrink {
    return _scrollController != null &&
        _scrollController!.hasClients &&
        _scrollController!.offset > (_height - kToolbarHeight - kToolbarHeight);
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
    _tokoDetailBloc.add(GetTokoDetailList(widget.tokoId));
    _scrollController = ScrollController()
      ..addListener(_scrollListener);
    _tabController = TabController(length: 3, vsync: this);
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
                elevation: 0,
                floating: false,
                pinned: true,
                snap: false,
                expandedHeight: 300 - kToolbarHeight,
                backgroundColor: Colors.white,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: _isShrink ? ColorValue.primaryColor : Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                title: BlocBuilder<TokoDetailBloc, TokoDetailState>(
                  bloc: _tokoDetailBloc,
                  builder: (context, state) {
                    if (state is TokoDetailInitial) {
                      return Container();
                    } else if (state is TokoDetailLoading) {
                      return Container();
                    } else if (state is TokoDetailLoaded) {
                      return _title(state.tokoDetailList);
                    } else if (state is TokoDetailError) {
                      return Center(
                        child: Text(state.message),
                      );
                    } else {
                      return Center(
                        child: Text(""),
                      );
                    }
                  },
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: SafeArea(
                    child: Column(
                      children: [
                        BlocBuilder<TokoDetailBloc, TokoDetailState>(
                          bloc: _tokoDetailBloc,
                          builder: (context, state) {
                            if (state is TokoDetailInitial) {
                              return _headLoading();
                            } else if (state is TokoDetailLoading) {
                              return _headLoading();
                            } else if (state is TokoDetailLoaded) {
                              return _head(state.tokoDetailList);
                            } else if (state is TokoDetailError) {
                              return Center(
                                child: Text(state.message),
                              );
                            } else {
                              return Center(
                                child: Text(""),
                              );
                            }
                          },
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        BlocBuilder<TokoDetailBloc, TokoDetailState>(
                          bloc: _tokoDetailBloc,
                          builder: (context, state) {
                            if (state is TokoDetailInitial) {
                              return Container();
                            } else if (state is TokoDetailLoading) {
                              return Container();
                            } else if (state is TokoDetailLoaded) {
                              return _Chat(state.tokoDetailList);
                            } else if (state is TokoDetailError) {
                              return Center(
                                child: Text(state.message),
                              );
                            } else {
                              return Center(
                                child: Text(""),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverAppBarDelegate(
                    TabBar(
                      controller: _tabController,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: ColorValue.quaternaryColor,
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: [
                        Tab(
                          text: "Produk",
                        ),
                        Tab(
                          text: "Katalog",
                        ),
                        Tab(
                          text: "Tentang",
                        ),
                      ],
                    ),
                  ))
            ];
          },
          body: Container(
            child: TabBarView(
              controller: _tabController,
              children: [
                SingleChildScrollView(
                  child: BlocBuilder<TokoDetailBloc, TokoDetailState>(
                    bloc: _tokoDetailBloc,
                    builder: (context, state) {
                      if (state is TokoDetailInitial) {
                        return _produkLoading();
                      } else if (state is TokoDetailLoading) {
                        return _produkLoading();
                      } else if (state is TokoDetailLoaded) {
                        return Seller_produk(
                            tokoDetailModel: state.tokoDetailList);
                      } else if (state is TokoDetailError) {
                        return Center(
                          child: Text(state.message),
                        );
                      } else {
                        return Center(
                          child: Text(""),
                        );
                      }
                    },
                  ),
                ),
                SingleChildScrollView(
                  child: BlocBuilder<TokoDetailBloc, TokoDetailState>(
                    bloc: _tokoDetailBloc,
                    builder: (context, state) {
                      if (state is TokoDetailInitial) {
                        return _produkLoading();
                      } else if (state is TokoDetailLoading) {
                        return _produkLoading();
                      } else if (state is TokoDetailLoaded) {
                        return Seller_katalog(
                            tokoDetailModel: state.tokoDetailList);
                      } else if (state is TokoDetailError) {
                        return Center(
                          child: Text(state.message),
                        );
                      } else {
                        return Center(
                          child: Text(""),
                        );
                      }
                    },
                  ),
                ),
                SingleChildScrollView(
                  child: BlocBuilder<TokoDetailBloc, TokoDetailState>(
                    bloc: _tokoDetailBloc,
                    builder: (context, state) {
                      if (state is TokoDetailInitial) {
                        return Loading();
                      } else if (state is TokoDetailLoading) {
                        return Loading();
                      } else if (state is TokoDetailLoaded) {
                        return Seller_tentang(
                            tokoDetailModel: state.tokoDetailList);
                      } else if (state is TokoDetailError) {
                        return Center(
                          child: Text(state.message),
                        );
                      } else {
                        return Center(
                          child: Text(""),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _Chat (TokoDetailModel widgetm) {
    return Seller_twobox(onTap: () =>
        ChatFunc().startConversation(
            widgetm.data.sellerId.toString(),
            widgetm.data.namaToko,
            widgetm.data.imgProfile,
            widgetm.data.id.toString(), context),
    );
  }

  Widget _title(TokoDetailModel data) {
    return _isShrink
        ? Text(
      data.data.namaToko,
      style: TextStyle(
          color: ColorValue.primaryColor,
          fontSize: 16,
          fontWeight: FontWeight.bold),
    )
        : Container();
  }

  Widget _head(TokoDetailModel data) {
    return Column(
      children: [
        Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: 92,
          color: Colors.blueAccent,
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 54,
            ),
            Positioned(
              top: -16,
              left: 24,
              right: 24,
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        // shape: BoxShape.circle,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          "https://kangsayur.nitipaja.online/" +
                              data.data.imgProfile,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0, left: 5),
                          child: Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.5,
                            child: Text(data.data.namaToko,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600)),
                          ),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                    color: Color(0xff25C570),
                                    borderRadius: BorderRadius.circular(100)),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Online",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icon/star.svg",
                            width: 14,
                            height: 14,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "${data.data.rating.toStringAsFixed(1)}",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _headLoading() {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: 92,
            color: Colors.blueAccent,
          ),
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 54,
            ),
            Positioned(
              top: -16,
              left: 24,
              right: 24,
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          // shape: BoxShape.circle,
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0, left: 5),
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey,
                              ),
                              child: Text("",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                    color: Color(0xff25C570),
                                    borderRadius: BorderRadius.circular(100)),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Online",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icon/star.svg",
                            width: 14,
                            height: 14,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              width: 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey,
                              ),
                              child: Text(
                                "",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _produkLoading() {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 24),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: CardProduk(
            hargaProduk: '123123',
            imageProduk: 'assets/images/wortel.png',
            jarakProduk: '1.2 km',
            namaProduk: '123123',
            penjualProduk: 'Toko Bu Endah',
          ),
        );
      },
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
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    return new Container(
      color: Color(0xffF6F6F6),
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
