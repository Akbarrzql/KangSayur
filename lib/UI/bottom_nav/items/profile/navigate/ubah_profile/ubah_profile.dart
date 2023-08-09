import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:kangsayur/API/profile/edit_profile.dart';
import 'package:kangsayur/common/color_value.dart';

class Ubah_profile extends StatefulWidget {
  Ubah_profile({
    Key? key,
    required this.name,
    required this.photo,
    required this.email,
    required this.phone_number,
    required this.tanggal_lahir,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.kelamin,
  }) : super(key: key);
  String name,
      photo,
      email,
      phone_number,
      address,
      latitude,
      longitude,
      kelamin;

  DateTime tanggal_lahir;

  @override
  State<Ubah_profile> createState() => _Ubah_profileState();
}

class _Ubah_profileState extends State<Ubah_profile> {

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


  late TextEditingController _controller_name =
  TextEditingController(text: widget.name);
  late TextEditingController _controller_email =
  TextEditingController(text: widget.email);
  late TextEditingController _controller_nohp =
  TextEditingController(text: widget.phone_number);

  // make variable controller for jenis kelamin
  late TextEditingController _controller_jeniskelamin =
  TextEditingController(text: "Pria");

  late DateTime _dateTime = widget.tanggal_lahir;

  void _bukaCalendar() {
    showDatePicker(
        builder: (context, child) {
          return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: ColorValue.primaryColor,
                  onPrimary: Colors.white,
                  onSurface: Colors.black,
                ),
                textTheme: TextTheme(
                  bodyText1: TextStyle(color: Colors.black),
                  bodyText2: TextStyle(color: Colors.black),
                  button: TextStyle(color: Colors.white),
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(),
                ),
              ),
              child: child!);
        },
        context: context,
        initialDate: _dateTime,
        firstDate: DateTime(1900),
        lastDate: DateTime.now())
        .then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xfff2f2f2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Ubah Profil",
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
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              Container(height: MediaQuery.of(context).size.height,),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 24,
                    ),
                    Center(
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Stack(
                          children: [
                            if (_imageFile != null)
                              Container(
                                clipBehavior: Clip.antiAlias,
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Image.file(
                                  _imageFile!,
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 100,
                                ),
                              )
                            else
                              Container(
                                clipBehavior: Clip.antiAlias,
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Image.network(
                                  "https://kangsayur.nitipaja.online" + widget.photo,
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                            GestureDetector(
                              onTap: () {
                                _showBottomSheet(context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.black.withOpacity(0.20),
                                ),
                              ),
                            ),
                            Center(
                              child: SvgPicture.asset(
                                "assets/icon/camera.svg",
                                width: 30,
                                height: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Akbar Rizqullah",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                    Text(
                      "akbarrizqullah228@gmail.com",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color(0xffA0A0A0)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _Form(
                        label: "Nama",
                        controller: _controller_name,
                        keyboardType: TextInputType.name,
                        readOnly: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        }),
                    SizedBox(
                      height: 10,
                    ),
                    _Form(
                        label: "Email",
                        controller: _controller_email,
                        keyboardType: TextInputType.emailAddress,
                        readOnly: false,
                        validator: (value) {
                          //if not contain @
                          if (!value!.contains('@')) {
                            return 'Please enter a valid email address';
                          }
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        }),
                    SizedBox(
                      height: 10,
                    ),
                    _Form(
                        label: "No Handphone",
                        controller: _controller_nohp,
                        keyboardType: TextInputType.phone,
                        readOnly: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          if (value!.length < 10 || value.length > 13) {
                            return 'Please enter a valid phone number';
                          }
                        }),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Jenis Kelamin",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                        )),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Color(0xff35363B),
                        ),
                      ),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(0xffA0A0A0)),
                        ),
                        value: _controller_jeniskelamin.text,
                        onChanged: (String? newValue) {
                          setState(() {
                            _controller_jeniskelamin.text = newValue!;
                          });
                        },
                        items: <String>['Pria', 'Wanita'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Color(0xff35363B),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Tanggal Lahir",
                          style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 10),
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Color(0xff35363B),
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                                _dateTime == null
                                    ? '23-11-2023'
                                    : DateFormat('dd-MM-yyyy').format(_dateTime),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                )),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                return _bukaCalendar();
                              },
                              icon: SvgPicture.asset("assets/icon/calendar.svg"),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    print(_imageFile);
                    if (_formKey.currentState!.validate()) {
                      Edit_Profile.edit(
                          _controller_name.text,
                          _imageFile,
                          _controller_email.text,
                          _controller_nohp.text,
                          widget.address,
                          _dateTime.toString(),
                          widget.latitude,
                          widget.longitude,
                          context);
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 37),
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xff009245),
                    ),
                    child: Center(
                      child: Text("Simpan",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
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
                  style: Theme
                      .of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(
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
                            Theme
                                .of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(
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
                            Theme
                                .of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(
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

  Widget _Form({
    required String label,
    required TextEditingController controller,
    required TextInputType keyboardType,
    required bool readOnly,
    //make variable for validator
    required FormFieldValidator validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 6,
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Color(0xff35363B),
            ),
          ),
          child: TextFormField(
              validator: validator,
              controller: controller,
              keyboardType: keyboardType,
              readOnly: readOnly,
              decoration: InputDecoration(
                contentPadding:
                EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                border: InputBorder.none,
                hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Color(0xffA0A0A0)),
              ),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              )),
        ),
      ],
    );
  }

}

