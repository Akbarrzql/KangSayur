import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/alamat/alamat_map.dart';
import 'package:kangsayur/common/color_value.dart';

class Tambah_alamat extends StatefulWidget {
  const Tambah_alamat({Key? key}) : super(key: key);

  @override
  State<Tambah_alamat> createState() => _Tambah_alamatState();
}

class _Tambah_alamatState extends State<Tambah_alamat> {
  TextEditingController nama = TextEditingController();
  TextEditingController label = TextEditingController();
  TextEditingController no_hp = TextEditingController();
  TextEditingController alamat = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Tambah Alamat",
          style: TextStyle(color: ColorValue.neutralColor, fontSize: 16),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset("assets/icon/arrow_left.svg"),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.deny(
                  RegExp(r'\s'),
                )],
              controller: label,
              style: TextStyle(fontSize: 16, color: Colors.black),
              decoration: InputDecoration(
                  hintText: "Label Alamat",
                  hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.green))),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: nama,
              style: TextStyle(fontSize: 16, color: Colors.black),
              decoration: InputDecoration(
                  hintText: "Nama Penerima",
                  hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.green))),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: no_hp,
              style: TextStyle(fontSize: 16, color: Colors.black),
              decoration: InputDecoration(
                  hintText: "No hp",
                  hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.green))),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: alamat,
              style: TextStyle(fontSize: 16, color: Colors.black),
              decoration: InputDecoration(
                  hintText: "Alamat",
                  hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.green))),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                if (nama.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Nama tidak boleh kosong"),
                    backgroundColor: Colors.red,
                  ));
                } else if (label.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Alamat tidak boleh kosong"),
                    backgroundColor: Colors.red,
                  ));
                } else if (no_hp.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("No hp tidak boleh kosong"),
                    backgroundColor: Colors.red,
                  ));
                } else if (no_hp.text.length < 11 || no_hp.text.length > 13) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Masukkan no hp yang benar"),
                    backgroundColor: Colors.red,
                  ));
                } else if (alamat.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Alamat tidak boleh kosong"),
                    backgroundColor: Colors.red,
                  ));
                } else {
                  Navigator.pop(context);
                }
              },
              child: Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Alamat_map(
                          labelAlamat: label.text,
                          alamat: alamat.text,
                          namaPenerima: nama.text,
                          noHpPenerima: no_hp.text);
                    }));
                  },
                  child: Text(
                    "Simpan",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: ColorValue.primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
          ],
        ),
      ),
    );
  }
}
