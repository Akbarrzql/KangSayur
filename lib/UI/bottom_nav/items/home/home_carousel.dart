import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kangsayur/bloc/iklanhome_bloc/iklanhome_bloc.dart';
import 'package:kangsayur/model/iklanhomemodel.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../bloc/iklanhome_bloc/iklanhome_event.dart';
import '../../../../bloc/iklanhome_bloc/iklanhome_states.dart';

class Home_carousel extends StatefulWidget {
  const Home_carousel({Key? key}) : super(key: key);

  @override
  State<Home_carousel> createState() => _Home_carouselState();
}

class _Home_carouselState extends State<Home_carousel> {
  IklanHomeBloc iklanHomeBloc = IklanHomeBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    iklanHomeBloc.add(GetIklanHomeList());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IklanHomeBloc, IklanHomeState>(
      bloc: iklanHomeBloc,
      builder: (context, state) {
        if (state is IklanHomeInitial) {
          return _IklanLoading();
        } else if (state is IklanHomeLoading) {
          return _IklanLoading();
        } else if (state is IklanHomeLoaded) {
          return _iklanHomeList(state.iklan);
        } else if (state is IklanHomeError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const Center(
            child: Text("Error"),
          );
        }
      },
    );
  }

  Widget _iklanHomeList(IklanHomeModel iklanHomeModel) {
    List<String> carouselItems = [
      if (iklanHomeModel.data!.length > 0)
        for (var i = 0; i < 3; i++)
          if (iklanHomeModel.data!.length > 0)
            "https://kangsayur.nitipaja.online${iklanHomeModel.data![i].imgPamflet!}"
      else
        ""
    ];
    List<String> carouselItemsEmpty = [
      "assets/images/homecarousel1.png",
      "assets/images/homecarousel2.png",
      "assets/images/homecarousel3.png",
    ];
    int _currentIndex = 0;

    if (iklanHomeModel.data.isEmpty) {
      return CarouselSlider(
        items: carouselItemsEmpty.map((item) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: Image.asset(
                  item,
                  fit: BoxFit.cover,
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
              _currentIndex = index;
            });
          },
        ),
      );
    } else
      return CarouselSlider(
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
                  fit: BoxFit.cover,
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
              _currentIndex = index;
            });
          },
        ),
      );
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
