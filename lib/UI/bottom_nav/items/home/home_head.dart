import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kangsayur/UI/bottom_nav/items/home/notif/notification.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/profile_head.dart';
import 'package:kangsayur/UI/payment/keranjang/keranjang.dart';
import 'package:kangsayur/bloc/json_bloc/json_bloc.dart';
import 'package:kangsayur/bloc/json_bloc/json_event.dart';
import 'package:kangsayur/bloc/notifikasilist_bloc/notifikasilist_bloc.dart';
import 'package:kangsayur/bloc/notifikasilist_bloc/notifikasilist_event.dart';
import 'package:kangsayur/model/cartproductmodel.dart';
import 'package:kangsayur/model/notifikasilistmodel.dart';
import 'package:kangsayur/model/profilemodel.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../bloc/json_bloc/json_state.dart';
import '../../../../bloc/notifikasilist_bloc/notifikasilist_state.dart';
import '../profile/navigate/inbox/inbox.dart';

class Home_head extends StatefulWidget {
  const Home_head({Key? key}) : super(key: key);

  @override
  State<Home_head> createState() => _Home_headState();
}

class _Home_headState extends State<Home_head> {
  final JsonBloc _jsonBloc = JsonBloc();
  final JsonBloc _jsonBloc2 = JsonBloc();
  final NotifikasiListBloc _notifBloc = NotifikasiListBloc();

  @override
  void initState() {
    _jsonBloc.add(GetProfileList());
    _jsonBloc2.add(GetCartProductList());
    _notifBloc.add(GetNotifikasiListList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 48,
      child: Center(
        child: Row(
          children: [
            BlocProvider(
              create: (_) => _jsonBloc,
              child: BlocListener<JsonBloc, JsonState>(listener:
                  (context, state) {
                if (state is JsonError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                    ),
                  );
                }
              }, child:
                  BlocBuilder<JsonBloc, JsonState>(builder: (context, state) {
                if (state is JsonInitial) {
                  return Container(child: _HeadHomeShimmer());
                } else if (state is JsonLoading) {
                  return Container(child: _HeadHomeShimmer());
                } else if (state is JsonLoaded) {
                  return _HeadHome(state.jsonProfile);
                } else if (state is JsonError) {
                  return Text(state.message);
                }
                return Container();
              })),
            ),
            Spacer(),
            Container(
              child: BlocProvider(
                create: (_) => _jsonBloc2,
                child: BlocListener<JsonBloc, JsonState>(listener:
                    (context, state) {
                  if (state is JsonError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                      ),
                    );
                  }
                }, child:
                    BlocBuilder<JsonBloc, JsonState>(builder: (context, state) {
                  if (state is JsonInitial) {
                    return _cartLoading();
                  } else if (state is JsonLoading) {
                    return _cartLoading();
                  } else if (state is JsonLoaded) {
                    return _cart(state.jsonCartProduct);
                  } else if (state is JsonError) {
                    return _cartLoading();
                  }
                  return _cartLoading();
                })),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              child: BlocProvider(
                create: (_) => _notifBloc,
                child: BlocListener<NotifikasiListBloc, NotifikasiListState>(
                    listener: (context, state) {
                  if (state is NotifikasiListError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                      ),
                    );
                  }
                }, child: BlocBuilder<NotifikasiListBloc, NotifikasiListState>(
                        builder: (context, state) {
                  if (state is NotifikasiListInitial) {
                    return _notifLoading();
                  } else if (state is NotifikasiListLoading) {
                    return _notifLoading();
                  } else if (state is NotifikasiListLoaded) {
                    return _notifPage(state.notifikasiList);
                  } else if (state is NotifikasiListError) {
                    return _notifLoading();
                  }
                  return _notifLoading();
                })),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _HeadHome(ProfileModel widget) {
    return Row(
      //make container rounded for profile
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(50)),
          child: Image.network(
            "https://kangsayur.nitipaja.online/${widget.data.photo}" == null
                ? "https://avatars.githubusercontent.com/u/60261133?v=4"
                : "https://kangsayur.nitipaja.online/${widget.data.photo}",
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          "Hallo ${widget.data.name}",
          style: TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
        ),
        // Spacer(),
        // SizedBox(
        //   width: 17,
        // ),
        // GestureDetector(
        //     onTap: () {
        //       Navigator.push(context,
        //           MaterialPageRoute(builder: (context) => NotificationPage()));
        //     },
        //     child: SvgPicture.asset("assets/icon/mail.svg")),
      ],
    );
  }

  Widget _cartLoading() {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Keranjang()));
        },
        child: SvgPicture.asset("assets/icon/cart.svg"));
  }

  Widget _cart(CartProductModel widget) {
    List productInCart=[
      for (var i = 0; i < widget.data.length; i++)
        for (var j = 0; j < widget.data[i].getProductCart.length; j++)
          widget.data[i].getProductCart[j].namaProduk
    ];
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Keranjang()));
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            //Container  for total cart
            SvgPicture.asset("assets/icon/cart.svg"),
            if (productInCart.length > 0)
            Positioned(
              top: -3,
              right: -4,
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: Text(
                    "${productInCart.length}",
                    style: TextStyle(
                        fontSize: 8,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget _notifLoading() {
    return GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NotificationPage()));
        },
        child: SvgPicture.asset("assets/icon/mail.svg"));
  }

  Widget _notifPage(NotifikasiListModel widget) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NotificationPage()));
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SvgPicture.asset("assets/icon/mail.svg"),
            if (widget.data.length > 0)
            Positioned(
              top: -4,
              right: -2,
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: Text(
                    "${widget.data.length}",
                    style: TextStyle(
                        fontSize: 8,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget _HeadHomeShimmer() {
    return Row(
      //make container rounded for profile
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            clipBehavior: Clip.antiAlias,
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(50)),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            color: Colors.grey[300]!,
            child: Text(
              "Hallo asdaasd",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.transparent,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        // Spacer(),
        // GestureDetector(
        //     onTap: () {
        //       Navigator.push(context,
        //           MaterialPageRoute(builder: (context) => Keranjang()));
        //     },
        //     child: SvgPicture.asset("assets/icon/cart.svg")),
        // SizedBox(
        //   width: 17,
        // ),
        // GestureDetector(
        //     onTap: () {
        //       Navigator.push(context,
        //           MaterialPageRoute(builder: (context) => NotificationPage()));
        //     },
        //     child: SvgPicture.asset("assets/icon/mail.svg")),
      ],
    );
  }
}
