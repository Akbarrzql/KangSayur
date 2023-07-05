import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/profile_head.dart';
import 'package:kangsayur/UI/detail/detail.dart';
import 'package:kangsayur/model/searchproductmodel.dart';
import 'package:kangsayur/widget/card_product.dart';
import 'package:shimmer/shimmer.dart';

import '../../bloc/json_bloc/json_bloc.dart';
import '../../bloc/json_bloc/json_event.dart';
import '../../bloc/json_bloc/json_state.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final JsonBloc _jsonBloc = JsonBloc();
  final FocusNode _searchFocusNode = FocusNode();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _searchFocusNode.requestFocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        //back button
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        //search
      ),
      body: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            height: 40,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black.withOpacity(0.45)),
                borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    if (value.isEmpty) {
                      _jsonBloc.add(GetSearchProductList(' '));
                    }
                    _jsonBloc.add(GetSearchProductList(value ?? ' '));
                  });
                },
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                focusNode: _searchFocusNode,
                controller: _searchController,
                textAlign: TextAlign.left,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                      bottom: 8.0,
                    ),
                    border: InputBorder.none,
                    hintText: "Cari kebutuhan anda",
                    hintStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.w400),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Icon(Icons.search),
                    )),
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          BlocProvider(
            create: (_) => _jsonBloc,
            child: BlocListener<JsonBloc, JsonState>(
                listener: (context, state) {
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
                return Text("cari Pencarian mu");
              } else if (state is JsonLoading) {
                return Container();
              } else if (state is JsonLoaded) {
                return Expanded(
                    child: _searchResult(
                  widget: state.jsonSearchProduct,
                ));
              } else if (state is JsonError) {
                return Text(state.message);
              }
              return Container();
            })),
          )
        ],
      ),
    );
  }

  Widget _searchResult({required SearchProductModel widget}) {
    if (widget.data!.isEmpty) {
      return Center(
        child: Text("Tidak ada hasil pencarian"),
      );
    } else {
      return GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemCount: widget.data!.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Detail(
                      id: widget.data![index].id!,
                    );
                  },
                ));
              },
              child: CardProduk(
                  imageProduk: "assets/images/wortel.png",
                  jarakProduk: "1.2 km",
                  namaProduk: widget.data![index].namaProduk!,
                  penjualProduk: widget.data![index].namaToko.toString(),
                  hargaProduk: widget.data![index].harga.toString()),
            );
          });
    }
    ;
  }
}
