import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../API/cart/cart.dart';
import '../common/color_value.dart';

class Card_keranjang extends StatefulWidget {
  Card_keranjang({
    Key? key,
    required this.nama_toko,
    required this.profil_toko,
    required this.alamat_toko,
    this.isDiscount = false,
    this.discount = 0,
    this.harga_diskon = 0,
    required this.hapus,
    required this.produkList,
    required this.produk_namaList,
    required this.produk_hargaList,
    required this.produk_gambarList,
    required this.produk_idList,
    required this.produk_idTokoList,
    required this.produk_variantList,
    required this.inCart,
    required this.produk_variantIdList,
    required this.status,
    required this.cartId, required this.checklist, required this.tambah, required this.kurang,
  }) : super(key: key);

  //final = produk, nama produk, harga produk, nama toko, isDiscount, discount, harga diskon, isVariant, variant
  final String nama_toko, alamat_toko;
  final String profil_toko;
  final double discount, harga_diskon;
  final bool isDiscount;
  final List produkList;
  final List cartId;
  final List produk_namaList;
  final List produk_hargaList;
  final List produk_gambarList;
  final List produk_idList;
  final List produk_idTokoList;
  final List produk_variantList;
  final List produk_variantIdList;
  final List inCart;
  final List<String> status;
  late List<bool> addCard = [for (int i = 0; i < produkList.length; i++) false];


  //type data for function on tap
  final VoidCallback hapus, checklist, tambah, kurang;

  @override
  State<Card_keranjang> createState() => _Card_keranjangState();
}

class _Card_keranjangState extends State<Card_keranjang> {

  late List<int> _counter = [
    for (int i = 0; i < widget.produkList.length; i++) 1
  ];


  late List<TextEditingController> _counterController = [
      for (int i = 0; i < widget.produkList.length; i++) TextEditingController()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      for (int i = 0; i < widget.produkList.length; i++) {
      _counter[i] = widget.inCart[i];
    }
      for (int i = 0; i < widget.produkList.length; i++) {
      _counterController[i].text = _counter[i].toString();
    }
  }

  void _updateCounter(String value) {
    int parsedValue = int.tryParse(value) ?? 1;
    setState(() {
        for (int i = 0; i < widget.produkList.length; i++) {
        _counter[i] = parsedValue;
      }
      //make logic if counter == 0 counter=0
        for (int i = 0; i < widget.produkList.length; i++) {
        if (_counter[i] == 0) {
          _counter[i] = 1;
        }
      }
      // make logic if controller.text == 0 controller.text = 0
        for (int i = 0; i < widget.produkList.length; i++) {
        if (_counterController[i].text == "0") {
          _counterController[i].text = "1";
        }
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
                  child: Image.network("https://kangsayur.nitipaja.online/"+widget.profil_toko,fit: BoxFit.cover,),
                  clipBehavior: Clip.antiAlias,
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(500),
                  )),
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
                  Container(
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: Text(
                      widget.alamat_toko,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: ColorValue.hinttext),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: widget.produkList.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 25),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Transform.scale(
                          scale: 1.4,
                          child: Checkbox(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            value:
                                widget.status[index] == "true" ? true : false,
                            tristate: false,
                            //turn off hover
                            hoverColor: Colors.transparent,
                            checkColor: Colors.white,
                            visualDensity: VisualDensity.compact,
                            activeColor: ColorValue.primaryColor,
                            onChanged: (bool? value) {
                              setState(() {
                                widget.status[index] = value.toString();
                                // widget.addCard[index] = value ?? false;
                              });
                              Cart().UpdateStatusProductCart(
                                  widget.produk_idList[index].toString(),
                                  widget.produk_variantIdList[index]
                                      .toString()).then((value) => setState((){
                                        widget.checklist();
                              }));
                              print(widget.produk_idList[index]);
                              print(widget.produk_variantIdList[index]);
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
                                ),
                          child: Image.network("https://kangsayur.nitipaja.online/"+widget.produk_gambarList[index], fit: BoxFit.cover,),
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
                                widget.produk_namaList[index],
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              //make this widget isVariant
                              Text(
                                "Varian : " + widget.produk_variantList[index],
                                style: TextStyle(
                                    color: ColorValue.hinttext,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                              Spacer(),
                              Text(
                                "Rp. " +
                                    ProdukformatNumber(
                                        widget.produk_hargaList[index]) +
                                    ",00",
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
                                          "Rp. " +
                                              widget.harga_diskon.toString(),
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.red),
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          "Rp. " +
                                              widget.produk_hargaList[index],
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey,
                                              decoration:
                                                  TextDecoration.lineThrough),
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
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                Cart().DeleteProductCart(
                                  widget.produk_idList[index].toString(),
                                  widget.produk_idTokoList[index].toString(),
                                  widget.produk_variantIdList[index]
                                      .toString(),
                                ).then((value) => setState(() {
                                    widget.hapus();

                                    }));
                                //remove at
                                widget.produk_idList.removeAt(index);
                                widget.produk_idTokoList.removeAt(index);
                                widget.produk_namaList.removeAt(index);
                                widget.produk_variantList.removeAt(index);
                                widget.produk_variantIdList.removeAt(index);
                                widget.produk_hargaList.removeAt(index);
                                widget.produk_gambarList.removeAt(index);
                                widget.status.removeAt(index);
                                widget.produkList.removeAt(index);
                              });
                            },
                            child: Text(
                              "Hapus",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            )),
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
                                onTap: () async {
                                  setState(() {
                                    _counter[index]--;
                                    if (_counter[index] <= 1) {
                                      _counter[index] = 1;
                                    }
                                    _counterController[index].text =
                                        _counter[index].toString();
                                    print("berhasil mengurangi");
                                    print(_counter[index]);
                                  });
                                  await Cart().ValueProductCart(
                                      widget.produk_idList[index].toString(),
                                      widget.produk_idTokoList[index].toString(),
                                      _counter[index].toString(),
                                      widget.produk_variantIdList[index].toString()).then((value) => setState(() {
                                    widget.kurang();
                                      }));
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
                                      controller: _counterController[index],
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(2),
                                      ],
                                      maxLengthEnforcement:
                                          MaxLengthEnforcement.none,
                                      onChanged: (value) async {
                                        setState(() {
                                          _updateCounter(
                                              _counterController[index].text);
                                        });
                                        await Cart().ValueProductCart(
                                            widget.produk_idList[index],
                                            widget.produk_idTokoList[index],
                                            _counter[index].toString(),
                                            widget.produk_variantIdList[index]);
                                      },
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                      decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.only(bottom: 0),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  setState(() {
                                    _counter[index]++;
                                    _counterController[index].text =
                                        _counter[index].toString();
                                  });
                                  await Cart().ValueProductCart(
                                      widget.produk_idList[index].toString(),
                                      widget.produk_idTokoList[index].toString(),
                                      _counter[index].toString(),
                                      widget.produk_variantIdList[index].toString()).then((value) => setState(() {
                                    widget.tambah();

                                  }));
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
                  ],
                ),
              );
            },
          )
        ]));
  }

  String ProdukformatNumber(harga_produk) {
    final numberFormat = NumberFormat('#,##0', 'id_ID');
    return numberFormat.format(harga_produk);
  }
}
