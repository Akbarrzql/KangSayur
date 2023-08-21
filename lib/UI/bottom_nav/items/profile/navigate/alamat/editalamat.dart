import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/alamat/editalamat_map;.dart';
import 'package:kangsayur/model/alamatmodel.dart';
import 'package:kangsayur/widget/textfieldcustom.dart';

import '../../../../../../common/color_value.dart';
import '../../../../../../validator/validator.dart';

class EditAlamat extends StatefulWidget {
  EditAlamat({Key? key, required this.index, required this.alamat})
      : super(key: key);
  final int index;
  final AlamatModel alamat;

  @override
  State<EditAlamat> createState() => _EditAlamatState();
}

class _EditAlamatState extends State<EditAlamat> {
  List<String> labeList = ['Rumah', 'Apartemen', 'Kantor', 'Kos'];
  late String value = widget.alamat.name[widget.index].labelAlamat;

  //textfield controller for nama, address, phone number
  late TextEditingController _namaController = TextEditingController();
  late TextEditingController _addressController = TextEditingController();
  late TextEditingController _phoneController = TextEditingController();

  late String _alamatStatus = widget.alamat.name[widget.index].prioritasAlamat;

  //switch
  bool isSwitched = false;

  //key
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.alamat.name[widget.index].prioritasAlamat);
    if (widget.alamat.name[widget.index].prioritasAlamat == "Utama")
      isSwitched = true;
    _namaController.text = widget.alamat.name[widget.index].namaPenerima;
    _addressController.text = widget.alamat.name[widget.index].alamatLengkap;
    _phoneController.text = widget.alamat.name[widget.index].nomorHp.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Ubah Alamat",
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
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          height: MediaQuery.of(context).size.height -
              kToolbarHeight -
              MediaQuery.of(context).padding.top,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                //dropdown
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: ColorValue.neutralColor.withOpacity(0.2))),
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
                        items: labeList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400)),
                          );
                        }).toList(),
                        hint: const Text(
                          "Pilih Label Alamat",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                    label: 'Nama Penerima',
                    controller: _namaController,
                    validator: (value) => InputValidator.nameValidator(value)),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                    label: 'No HP',
                    controller: _phoneController,
                    textInputType: TextInputType.number,
                    inputFormatter: FilteringTextInputFormatter.digitsOnly,
                    validator: (value) => InputValidator.phoneValidator(value)),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                    label: 'Alamat Lengkap',
                    controller: _addressController,
                    maxLines: 4,
                    validator: (value) => InputValidator.addressValidator(value)),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text(
                      "Jadikan Alamat Utama",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: ColorValue.neutralColor),
                    ),
                    const Spacer(),
                    FlutterSwitch(
                      value: isSwitched,
                      width: 40,
                      height: 20,
                      inactiveSwitchBorder: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                      activeSwitchBorder: Border.all(
                        color: Colors.white,
                        width: 0,
                      ),
                      inactiveColor: Colors.white,
                      inactiveToggleBorder: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                      activeToggleBorder: Border.all(
                        color: Colors.white,
                        width: 0,
                      ),
                      activeColor: ColorValue.primaryColor,
                      toggleSize: 12,
                      onToggle: (value) {
                        setState(() {
                          if (widget.alamat.name[widget.index].prioritasAlamat !=
                              "Utama"){
                          isSwitched = value;
                          print(isSwitched);
                          if (isSwitched == true) {
                            _alamatStatus = "Utama";
                          } else {
                            _alamatStatus = "Tambahan";
                          }}
                        });
                      },
                    ),
                  ],
                ),
                const Spacer(),

                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return EditAlamatMap(
                            alamatId: widget.alamat.name[widget.index].id,
                            labelAlamat: value,
                            alamat: _addressController.text,
                            namaPenerima: _namaController.text,
                            noHpPenerima: _phoneController.text,
                          latitude: widget.alamat.name[widget.index].latitude,
                          longitude: widget.alamat.name[widget.index].longitude,
                          prioritasAlamat: _alamatStatus,
                        );
                      }));
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        color: ColorValue.primaryColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Center(
                      child: Text(
                        "Simpan",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
