import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kangsayur/UI/bottom_nav/items/katalog/productbycategory.dart';
import 'package:kangsayur/bloc/kategori_bloc/kategori_bloc.dart';
import 'package:kangsayur/model/kategorimodel.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../bloc/kategori_bloc/kategori_event.dart';
import '../../../../bloc/kategori_bloc/kategori_states.dart';

class Katalog_box_list extends StatefulWidget {
  const Katalog_box_list({Key? key}) : super(key: key);

  @override
  State<Katalog_box_list> createState() => _Katalog_box_listState();
}

class _Katalog_box_listState extends State<Katalog_box_list> {
  // bloc
  KategoriBloc _kategoriBloc = KategoriBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _kategoriBloc.add(GetKategoriList());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          BlocBuilder<KategoriBloc, KategoriState>(
            bloc: _kategoriBloc,
            builder: (context, state) {
              if (state is KategoriLoading) {
                return _boxListLoading();
              } else if (state is KategoriLoaded) {
                return _boxList(state.Kategori);
              } else if (state is KategoriError) {
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
    );
  }

  Widget _boxList(KategoriModel kategori) {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 1.1),
        itemCount: kategori.data.length,
        itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProductByCategory(
                    categoryId: kategori.data[index].id.toString(),
                    category: kategori.data[index].namaKategori.toString(),
                  );
                }));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Color(0xffA0A0A0),
                        ),
                        boxShadow: []),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          clipBehavior: Clip.antiAlias,
                          height: 36,
                          width: 36,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: SvgPicture.asset(
                            "assets/icon/kategori/${kategori.data[index].kategoriImg}.svg",
                            height: 36,
                            width: 36,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    kategori.data![index].namaKategori.toString(),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ));
  }

  Widget _boxListLoading() {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 1.1),
        itemCount: 6,
        itemBuilder: (context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 5),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Color(0xffA0A0A0),
                        ),
                        boxShadow: []),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            height: 36,
                            width: 36,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey[300]!,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 14,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[300]!,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      "asdsasds",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ));
  }
}
