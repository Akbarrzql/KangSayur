import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/profile_head.dart';
import 'package:kangsayur/UI/payment/keranjang/keranjang.dart';
import 'package:kangsayur/bloc/json_bloc/json_bloc.dart';
import 'package:kangsayur/bloc/json_bloc/json_event.dart';
import 'package:kangsayur/model/profilemodel.dart';

import '../../../../bloc/json_bloc/json_state.dart';

class Home_head extends StatefulWidget {
  const Home_head({Key? key}) : super(key: key);

  @override
  State<Home_head> createState() => _Home_headState();
}

class _Home_headState extends State<Home_head> {
  final JsonBloc _jsonBloc = JsonBloc();

  @override
  void initState() {
    _jsonBloc.add(GetProfileList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_)=>_jsonBloc,
      child: BlocListener<JsonBloc, JsonState>(
          listener: (context, state) {
            if (state is JsonError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          child: BlocBuilder<JsonBloc,JsonState>(
              builder: (context, state){
                if (state is JsonInitial) {
                  return Loading();
                } else if (state is JsonLoading) {
                  return Loading();
                } else if (state is JsonLoaded) {
                  return _HeadHome(context, state.jsonProfile);
                } else if (state is JsonError) {
                  return Text(state.message);
                }
                return Container();
              }
          )
      ),
    );
  }
}

Widget _HeadHome(BuildContext context, ProfileModel widget) {
  return Row(
    //make container rounded for profile
    children: [
      Container(
        clipBehavior: Clip.antiAlias,
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(50)),
        child:
        Image.network(
            "https://kangsayur.nitipaja.online/${widget.data.photo}" == null ? "https://avatars.githubusercontent.com/u/60261133?v=4" : "https://kangsayur.nitipaja.online/${widget.data.photo}"
        ),      ),
      SizedBox(
        width: 15,
      ),
      Text(
        "Hallo ${widget.data.name}",
        style: TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
      ),
      Spacer(),
      GestureDetector(
        onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => Keranjang())); },
          child: SvgPicture.asset("assets/icon/cart.svg")),
      SizedBox(
        width: 17,
      ),
      SvgPicture.asset("assets/icon/mail.svg"),
    ],
  );
}