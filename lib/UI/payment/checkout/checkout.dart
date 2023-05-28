import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:kangsayur/common/color_value.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  //make text editing controller
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
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
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Checkout_alamat(
                  nama_penerima: "Nouvo Chrisna",
                  alamat:
                      "Jl. Raya Tuban - Bojonegoro, Ds. Kedungpring, Kec. Kerek, Kab. Tuban, Jawa Timur",
                  no_telp: "08128863132",
                  onPressed: () {},
                ),
                SizedBox(
                  height: 10,
                ),
                Checkout_items(
                  profil_seller: "assets/images/store.png",
                  nama_seller: "Toko Sayur Segar",
                  nama_produk: "Kangkung",
                  gambar_produk: "assets/images/wortel.png",
                  variant: "1 Kg",
                  harga: 10000,
                  jumlah: "1",
                  subtotal: 10000,
                  itemCount: 1,
                  isVariant: true,
                ),
                SizedBox(
                  height: 20,
                ),
                Checkout_catatan(catatanController: _controller),
                SizedBox(
                  height: 20,
                ),
                Promo(),
                SizedBox(
                  height: 20,
                ),
                Checkout_ringkasan(
                    total_harga: 120000,
                    ongkos_kirim: 4000,
                    biaya_layanan: 2000)
              ],
            ),
          ),
          Positioned(bottom: 0,
              child: Bar(total: 200000))
        ],
      ),
    );
  }

  Widget Promo() {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Promo",
              style: TextStyle(
                  color: ColorValue.neutralColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 46,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Color(0xff009245),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icon/promo.svg",
                      color: Colors.white,
                      height: 24,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "  Makin hemat pakai promo",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    SvgPicture.asset(
                      "assets/icon/arrow_right.svg",
                      color: Colors.white,
                      height: 20,
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Widget Bar({
    required double total,
  }) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.10,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                "Rp. ${NumberFormat("#,###").format(total)},00",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ],
          ),
Spacer(),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xff009245),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                  child: Text(
                "Bayar",
                style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
              )),
            ),
          )
        ],
      ),
    );
  }
}

class Checkout_alamat extends StatelessWidget {
  const Checkout_alamat(
      {Key? key,
      required this.nama_penerima,
      required this.alamat,
      required this.no_telp,
      required this.onPressed})
      : super(key: key);
  final String nama_penerima, alamat, no_telp;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      color: Colors.white,
      child: Column(
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
              Text(
                "Pilih Alamat Lain",
                style: TextStyle(
                    color: ColorValue.primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
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
}

class Checkout_items extends StatelessWidget {
  Checkout_items({
    Key? key,
    required this.profil_seller,
    required this.nama_seller,
    required this.nama_produk,
    required this.gambar_produk,
    required this.harga,
    required this.jumlah,
    required this.subtotal,
    required this.itemCount,
    this.isVariant = false,
    this.variant = "",
  }) : super(key: key);
  final String profil_seller,
      nama_seller,
      nama_produk,
      gambar_produk,
      variant,
      jumlah;
  final int itemCount;
  final double harga, subtotal;
  late bool isVariant;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      color: Colors.white,
      child: Column(
        children: [
          ListView.builder(
            itemCount: itemCount,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(children: [
                Row(
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                              image: AssetImage(profil_seller),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    //text name seller
                    Text(
                      nama_seller,
                      style: TextStyle(
                          color: ColorValue.neutralColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(children: [
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
                            image: AssetImage(gambar_produk),
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
                          nama_produk,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        //make this widget isVariant
                        isVariant
                            ? Text(
                                "Varian : " + variant,
                                style: TextStyle(
                                    color: ColorValue.hinttext,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              )
                            : SizedBox(),
                        Spacer(),
                        Text(
                          "Rp. " + ProdukformatNumber(harga) + ",00",
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
                ]),
                SizedBox(
                  height: 15,
                )
              ]);
            },
          ),
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
                style: TextStyle(color: ColorValue.neutralColor, fontSize: 14),
              ),
              Text(
                "Rp" + ProdukformatNumber(subtotal) + ",00",
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
    );
  }

  String ProdukformatNumber(harga_produk) {
    final numberFormat = NumberFormat('#,##0', 'id_ID');
    return numberFormat.format(harga_produk);
  }
}

class Checkout_catatan extends StatelessWidget {
  const Checkout_catatan({Key? key, required this.catatanController})
      : super(key: key);
  final TextEditingController catatanController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
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
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: TextFormField(
              controller: catatanController,
              maxLines: 6,
              maxLength: 150,
              style: TextStyle(
                  color: ColorValue.neutralColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                  hintText: "Tambahkan Catatan Disini...",
                  hintStyle: TextStyle(
                      color: ColorValue.hinttext,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}

class Checkout_ringkasan extends StatelessWidget {
  Checkout_ringkasan(
      {Key? key,
      required this.total_harga,
      required this.ongkos_kirim,
      required this.biaya_layanan,
      this.isDiscount = false,
      this.discount = 0})
      : super(key: key);

  // make final int of  total harga, ongkos kirim, biaya_layanan
  final double total_harga, ongkos_kirim, biaya_layanan;
  late double discount = 0;
  late bool isDiscount = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Ringkasan Pembayaran",
              style: TextStyle(
                  color: Color(0xff222222),
                  fontSize: 14,
                  fontWeight: FontWeight.w600)),
          Divider(
            color: ColorValue.hinttext,
            thickness: 0.5,
          ),
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Total Harga",
                        style: TextStyle(
                            color: ColorValue.neutralColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400)),
                    Spacer(),
                    Text("Rp. " + ProdukformatNumber(total_harga) + ",00",
                        style: TextStyle(
                            color: ColorValue.neutralColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
                Row(
                  children: [
                    Text("Ongkos Kirim",
                        style: TextStyle(
                            color: ColorValue.neutralColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400)),
                    Spacer(),
                    Text("Rp. " + ProdukformatNumber(ongkos_kirim) + ",00",
                        style: TextStyle(
                            color: ColorValue.neutralColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
                Row(
                  children: [
                    Text("Biaya Layanan",
                        style: TextStyle(
                            color: ColorValue.neutralColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400)),
                    Spacer(),
                    Text("Rp. " + ProdukformatNumber(biaya_layanan) + ",00",
                        style: TextStyle(
                            color: ColorValue.neutralColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
                //make this widget isDiscount
                isDiscount
                    ? Row(
                        children: [
                          Text("Discount",
                              style: TextStyle(
                                  color: ColorValue.neutralColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400)),
                          Spacer(),
                          Text("- Rp. " + ProdukformatNumber(discount) + ",00",
                              style: TextStyle(
                                  color: ColorValue.neutralColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400)),
                        ],
                      )
                    : SizedBox(),
              ],
            ),
          )
        ],
      ),
    );
  }

  String ProdukformatNumber(harga_produk) {
    final numberFormat = NumberFormat('#,##0', 'id_ID');
    return numberFormat.format(harga_produk);
  }
}
