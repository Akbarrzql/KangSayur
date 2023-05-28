import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../common/color_value.dart';

class Card_keranjang extends StatefulWidget {
  Card_keranjang({
    Key? key,
    required this.gambar_produk,
    required this.nama_produk,
    required this.harga_produk,
    required this.nama_toko,
    required this.profil_toko,
    required this.alamat_toko,
    this.isDiscount = false,
    this.discount = 0,
    this.harga_diskon = 0,
    this.isVariant = false,
    this.variant = "",
    this.addCard = false,
  }) : super(key: key);

  //final = produk, nama produk, harga produk, nama toko, isDiscount, discount, harga diskon, isVariant, variant
  final String gambar_produk, nama_produk, nama_toko, profil_toko, alamat_toko;
  final double harga_produk, discount, harga_diskon;
  final bool isDiscount, isVariant;
  final String variant;
  late bool addCard;

  @override
  State<Card_keranjang> createState() => _Card_keranjangState();
}

class _Card_keranjangState extends State<Card_keranjang> {
  int _counter = 1;
  TextEditingController _counterController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _counterController.text = _counter.toString();
  }

  void _updateCounter(String value) {
    int parsedValue = int.tryParse(value) ?? 1;
    setState(() {
      _counter = parsedValue;
      //make logic if counter == 0 counter=0


      if (value.length > 2) {
        _counterController.text = 99.toString();
      }
      // make logic if controller.text == 0 controller.text = 0
      else if (value == "0") {
        _counterController.text = 1.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              //make profile for toko
              Container(
                clipBehavior: Clip.antiAlias,
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(widget.profil_toko),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //make nama toko dan alamat toko
                  Text(
                    widget.nama_toko,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    widget.alamat_toko,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: ColorValue.hinttext),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.4,
                child: Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: widget.addCard,
                  tristate: false,
                  //turn off hover
                  hoverColor: Colors.transparent,
                  checkColor: Colors.white,
                  visualDensity: VisualDensity.compact,
                  activeColor: ColorValue.primaryColor,

                  onChanged: (bool? value) {
                    setState(() {
                      widget.addCard = value ?? false;
                    });
                  },
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                clipBehavior: Clip.antiAlias,
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: Offset(0, 4), // changes position of shadow
                      ),
                    ],
                    image: DecorationImage(
                        image: AssetImage(widget.gambar_produk),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                width: 12,
              ),
              Container(
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.nama_produk,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    //make this widget isVariant
                    widget.isVariant
                        ? Text(
                            "Varian : " + widget.variant,
                            style: TextStyle(
                                color: ColorValue.hinttext,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )
                        : SizedBox(),
Spacer(),
                    Text(
                      "Rp. " + ProdukformatNumber(widget.harga_produk) + ",00",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff0E4F55)),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    widget.isDiscount
                        ? Row(
                            children: [
                              Text(
                                "Rp. " + widget.harga_diskon.toString(),
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.red),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "Rp. " + widget.harga_produk.toString(),
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                widget.discount.toString() + "%",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.red),
                              ),
                            ],
                          )
                        : Container(),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Hapus", style: TextStyle(color: Colors.red, fontSize: 12, fontWeight: FontWeight.bold),),
              Spacer(),
              Container(
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
                          if (_counter <= 1) {
                            _counter = 1;
                          }
                          _counterController.text = _counter.toString();
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
                            onChanged: _updateCounter,
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
              )
            ],
          ),
        ]));
  }

  String ProdukformatNumber(harga_produk) {
    final numberFormat = NumberFormat('#,##0', 'id_ID');
    return numberFormat.format(harga_produk);
  }
}
