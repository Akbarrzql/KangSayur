import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kangsayur/UI/detail/checkoutbuy/checkoutbuy.dart';
import 'package:kangsayur/UI/payment/checkout/checkout.dart';
import 'package:kangsayur/common/color_value.dart';
import 'package:kangsayur/model/alamatmodel.dart';
import 'package:kangsayur/model/chatlistmodel.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../bloc/alamat_bloc/alamat_bloc.dart';
import '../../../../../../bloc/alamat_bloc/alamat_event.dart';
import '../../../../../../bloc/alamat_bloc/alamat_state.dart';
import '../../../bloc/beli_langsung/belilangsung_bloc.dart';
import '../../../bloc/beli_langsung/belilangsung_event.dart';
import '../../../bloc/beli_langsung/belilangsung_states.dart';
import '../../../model/checkoutbuymodel.dart';

class CheckoutBuyAlamat extends StatefulWidget {
  CheckoutBuyAlamat({Key? key, required this.data, required this.discount})
      : super(key: key);
  final CheckoutBuyModel data;
  final int discount;

  @override
  State<CheckoutBuyAlamat> createState() => _CheckoutBuyAlamatState();
}

class _CheckoutBuyAlamatState extends State<CheckoutBuyAlamat> {
  final AlamatBloc _alamatBloc = AlamatBloc();
  int alamatID = 0;
  bool _isButtonDisabled = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _alamatBloc.add(GetAlamatList());
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Alamat",
          style: TextStyle(color: ColorValue.neutralColor, fontSize: 16),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset("assets/icon/arrow_left.svg"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: screenHeight,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  BlocBuilder<AlamatBloc, AlamatState>(
                    bloc: _alamatBloc,
                    builder: (context, state) {
                      if (state is AlamatInitial) {
                        return _alamatLoading();
                      } else if (state is AlamatLoading) {
                        return _alamatLoading();
                      } else if (state is AlamatLoaded) {
                        return Alamat_list(
                          alamatModel: state.alamat,
                          onDataChanged: (int) {
                            setState(() {
                              alamatID = int;
                            });
                          },
                        );
                      } else if (state is AlamatError) {
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
                  SizedBox(
                    height: 85,
                  )
                ],
              ),
            ),
            BlocProvider(
                create: (context) => BeliLangsungBloc(),
                child: BlocConsumer<BeliLangsungBloc, BeliLangsungState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is BeliLangsungInitial) {
                      return Positioned(
                        bottom: 37,
                        child: GestureDetector(
                          onTap: () {
                            int jumlahBeli = int.parse(
                                widget.data.data.jumlahBeli.toString());
                            setState(() {
                              _isButtonDisabled = true;
                            });
                            BlocProvider.of<BeliLangsungBloc>(context)
                                .add(SendData(
                              alamatID,
                              widget.data.data.tokoId,
                              widget.data.data.produkId,
                              widget.data.data.variantId,
                              jumlahBeli,
                            ));
                          },
                          child: Container(
                            height: 46,
                            width: MediaQuery.of(context).size.width - 48,
                            decoration: BoxDecoration(
                                color: const Color(0xff009245),
                                borderRadius: BorderRadius.circular(5)),
                            child: const Center(
                              child: Text(
                                "Pilih Alamat",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      );
                    } else if (state is BeliLangsungLoading) {
                      return Positioned(
                        bottom: 37,
                        child: Container(
                          height: 46,
                          width: MediaQuery.of(context).size.width - 48,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(5)),
                          child: const Center(
                            child: Text(
                              "Pilih Alamat",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      );
                    } else if (state is BeliLangsungLoaded) {
                      Navigator.pop(context);
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckoutBuy(
                                  data: state.checkoutBuyModel,
                                  discount: widget.discount),
                            ));
                      });
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is BeliLangsungError) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )),
          ],
        ),
      ),
    );
  }

  Widget _alamatLoading() {
    return Positioned(
      bottom: 37,
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          //make color radio button func
                          color: ColorValue.hinttext,
                          width: 1)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 16, right: 16, top: 8),
                        child: Row(
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                width: 50,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: ColorValue.primaryColor,
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                            Spacer(),
                            SvgPicture.asset("assets/icon/pinpoint.svg")
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: ColorValue.hinttext,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 16, right: 16, top: 5, bottom: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                height: 20,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                height: 15,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                height: 20,
                                width: 160,
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                )
              ],
            );
          }),
    );
  }
}

class Alamat_list extends StatefulWidget {
  Alamat_list(
      {Key? key, required this.alamatModel, required this.onDataChanged})
      : super(key: key);
  AlamatModel alamatModel;
  final Function(int) onDataChanged;

  @override
  State<Alamat_list> createState() => _Alamat_listState();
}

class _Alamat_listState extends State<Alamat_list> {
  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: widget.alamatModel.name.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              //make function for radio button
              setState(() {
                _selectedItem = index;
                //print id alamat
                widget.onDataChanged(widget.alamatModel.name[index].id);
                print(widget.alamatModel.name[index].id);
              });
            },
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                      color: _selectedItem == index
                          ? Color(0xffECFDF3)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          //make color radio button func
                          color: _selectedItem == index
                              ? ColorValue.primaryColor
                              : ColorValue.hinttext,
                          width: 1)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 16, right: 16, top: 8),
                        child: Row(
                          children: [
                            Text(
                              widget.alamatModel.name[index].labelAlamat,
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                            SvgPicture.asset("assets/icon/pinpoint.svg")
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: _selectedItem == index
                            ? ColorValue.primaryColor
                            : ColorValue.hinttext,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 16, right: 16, top: 5, bottom: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.alamatModel.name[index].namaPenerima,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.alamatModel.name[index].nomorHp.toString(),
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.alamatModel.name[index].alamatLengkap,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                )
              ],
            ),
          );
        });
  }
}
