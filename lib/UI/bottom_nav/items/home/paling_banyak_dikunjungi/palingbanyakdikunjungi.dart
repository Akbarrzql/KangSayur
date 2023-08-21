import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../bloc/json_bloc/json_bloc.dart';
import '../../../../../bloc/json_bloc/json_event.dart';
import '../../../../../bloc/json_bloc/json_state.dart';
import '../../../../../model/productmostpopularmodel.dart';
import '../../../../../widget/card_product.dart';
import '../../../../detail/detail.dart';

class PalingBanyakDikunjungi extends StatefulWidget {
  const PalingBanyakDikunjungi({Key? key}) : super(key: key);

  @override
  State<PalingBanyakDikunjungi> createState() => _PalingBanyakDikunjungiState();
}

class _PalingBanyakDikunjungiState extends State<PalingBanyakDikunjungi> {
  final JsonBloc _jsonBloc = JsonBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _jsonBloc.add(GetProductMostPopularList());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Paling banyak dikunjungi",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          leading: IconButton(
            icon: SvgPicture.asset("assets/icon/arrow_left.svg"),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Column(
        children: [
          BlocBuilder<JsonBloc, JsonState>(
            bloc: _jsonBloc,
            builder: (context, state) {
              if (state is JsonLoading) {
                return Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (state is JsonLoaded) {
                return Expanded(
                  child: _list(state.jsonProductMostPopular),
                );
              } else {
                return Expanded(
                  child: Center(
                    child: Text("Error"),
                  ),
                );
              }
            },
          ),
        ],
      ),

    );
  }
  Widget _list(ProductMostPopularModel data){
    return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24  ),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.6,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20),
        itemCount: data.data!.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Detail(
                    id: data.data![index].id!,
                  );
                },
              ));
            },
            child: CardProduk(
                imageProduk: data.data![index].variantImg.toString(),
                jarakProduk: data.data![index].distance.toString() + " km",
                namaProduk: data.data![index].namaProduk!,
                penjualProduk: data.data![index].namaToko.toString(),
                hargaProduk: data.data![index].hargaVariant.toString()),
          );
        });
  }
}
