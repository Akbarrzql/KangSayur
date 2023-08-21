import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kangsayur/API/mengulas/mengulas_post.dart';
import 'package:kangsayur/widget/card_mengulas.dart';

import '../../../../../../../../../common/color_value.dart';

class Mengulas extends StatefulWidget {
  Mengulas({
    Key? key,
    required this.namaToko,
    required this.gambarToko,
    required this.alamatToko,
    required this.namaProduk,
    required this.gambarProduk,
    required this.productId,
    required this.tokoId,
    required this.variantId,
    required this.transactionCode,
  }) : super(key: key);
  String namaToko,
      gambarToko,
      alamatToko,
      namaProduk,
      gambarProduk,
      productId,
      tokoId,
      variantId,
      transactionCode;

  double rating = 0;
  String comment = "";

  @override
  State<Mengulas> createState() => _MengulasState();
}

class _MengulasState extends State<Mengulas> {
  bool _isLoading = false;
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  //textediting controller
  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Mengulas",
          style: TextStyle(color: ColorValue.neutralColor, fontSize: 16),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset("assets/icon/arrow_left.svg"),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - //statusbar
              MediaQuery.of(context).padding.top - //appbar
              kToolbarHeight,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Head_mengulas(
                nama_seller: widget.namaToko,
                alamat_seller: widget.alamatToko,
                profil_seller: widget.gambarToko,
              ),
              const SizedBox(
                height: 20,
              ),
              // Card_mengulas(
              //     gambar_produk: "assets/images/wortel.png",
              //     nama_produk: widget.namaProduk,
              //     nama_seller: widget.namaToko),
              card_mengulas(
                  gambar_produk: widget.gambarProduk,
                  nama_seller: widget.namaToko,
                  alamat_seller: widget.alamatToko),
              Spacer(),
              if (_isLoading)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 35),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5)),
                    height: 50,
                    child: const Center(
                      child: Text(
                        "Kirim Ulasan",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                  ),
                )
              else
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: GestureDetector(
                    onTap: () async {
                      if (widget.rating == 0.0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Rating tidak boleh kosong"),
                          ),
                        );
                        return;
                      }
                      if (commentController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Komentar tidak boleh kosong"),
                          ),
                        );
                        return;
                      } else {
                        setState(() {
                          _isLoading = true;
                        });
                        print(_imageFile);
                        await Mengulas_post.mengulas(
                            widget.rating.toString(),
                            _imageFile,
                            commentController.text,
                            widget.productId,
                            widget.tokoId,
                            widget.variantId,
                            widget.transactionCode,
                            context);

                        setState(() {
                          _isLoading = false;
                        });
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 35),
                      decoration: BoxDecoration(
                          color: ColorValue.primaryColor,
                          borderRadius: BorderRadius.circular(5)),
                      height: 50,
                      child: const Center(
                        child: Text(
                          "Kirim Ulasan",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),

              //make button "Kirim Ulasan" height 50
            ],
          ),
        ),
      ),
    );
  }

  Widget card_mengulas(
      {required String gambar_produk,
      required String nama_seller,
      required String alamat_seller}) {
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 24),
      //padding horizontal 22 vertical 15
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Image.network(
                  'https://kangsayur.nitipaja.online' + widget.gambarProduk,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 17,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //nama produk
                  Text(
                    widget.namaProduk,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: ColorValue.neutralColor),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  //nama seller
                  Text(
                    widget.namaToko,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: ColorValue.hinttext),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //text rating (number) and rating (text)
                  Text(
                    "${widget.rating.toStringAsFixed(1)}",
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: ColorValue.neutralColor),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Rating",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: ColorValue.hinttext),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              RatingBar.builder(
                  initialRating: widget.rating,
                  minRating: 0,
                  direction: Axis.horizontal,
                  itemSize: 30,
                  glow: false,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 6),
                  itemBuilder: (context, _) =>
                      SvgPicture.asset("assets/icon/star.svg"),
                  onRatingUpdate: (ratingNew) {
                    setState(() {
                      widget.rating = ratingNew;
                      print(ratingNew);
                    });
                  }),
            ],
          ),
          // text ceritakan pengalamanmu size 14 w600
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Ceritakan pengalamanmu",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: ColorValue.neutralColor),
          ),
          const SizedBox(
            height: 5,
          ),
          //textfield inside container back color F6F6F6 height 122
          Container(
            height: 122,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: const Color(0xfff6f6f6),
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              maxLines: 5,
              controller: commentController,
              onChanged: (value) {
                setState(() {
                  value = commentController.text;
                });
              },
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: ColorValue.neutralColor),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Ceritakan pengalamanmu",
                hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: ColorValue.hinttext),
              ),
            ),
          ),
          //make container for button height 54 color primary inside is row icon and text
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              _showBottomSheet(context);
            },
            child: Container(
              height: 54,
              decoration: BoxDecoration(
                color: ColorValue.primaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icon/camera.svg"),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Tambahkan Foto",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          if (_imageFile != null)
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: FileImage(_imageFile!),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 5,
                    right: 5,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _imageFile = null;
                        });
                      },
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Icon(
                          Icons.close,
                          size: 15,
                          color: ColorValue.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 150,
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Text(
                  "Pilih Foto",
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: ColorValue.neutralColor,
                      ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _getImage(ImageSource.camera);
                        Navigator.pop(context);
                      },
                      child: Column(
                        children: [
                          const Icon(
                            Icons.camera_alt_outlined,
                            color: ColorValue.primaryColor,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Kamera",
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: ColorValue.neutralColor,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _getImage(ImageSource.gallery);
                        Navigator.pop(context);
                      },
                      child: Column(
                        children: [
                          const Icon(
                            Icons.photo_outlined,
                            color: ColorValue.primaryColor,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Galeri",
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: ColorValue.neutralColor,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
