import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/profile_head.dart';
import 'package:kangsayur/UI/detail/detail.dart';
import 'package:kangsayur/model/productmostpopularmodel.dart';
import 'package:kangsayur/widget/card_product.dart';

import '../../../../bloc/json_bloc/json_bloc.dart';
import '../../../../bloc/json_bloc/json_event.dart';
import '../../../../bloc/json_bloc/json_state.dart';

class Home_most_visited extends StatefulWidget {
  const Home_most_visited({Key? key}) : super(key: key);

  @override
  State<Home_most_visited> createState() => _Home_most_visitedState();
}

class _Home_most_visitedState extends State<Home_most_visited> {
  final JsonBloc _jsonBloc = JsonBloc();

  @override
  void initState() {
    _jsonBloc.add(GetProductMostPopularList());
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
          return _Home_most_popular(context, state.jsonProductMostPopular);
        } else if (state is JsonError) {
          return Text(state.message);
        }
        return Container();
      })),
    );
  }
}

Widget _Home_most_popular(
    BuildContext context, ProductMostPopularModel widget) {
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
              context, MaterialPageRoute(builder: (context) {
                return Detail(id: widget.data[index].id, );
              })
            );
          },
          child: CardProduk(
              imageProduk: "assets/images/wortel.png",
              jarakProduk: widget.data[index].distance.toString(),
              namaProduk: widget.data[index].namaProduk,
              penjualProduk: widget.data[index].namaToko,
              hargaProduk: widget.data[index].hargaVariant.toString(),
          ),
        ),
      );
    },
  );
}
