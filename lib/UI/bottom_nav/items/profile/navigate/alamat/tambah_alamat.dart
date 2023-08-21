import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/alamat/alamat_map.dart';
import 'package:kangsayur/common/color_value.dart';
import 'package:kangsayur/validator/validator.dart';
import 'package:kangsayur/widget/textfieldcustom.dart';

class Tambah_alamat extends StatefulWidget {
  const Tambah_alamat({Key? key}) : super(key: key);

  @override
  State<Tambah_alamat> createState() => _Tambah_alamatState();
}

class _Tambah_alamatState extends State<Tambah_alamat> {
  TextEditingController nama = TextEditingController();
  TextEditingController no_hp = TextEditingController();
  TextEditingController alamat = TextEditingController();
  List<String> labeList = ['Rumah', 'Apartemen', 'Kantor', 'Kos'];

  String value = "Rumah";

  //key form
  final _formKey = GlobalKey<FormState>();

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
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - kToolbarHeight -
            MediaQuery.of(context).padding.top ,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  //dropdown
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: ColorValue.neutralColor.withOpacity(0.2))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: value,
                          icon: SvgPicture.asset("assets/icon/arrow_down.svg"),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Colors.black),
                          onChanged: (String? newValue) {
                            setState(() {
                              value = newValue!;
                            });
                          },
                          items: labeList.map<DropdownMenuItem<String>>(
                              (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400)),
                            );
                          }).toList(),
                          hint: Text(
                            "Pilih Label Alamat",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(label: 'Nama Penerima', controller: nama, validator: (value)=> InputValidator.nameValidator(value)),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    label: 'No HP',
                    controller: no_hp,
                    textInputType: TextInputType.number,
                    inputFormatter: FilteringTextInputFormatter.digitsOnly,
                    validator: (value) => InputValidator.phoneValidator(value)
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(label: 'Alamat Lengkap', controller: alamat, maxLines: 4,validator: (value)=> InputValidator.addressValidator(value)),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Alamat_map(
                              labelAlamat: value,
                              alamat: alamat.text,
                              namaPenerima: nama.text,
                              noHpPenerima: no_hp.text);
                        }));
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          color: ColorValue.primaryColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          "Simpan",
                          style:
                              TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
