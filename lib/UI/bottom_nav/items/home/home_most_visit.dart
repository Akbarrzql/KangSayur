import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kangsayur/bloc/json_bloc/json_event.dart';
import 'package:kangsayur/model/productusermostvisitmodel.dart';

import '../../../../bloc/json_bloc/json_bloc.dart';
import '../../../../bloc/json_bloc/json_state.dart';
import '../../../../widget/card_product.dart';
import '../../../detail/detail.dart';
import '../profile/profile_head.dart';

class Home_most_visit extends StatefulWidget {
  const Home_most_visit({Key? key}) : super(key: key);

  @override
  State<Home_most_visit> createState() => _Home_most_visitState();
}

class _Home_most_visitState extends State<Home_most_visit> {
  final JsonBloc _jsonBloc = JsonBloc();

  @override
  void initState() {
    _jsonBloc.add(GetProductUserMostVisitList());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _jsonBloc,
      child: BlocListener<JsonBloc, JsonState>(listener: (context, state) {
        if (state is JsonError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      }, child: BlocBuilder<JsonBloc, JsonState>(builder: (context, state) {
        if (state is JsonInitial) {
          return Loading();
        } else if (state is JsonLoading) {
          return Loading();
        } else if (state is JsonLoaded) {
          return _Home_most_visited(context, state.jsonProductMostPopular);
        } else if (state is JsonError) {
          return Text(state.message);
        }
        return Container();
      })),
    );
  }
}
Widget _Home_most_visited(
    BuildContext context, ProductUserMostVisitModel widget) {
  return ListView.builder(
    padding: EdgeInsets.only(left: 24, bottom: 5),
    itemCount: widget.data.length,
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
      return Padding(
        padding: EdgeInsets.only(right: 24),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Detail(
                  id: widget.data[index].id,
                ),
              ),
            );
          },
          child: CardProduk(
            imageProduk: widget.data[index].variantImg,
            jarakProduk: widget.data[index].distance.toString(),
            namaProduk: widget.data[index].namaProduk,
            penjualProduk: widget.data[index].namaToko,
            hargaProduk: widget.data[index].hargaVariant  .toString(),
          ),
        ),
      );
    },
  );
}
