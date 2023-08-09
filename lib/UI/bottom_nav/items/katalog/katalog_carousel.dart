import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kangsayur/bloc/iklan_bloc/iklan_event.dart';
import 'package:kangsayur/model/iklanmodel.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../bloc/iklan_bloc/iklan_bloc.dart';
import '../../../../bloc/iklan_bloc/iklan_state.dart';

class Katalog_carousel extends StatefulWidget {
  const Katalog_carousel({Key? key}) : super(key: key);

  @override
  State<Katalog_carousel> createState() => _Katalog_carouselState();
}

class _Katalog_carouselState extends State<Katalog_carousel> {
  int activePage = 1;

  //bloc
  IklanBloc iklanBloc = IklanBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    iklanBloc.add(GetIklanList());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IklanBloc, IklanState>(
      bloc: iklanBloc,
      builder: (context, state) {
        if (state is IklanInitial) {
          return _IklanLoading();
        } else if (state is IklanLoading) {
          return _IklanLoading();
        } else if (state is IklanLoaded) {
          return _Iklan(state.iklan);
        } else if (state is IklanError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return Center(
            child: Text(""),
          );
        }
      },
    );
  }

  Widget _Iklan(IklanModel data) {
    List<String> carouselItems = [
      for (var i = 0; i < data.data.length; i++)
        "https://kangsayur.nitipaja.online" + data.data[i].imgPamflet,
    ];
    int _currentIndex = 0;
    if (carouselItems.length > 0) {
      return Column(
        children: [
          CarouselSlider(
            items: carouselItems.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Image.network(
                      item,
                      fit: BoxFit.fill,
                    ),
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              height: 150.0,
              viewportFraction: 0.9,
              initialPage: _currentIndex,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              onPageChanged: (index, reason) {
                setState(() {
                  print(index);
                  _currentIndex = index;
                });
              },
            ),
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget _IklanLoading() {
    List<String> carouselItems = [
      "https://kangsayur.nitipaja.online/assets/img/pamflet/1628073770pamflet.jpg",
      "https://kangsayur.nitipaja.online/assets/img/pamflet/1628073770pamflet.jpg",
      "https://kangsayur.nitipaja.online/assets/img/pamflet/1628073770pamflet.jpg",
    ];
    int _currentIndex = 0;
    return Column(
      children: [
        CarouselSlider(
          items: carouselItems.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.grey[300]!,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Image.network(
                      item,
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            );
          }).toList(),
          options: CarouselOptions(
            height: 150.0,
            viewportFraction: 0.9,
            initialPage: _currentIndex,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            onPageChanged: (index, reason) {
              setState(() {
                print(index);
                _currentIndex = index;
              });
            },
          ),
        ),
      ],
    );
  }
}
