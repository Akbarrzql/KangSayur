import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:kangsayur/UI/detail/checkoutbuy/checkoutbuy_alamat.dart';
import 'package:kangsayur/UI/payment/checkout/checkout.dart';
import 'package:kangsayur/model/checkoutbuymodel.dart';

import '../../../API/cart/cart.dart';
import '../../../common/color_value.dart';
import '../../payment/checkout/checkout_items.dart';
import '../../payment/keranjang/keranjang.dart';
import '../../payment/midtrans_screen/snap_screen.dart';

class CheckoutBuy extends StatefulWidget {
  CheckoutBuy({Key? key, required this.data, required this.discount})
      : super(key: key);
  final CheckoutBuyModel data;
  final int discount;

  @override
  State<CheckoutBuy> createState() => _CheckoutBuyState();
}

class _CheckoutBuyState extends State<CheckoutBuy> {
  String _note = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Checkout",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          leading: IconButton(
            icon: SvgPicture.asset("assets/icon/arrow_left.svg"),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height -
              kToolbarHeight -
              MediaQuery.of(context).padding.top,
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Checkout_alamat(
                      widget.data.infoPengiriman.nama,
                      widget.data.infoPengiriman.alamat,
                      widget.data.infoPengiriman.nomotTelepon.toString(), () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CheckoutBuyAlamat(
                                  discount: widget.discount,
                                  data: widget.data,
                                )));
                  }),
                  SizedBox(
                    height: 10,
                  ),
                  _chekoutItems(),
                  SizedBox(
                    height: 10,
                  ),
                  Checkout_ringkasan(
                    total_harga: widget.data.rincian.totalKeseluruhan,
                    sub_total: widget.data.rincian.subtotalProduk.toDouble(),
                    ongkos_kirim: widget.data.rincian.subtotalOngkir.toDouble(),
                  ),
                ],
              ),
              Bar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget Bar() {
    int total = int.parse(widget.data.data.jumlahBeli);

    List<Map<String, dynamic>> dataArray = [
      for (var i = 0; i < total; i++)
        {
          "product_id": widget.data.data.produkId,
          "variant_id": widget.data.data.variantId,
          "store_id": widget.data.data.tokoId,
          if (_note != "") "notes": _note,
          "alamat_id": widget.data.infoPengiriman.alamatId,
          "discount": widget.discount,
        },
    ];

    return Positioned(
      bottom: 0,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.10,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Total",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  NumberFormat.currency(
                    locale: 'id',
                    symbol: 'Rp',
                    decimalDigits: 0,
                  ).format(widget.data.rincian.totalKeseluruhan.toInt()),
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () async {
                var data = await Cart().Order(
                    dataArray, widget.data.rincian.totalKeseluruhan.toInt());
                print('object');
                print(data.data.snapToken);
                await Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Snap_screen(
                              snap_token: data.data.snapToken,
                            )),
                    (route) => false);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xff009245),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Center(
                    child: Text(
                  "Bayar",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget Checkout_alamat(String nama_penerima, String alamat, String no_telp,
      VoidCallback onPressed) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Text(
                    "Alamat Pengiriman",
                    style: TextStyle(
                        color: Color(0xff222222),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      onPressed();
                    },
                    child: Text(
                      "Pilih Alamat Lain",
                      style: TextStyle(
                          color: ColorValue.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
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
            ],
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nama_penerima,
                  style: TextStyle(
                      color: ColorValue.neutralColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  no_telp,
                  style: TextStyle(
                      color: ColorValue.neutralColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  alamat,
                  style: TextStyle(
                      color: ColorValue.neutralColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _chekoutItems() {
    List<String> notes = [
      "",
    ];
    return Column(children: [
      Container(
        child: Checkout_items(
          jumlah_barang: [''],
          seller_list: [
            widget.data.data.namaToko.toString(),
          ],
          profil_seller: widget.data.data.imgProfile.toString(),
          nama_seller: widget.data.data.namaToko.toString(),
          notes: notes,
          onDataChanged: (data) {
            setState(() {
              notes = data;
              _note = notes[0];
              print('notes');
              print(notes);
            });
          },
          nama_produk: [widget.data.data.namaProduk.toString()],
          gambar_produk: [widget.data.data.gambarProduk.toString()],
          variant: [widget.data.data.variant.toString()],
          harga: [widget.data.data.hargaVariant],
          jumlah: ["1"],
          isVariant: true,
          itemCount_produk: 1,
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Divider(
              height: 0.5,
              color: ColorValue.hinttext,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Subtotal",
                  style:
                      TextStyle(color: ColorValue.neutralColor, fontSize: 14),
                ),
                Text(
                  "Rp" +
                      ProdukformatNumber(widget.data.rincian.subtotalProduk) +
                      ",00",
                  style: TextStyle(
                      fontSize: 14,
                      color: ColorValue.neutralColor,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    ]);
  }
}
