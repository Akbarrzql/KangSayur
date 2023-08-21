import 'package:flutter/material.dart';
import 'package:kangsayur/UI/seller_detail/tabbar/items/tokoproductcategory/tokoproductcategory.dart';
import 'package:kangsayur/model/tokodetailmodel.dart';
import 'package:kangsayur/widget/card_katalog.dart';

class Seller_katalog extends StatefulWidget {
  Seller_katalog({Key? key, required this.tokoDetailModel}) : super(key: key);
  final TokoDetailModel tokoDetailModel;

  @override
  State<Seller_katalog> createState() => _Seller_katalogState();
}

class _Seller_katalogState extends State<Seller_katalog> {
  //list color
  List<int> color = [
    0xffAF7146,
    0xff67E483,
    0xffFFA91F,
    0xffFF5151,
    0xffFF8181,
    0xffE8BE91
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: GridView.builder(
            itemCount: widget.tokoDetailModel.data.category.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 15,
                childAspectRatio: 3 / 1.5),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TokoProductCategory(
                                kategori: widget.tokoDetailModel.data
                                    .category[index].namaKategori,
                                kategoriId: widget
                                    .tokoDetailModel.data.category[index].id
                                    .toString(),
                                Tokoid:
                                    widget.tokoDetailModel.data.id.toString(),
                              )));
                },
                child: Card_katalog(
                  image:
                      "assets/icon/kategori/${widget.tokoDetailModel.data.category[index].kategoriImg}.svg",
                  title:
                      widget.tokoDetailModel.data.category[index].namaKategori,
                  color:
                      color[widget.tokoDetailModel.data.category[index].id - 1],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
