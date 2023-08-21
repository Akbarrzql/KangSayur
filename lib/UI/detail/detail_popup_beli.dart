import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kangsayur/bloc/beli_langsung/belilangsung_bloc.dart';
import 'package:kangsayur/bloc/beli_langsung/belilangsung_states.dart';
import 'package:kangsayur/model/checkoutbuymodel.dart';
import 'package:kangsayur/model/detailproductmodel.dart';

import '../../API/cart/cart.dart';
import '../../bloc/beli_langsung/belilangsung_event.dart';
import '../../bloc/json_bloc/json_bloc.dart';
import '../../bloc/json_bloc/json_event.dart';
import '../../bloc/json_bloc/json_state.dart';
import '../../common/color_value.dart';
import '../bottom_nav/items/profile/profile_head.dart';
import 'checkoutbuy/checkoutbuy.dart';
import 'detail_content.dart';

class Detail_popup_beli extends StatefulWidget {
  Detail_popup_beli(
      {Key? key,
      required this.produkId,
      required this.namaProduk,
      required this.namaToko,
      required this.gambarToko,
      required this.tokoId,
      required this.jumlahVariant,
      required this.namaVariant,
      required this.variantId,
      required this.hargaVariant,
      required this.stokVariant,
      required this.gambarVariant,
      required this.diskon})
      : super(key: key);

  final int produkId;
  String namaProduk;
  String gambarToko;
  String namaToko;
  final int tokoId;
  final int jumlahVariant;
  final List<String> namaVariant;

  final List<int> variantId;
  final int diskon;

  final List<int> hargaVariant;
  final List<int> stokVariant;
  final List<String> gambarVariant;

  @override
  State<Detail_popup_beli> createState() => _Detail_popup_beliState();
}

class _Detail_popup_beliState extends State<Detail_popup_beli> {
  late List<int> value = widget.variantId;
  late List<bool> isCheck = [
    // for (int i = 0; i < widget.jumlahVariant; i++) false
    //looping index false except index 0
    for (int i = 0; i < widget.jumlahVariant; i++) i == 0 ? true : false
  ];

  late List<int> variantId = [
    for (int i = 0; i < widget.jumlahVariant; i++) widget.variantId[i]
  ];

  late int idvariant = widget.variantId[0];
  late int hargaVariant = widget.hargaVariant[0];
  late String namaVariant = widget.namaVariant[0];
  late String gambarVariant = widget.gambarVariant[0];

  int _counter = 1;
  TextEditingController _counterController = TextEditingController();

  void _updateCounter(String value) {
    int parsedValue = int.tryParse(value) ?? 1;
    setState(() {
      _counter = parsedValue;
      //make logic if counter == 0 counter=0
      if (_counter == 0) {
        _counter = 1;
      }

      // make logic if controller.text == 0 controller.text = 0
      if (_counterController.text == "0") {
        _counterController.text = "1";
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _counterController.text = _counter.toString();
  }

  bool _isButtonDisabled = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height / 2.3,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      for (var i = 0; i < widget.jumlahVariant; i++)
                        if (isCheck[i] == true)
                          Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ]),
                            child: Image.network(
                              'https://kangsayur.nitipaja.online' +
                                  widget.gambarVariant[i],
                              fit: BoxFit.cover,
                            ),
                          ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var i = 0; i < widget.jumlahVariant; i++)
                            if (isCheck[i] == true)
                              Text(
                                widget.namaVariant[i],
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                          const SizedBox(
                            height: 4,
                          ),
                          for (var i = 0; i < widget.jumlahVariant; i++)
                            if (isCheck[i] == true)
                              Text(
                                widget.namaProduk,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                          const SizedBox(
                            height: 4,
                          ),
                          for (var i = 0; i < widget.jumlahVariant; i++)
                            if (isCheck[i] == true)
                              Text(
                                "Rp. ${widget.hargaVariant[i]},00",
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: ColorValue.secondaryColor),
                              ),
                          const SizedBox(
                            height: 4,
                          ),
                          for (var i = 0; i < widget.jumlahVariant; i++)
                            if (isCheck[i] == true)
                              Text(
                                "Stok : ${widget.stokVariant[i]}",
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: widget.jumlahVariant,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 70,
                            childAspectRatio: 4 / 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 30),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (index == isCheck.indexOf(false, index)) {
                              isCheck[index] = true;
                              value[index] = widget.variantId[index];
                              idvariant = widget.variantId[index];
                              hargaVariant = widget.hargaVariant[index];
                              namaVariant = widget.namaVariant[index];
                              gambarVariant = widget.gambarVariant[index];
                              print(idvariant);
                              print(value[index]);
                              variantId[index] = value[index];
                              for (var b = 0; b < isCheck.length; b++) {
                                if (b != index) {
                                  isCheck[b] = false;
                                }
                              }
                            }
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              color: isCheck[index]
                                  ? const Color(0xff009245)
                                  : Colors.white30,
                              borderRadius: BorderRadius.circular(5),
                              border: isCheck[index]
                                  ? Border.all(color: ColorValue.primaryColor)
                                  : Border.all(color: Colors.black)),
                          child: Center(
                              child: Text(
                            widget.namaVariant[index],
                            style: TextStyle(
                                color: isCheck[index]
                                    ? Colors.white
                                    : Colors.black),
                          )),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: EdgeInsets.symmetric(horizontal: 12),
                height: 35,
                width: MediaQuery.of(context).size.width * 0.4 - 24,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: ColorValue.primaryColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _counter--;
                          _counterController.text = _counter.toString();
                          _updateCounter(_counterController.text);
                        });
                      },
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 20,
                        height: 35,
                        child: Center(
                          child: TextField(
                            controller: _counterController,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(2),
                            ],
                            maxLengthEnforcement: MaxLengthEnforcement.none,
                            onChanged: (value) {
                              setState(() {
                                _updateCounter(_counterController.text);
                              });
                            },
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(bottom: 0),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _counter++;
                          _counterController.text = _counter.toString();
                        });
                      },
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Container(
              height: 76,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(color: Color(0xff0E4F55)),
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: BlocProvider(
                      create: (context) => BeliLangsungBloc(),
                      child: BlocConsumer<BeliLangsungBloc, BeliLangsungState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          if (state is BeliLangsungInitial) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isButtonDisabled = true;
                                });
                                BlocProvider.of<BeliLangsungBloc>(context)
                                    .add(SendData(
                                  0,
                                  widget.tokoId,
                                  widget.produkId,
                                  idvariant,
                                  _counter,
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
                                    "Beli Sekarang",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            );
                          } else if (state is BeliLangsungLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is BeliLangsungLoaded) {
                            Navigator.pop(context);
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CheckoutBuy(
                                        data: state.checkoutBuyModel,
                                        discount: widget.diskon),
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
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
