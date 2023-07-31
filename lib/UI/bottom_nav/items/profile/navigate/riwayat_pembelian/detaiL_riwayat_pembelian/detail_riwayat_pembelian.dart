import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/inbox/navigate/ulasan_anda/mengulas/mengulas.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/riwayat_pembelian/lacak_pesanan/lacakpesanan.dart';

import '../../../../../../../common/color_value.dart';
import '../../../../../../payment/keranjang/keranjang.dart';

class Detail_Riwayat_Pembelian extends StatefulWidget {
  Detail_Riwayat_Pembelian({
    Key? key,
    required this.Status,
    required this.Nama,
    required this.AlamatUser,
    required this.NoHP,
    required this.AlamatToko,
    required this.NamaToko,
    required this.GambarToko,
    required this.GambarProduk,
    required this.NamaProduk,
    required this.HargaProduk,
    required this.VarianProduk,
    required this.TotalHarga,
    required this.Ongkir,
    required this.produkId,
    required this.tokoId,
    required this.variantId,
    required this.transactionCode,
  }) : super(key: key);
  String Status;
  String Nama;
  String AlamatUser;
  String NoHP;
  String NamaToko;
  String AlamatToko;
  String GambarToko;
  List GambarProduk;
  List NamaProduk;
  List<int> HargaProduk;
  List VarianProduk;
  int TotalHarga;
  int Ongkir;
  String tokoId, transactionCode;
  List produkId, variantId;

  @override
  State<Detail_Riwayat_Pembelian> createState() =>
      _Detail_Riwayat_PembelianState();
}

class _Detail_Riwayat_PembelianState extends State<Detail_Riwayat_Pembelian> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "${widget.Status}",
          style: TextStyle(color: ColorValue.neutralColor, fontSize: 16),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset("assets/icon/arrow_left.svg"),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.transparent,
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25,
                ),
                Alamat(widget.Nama, widget.NoHP, widget.AlamatToko),
                SizedBox(
                  height: 10,
                ),
                Produk(),
                SizedBox(
                  height: 10,
                ),
                Ringkasan_Pembayaran(),
              ],
            ),
          ),
          if (widget.Status == 'Sedang diantar')
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Lacak_Button(),
            )
        ],
      ),
    );
  }

  Widget Alamat(String nama_penerima, String no_telp, String alamat) {
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

  Widget Produk() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 35,
                width: 35,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: ColorValue.neutralColor),
                child: Image.network(
                  "https://kangsayur.nitipaja.online" + widget.GambarToko,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "${widget.NamaToko}",
                style: TextStyle(
                    color: ColorValue.neutralColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ListView.builder(
            itemCount: widget.GambarProduk.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                child: Column(children: [
                  Row(children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 12),
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
                      ),
                      child: Image.network(
                        "https://kangsayur.nitipaja.online" +
                            widget.GambarProduk[index],
                        fit: BoxFit.cover,
                      ),
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
                            widget.NamaProduk[index],
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          //make this widget isVariant
                          Text(
                            "Varian : " + widget.VarianProduk[index],
                            style: TextStyle(
                                color: ColorValue.hinttext,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                          Spacer(),
                          Text(
                            "Rp. " +
                                ProdukformatNumber(widget.HargaProduk[index]) +
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

                    //make review button
                    Spacer(),
                    if (widget.Status == 'Selesai')
                      Column(
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                  color: ColorValue.primaryColor,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Mengulas(
                                                namaToko: widget.NamaToko,
                                                gambarToko:
                                                    widget.GambarToko[0],
                                                alamatToko: widget.AlamatToko,
                                                namaProduk:
                                                    widget.NamaProduk[index],
                                                gambarProduk: 'asd',
                                                productId: widget
                                                    .produkId[index]
                                                    .toString(),
                                                tokoId:
                                                    widget.tokoId.toString(),
                                                variantId: widget
                                                    .variantId[index]
                                                    .toString(),
                                                transactionCode:
                                                    widget.transactionCode)));
                                  },
                                  child: Text('Review',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500)),
                                ),
                              )),
                        ],
                      ),
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                ]),
              );
            },
          ),
          Divider(
            color: ColorValue.hinttext,
            thickness: 0.5,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Harga",
                style: TextStyle(
                    color: ColorValue.neutralColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "Rp. " + ProdukformatNumber(widget.TotalHarga) + ",00",
                style: TextStyle(
                    color: ColorValue.neutralColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget Ringkasan_Pembayaran() {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Ringkasan Pembayaran',
              style: TextStyle(
                  color: ColorValue.neutralColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500)),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: ColorValue.hinttext,
            thickness: 0.5,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Harga Produk",
                style: TextStyle(
                    color: ColorValue.neutralColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "Rp. " + ProdukformatNumber(widget.TotalHarga) + ",00",
                style: TextStyle(
                    color: ColorValue.neutralColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Ongkos Kirim",
                style: TextStyle(
                    color: ColorValue.neutralColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "Rp. " + ProdukformatNumber(widget.Ongkir) + ",00",
                style: TextStyle(
                    color: ColorValue.neutralColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ]));
  }

  Widget Lacak_Button() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Lacak_Pesanan(
                    )));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: ColorValue.primaryColor,
        ),
        child: Center(
          child: Text(
            'Lacak Pesanan',
            style: TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
