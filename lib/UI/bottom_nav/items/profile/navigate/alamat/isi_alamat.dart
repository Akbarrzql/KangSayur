import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kangsayur/widget/field_tambah_alamat.dart';

import '../../../../../../common/color_value.dart';

class Isi_alamat extends StatefulWidget {
  const Isi_alamat({Key? key}) : super(key: key);

  @override
  State<Isi_alamat> createState() => _Isi_alamatState();
}

class _Isi_alamatState extends State<Isi_alamat> {
  final _label_alamatController = TextEditingController();
  final _nama_penerimaController = TextEditingController();
  final _no_hp_penerimaController = TextEditingController();
  final _alamat_lengkapController = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Isi Alamat",
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
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16,
            ),
            Field_isi_alamat(
              title: "Label Alamat",
              hint: "Cth : Rumah, Kantor, Apartemen",
              icon: "",
              controller: _label_alamatController,
              keyboardType: TextInputType.text,
              iconVisible: false,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Label Alamat tidak boleh kosong';
                }
                return null;
              },
              onSaved: (value) {
                _label_alamatController.text = value!;
              },
            ),
            SizedBox(
              height: 14,
            ),
            //make field "Nama Penerima"
            Field_isi_alamat(
              title: "Nama Penerima",
              hint: "Cth : Budi Doremi",
              icon: "",
              controller: _nama_penerimaController,
              keyboardType: TextInputType.text,
              iconVisible: false,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Nama Penerima tidak boleh kosong';
                }
                return null;
              },
              onSaved: (value) {
                _nama_penerimaController.text = value!;
              },
            ),
            SizedBox(
              height: 14,
            ),
            //make field "No. HP Penerima" using icon
            Field_isi_alamat(
              title: "No. HP Penerima",
              hint: "Cth : 081234567890",
              icon: "assets/icon/contacts.svg",
              controller: _no_hp_penerimaController,
              keyboardType: TextInputType.number,
              iconVisible: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'No. HP Penerima tidak boleh kosong';
                }
                return null;
              },
              onSaved: (value) {
                _no_hp_penerimaController.text = value!;
              },
            ),
            SizedBox(
              height: 14,
            ),
            //make field "Alamat Lengkap"
            Field_isi_alamat(
              title: "Alamat Lengkap",
              hint: "Cth : Jl. Jendral Sudirman No. 1",
              icon: "",
              controller: _alamat_lengkapController,
              keyboardType: TextInputType.text,
              iconVisible: false,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Alamat Lengkap tidak boleh kosong';
                }
                return null;
              },
              onSaved: (value) {
                _alamat_lengkapController.text = value!;
              },
            ),
            SizedBox(
              height: 25,
            ),
            //make checkbox jadikan alamat utama
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Transform.scale(
                  scale: 1.4,
                  child: Checkbox(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: isChecked,
                    tristate: false,
                    //turn off hover
                    hoverColor: Colors.transparent,
                    checkColor: Colors.white,
                    visualDensity: VisualDensity.compact,
                    activeColor: ColorValue.primaryColor,

                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value??false;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 10,),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isChecked = !isChecked;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Text(
                      "Jadikan Alamat Utama",
                      style: TextStyle(
                        color: ColorValue.neutralColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            //make button "Simpan Alamat"
            Container(
              height: 50,
              margin: EdgeInsets.only(bottom: 35),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: ColorValue.primaryColor,
              ),
              child:
              Center(
                child: Text(
                  "Simpan",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              )
              ),
          ],
        ),
      ),
    );
  }
}
