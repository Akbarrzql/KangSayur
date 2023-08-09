import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../common/color_value.dart';

class Checkout_items extends StatefulWidget {
  Checkout_items({
    Key? key,
    required this.seller_list,
    required this.profil_seller,
    required this.notes,
    required this.nama_seller,
    required this.nama_produk,
    required this.gambar_produk,
    required this.harga,
    required this.jumlah,
    this.isVariant = false,
    required this.variant,
    required this.itemCount_produk,
    required this.onDataChanged,
  }) : super(key: key);
  final List<String> nama_produk, gambar_produk, variant, jumlah, notes;
  final String profil_seller, nama_seller;
  final List<String> seller_list;
  final int itemCount_produk;
  final Function(List<String>) onDataChanged;
  late bool isVariant;
  late List<int> harga;

  @override
  State<Checkout_items> createState() => _Checkout_itemsState();
}

class _Checkout_itemsState extends State<Checkout_items> {
  late List<String> noted = [
    for (int i = 0; i < widget.seller_list.length; i++)
    for (int i = 0; i < widget.nama_produk.length; i++)
    '',
  ];
  late List txtctr = [
    for (int i = 0; i < widget.nama_produk.length; i++) TextEditingController(),
  ];
  late List<bool> isTap = [
    for (int i = 0; i < widget.nama_produk.length; i++) false
  ];

  @override
  void initState() {
    // TODO: implement initState
    print(widget.nama_produk.length);
    print('asdasd');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 24, right: 24, top: 18),
        color: Colors.white,
        child: Column(children: [
          Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: ColorValue.hinttext,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Image.network('https://kangsayur.nitipaja.online/' +
                        widget.profil_seller, fit: BoxFit.cover,),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  //text name seller
                  for (var i = 0; i < widget.nama_seller.length; i++)
                    Text(
                      widget.nama_seller[i],
                      style: TextStyle(
                          color: ColorValue.neutralColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                ],
              ),
              SizedBox(height: 10),
              Divider(
                height: 0.5,
                color: ColorValue.hinttext,
              ),
              SizedBox(height: 10),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: widget.itemCount_produk,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {

                    },
                    child: Column(
                      children: [
                        Row(children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 12),
                            clipBehavior: Clip.antiAlias,
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.network(
                                'https://kangsayur.nitipaja.online' +
                                    widget.gambar_produk[index],
                              fit: BoxFit.cover,),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Container(
                            height: 80,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    widget.nama_produk[index],
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                //make this widget isVariant
                                widget.isVariant
                                    ? Text(
                                        "Varian : " + widget.variant[index],
                                        style: TextStyle(
                                            color: ColorValue.hinttext,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      )
                                    : SizedBox(),
                                Spacer(),
                                Text(
                                  "Rp. " +
                                      ProdukformatNumber(widget.harga[index]) +
                                      ",00",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff0E4F55)),
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isTap[index] = !isTap[index];
                                if (!isTap[index]) {
                                  // Save the note when closing the text field
                                  // You can add the note to a list, database, or any other storage solution
                                  // noted[index] = txtctr[index].text;
                                }
                              });
                            },
                            child: Container(
                              child: Icon(
                                Icons.note_add,
                                color: ColorValue.hinttext,
                              ),
                            ),
                          )
                        ]),
                        //make is tap show textfield for notes not checkout_catatan
                        isTap[index]
                            ? Container(
                                color: Colors.white,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 18),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Catatan (opsional)",
                                      style: TextStyle(
                                          color: Color(0xff222222),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Divider(
                                      color: ColorValue.hinttext,
                                      thickness: 0.5,
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Container(
                                      color: Color(0xffF6F6F6),
                                      height: 135,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      child: TextFormField(
                                        controller: txtctr[index],
                                        onChanged: (value) {
                                          setState(() {
                                            noted[index] = value;
                                          });
                                          //set value notes in checkout
                                          widget.onDataChanged(noted);
                                        },
                                        maxLines: 6,
                                        maxLength: 150,
                                        style: TextStyle(
                                            color: ColorValue.neutralColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText:
                                              "Tulis catatan untuk penjual",
                                          hintStyle: TextStyle(
                                              color: ColorValue.hinttext,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ]));
  }

  String ProdukformatNumber(harga_produk) {
    final numberFormat = NumberFormat('#,##0', 'id_ID');
    return numberFormat.format(harga_produk);
  }
}
