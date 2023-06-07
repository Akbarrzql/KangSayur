import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/ubah_profile/ubah_profile.dart';
import 'package:kangsayur/model/profilemodel.dart';

import '../../../../bloc/json_bloc/json_bloc.dart';
import '../../../../bloc/json_bloc/json_event.dart';
import '../../../../bloc/json_bloc/json_state.dart';


class Profile_head extends StatefulWidget {
  const Profile_head({Key? key}) : super(key: key);

  @override
  State<Profile_head> createState() => _Profile_headState();
}

class _Profile_headState extends State<Profile_head> {
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
                return _HeadProfile(context, state.jsonProfile);
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

Widget _HeadProfile(BuildContext context, ProfileModel widget) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Row(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
        ),
          child: Image.network(            "https://kangsayur.nitipaja.online/${widget.data.photo}" == null ? "https://avatars.githubusercontent.com/u/60261133?v=4" : "https://kangsayur.nitipaja.online/${widget.data.photo}"
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.data.name,
                  style:
                  TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              Text(
                  widget.data.phoneNumber == null
                      ? "Belom Beli No Hp"
                      : widget.data.phoneNumber.toString(),
                  style:
                  TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
              Text(widget.data.email,
                  style:
                  TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
        Spacer(),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Ubah_profile()));
            },
            child: SvgPicture.asset("assets/icon/edit.svg"))
      ],
    ),
  );

}

Widget Loading(){
  return Center(
    child: CircularProgressIndicator(),
  );
}