import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kangsayur/bloc/tokoproductcategory_bloc/tokoproductcategory_bloc.dart';
import 'package:kangsayur/model/tokoproductcategorymodel.dart';

import '../../../../../bloc/json_bloc/json_bloc.dart';
import '../../../../../bloc/json_bloc/json_event.dart';
import '../../../../../bloc/json_bloc/json_state.dart';
import '../../../../../bloc/tokoproductcategory_bloc/tokoproductcategory_event.dart';
import '../../../../../bloc/tokoproductcategory_bloc/tokoproductcategory_state.dart';
import '../../../../../model/productmostpopularmodel.dart';
import '../../../../../widget/card_product.dart';
import '../../../../detail/detail.dart';

class TokoProductCategory extends StatefulWidget {
  TokoProductCategory(
      {Key? key,
      required this.kategoriId,
      required this.Tokoid,
      required this.kategori})
      : super(key: key);
  final String kategori;
  final String kategoriId;
  final String Tokoid;

  @override
  State<TokoProductCategory> createState() => _TokoProductCategoryState();
}

class _TokoProductCategoryState extends State<TokoProductCategory> {
  final TokoProductCategoryBloc _category = TokoProductCategoryBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _category.add(GetTokoProductCategoryList(widget.kategoriId, widget.Tokoid));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            widget.kategori,
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
          BlocBuilder<TokoProductCategoryBloc, TokoProductCategoryState>(
            bloc: _category,
            builder: (context, state) {
              if (state is TokoProductCategoryLoading) {
                return Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (state is TokoProductCategoryLoaded) {
                return Expanded(
                  child: _list(state.tokoProductCategoryList),
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

  Widget _list(TokoProductCategoryModel data) {
    return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
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
                    id: data.data![index].id,
                  );
                },
              ));
            },
            child: CardProduk(
                imageProduk: data.data![index].variantImg,
                jarakProduk: data.data[index].distance.toString(),
                namaProduk: data.data![index].namaProduk!,
                penjualProduk: "",
                hargaProduk: data.data[index].hargaVariant.toString()),
          );
        });
  }
}
