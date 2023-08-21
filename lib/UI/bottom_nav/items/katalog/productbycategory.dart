import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kangsayur/bloc/productbycategory_bloc/productbycategory_bloc.dart';
import 'package:kangsayur/model/productbycategorymodel.dart';

import '../../../../bloc/productbycategory_bloc/productbycategory_event.dart';
import '../../../../bloc/productbycategory_bloc/productbycategory_states.dart';
import '../../../../widget/card_product.dart';
import '../../../detail/detail.dart';

class ProductByCategory extends StatefulWidget {
  const ProductByCategory(
      {Key? key, required this.categoryId, required this.category})
      : super(key: key);
  final String categoryId;
  final String category;

  @override
  State<ProductByCategory> createState() => _ProductByCategoryState();
}

class _ProductByCategoryState extends State<ProductByCategory> {
  ProductByCategoryBloc _productByCategoryBloc = ProductByCategoryBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _productByCategoryBloc.add(GetProductByCategoryList(widget.categoryId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              "${widget.category}",
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
            Container(
              child: BlocBuilder<ProductByCategoryBloc, ProductByCategoryState>(
                bloc: _productByCategoryBloc,
                builder: (context, state) {
                  if (state is ProductByCategoryLoading) {
                    return Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (state is ProductByCategoryLoaded) {
                    return Expanded(
                      child: _list(state.produkByCategory),
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
            ),
          ],
        ));
  }

  Widget _list(ProductByCategoryModel data) {
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
