import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:kangsayur/register/register_map.dart';

import '../API/auth/Auth.dart';
import '../common/color_value.dart';
import '../validator/validator.dart';
import '../widget/textfieldcustom.dart';

class Register_Personal_Information extends StatefulWidget {
  const Register_Personal_Information(
      {Key? key, required this.email, required this.password})
      : super(key: key);

  final String email;
  final String password;

  @override
  State<Register_Personal_Information> createState() =>
      _Register_Personal_InformationState();
}

class _Register_Personal_InformationState
    extends State<Register_Personal_Information> {
  final ImagePicker _picker = ImagePicker();
  File? _imageFile = null;

  DateTime? _dateTime;

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
            initialDate: DateTime(1990),
            firstDate: DateTime(1900),
            lastDate: DateTime.now())
        .then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _phoneRealController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).viewPadding.top,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 31,
                      ),
                      const Text(
                        "Informasi Akun",
                        style: TextStyle(
                            fontSize: 24,
                            color: ColorValue.secondaryColor,
                            fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      const Text(
                        "Masukkan informasi akun anda",
                        style: TextStyle(
                            fontSize: 16,
                            color: ColorValue.neutralColor,
                            fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(
                        height: 27,
                      ),
                      GestureDetector(
                        onTap: () {
                          _showBottomSheet(context);
                        },
                        child: Center(
                          child: CircleAvatar(
                            backgroundColor: ColorValue.primaryColor,
                            radius: 50,
                            backgroundImage: _imageFile == null
                                ? null
                                : FileImage(_imageFile!) as ImageProvider,
                            child: _imageFile == null
                                ? SvgPicture.asset(
                                    "assets/icon/camera.svg",
                                    height: 40,
                                    color: Colors.white,
                                  )
                                : null,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        label: "Name",
                        controller: _nameController,
                        textInputType: TextInputType.name,
                        validator: (value) =>
                            InputValidator.nameValidator(value),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          return _bukaCalendar();
                        },
                        child: Container(
                            padding: EdgeInsets.only(left: 10),
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: ColorValue.hinttext,
                                width: 0.5,
                              ),
                            ),
                            child: Row(
                              children: [
                                Text(
                                    _dateTime == null
                                        ? "Tanggal Lahir"
                                        : DateFormat('dd-MM-yyyy')
                                            .format(_dateTime!),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    )),
                                Spacer(),
                                IconButton(
                                  onPressed: () {
                                    return _bukaCalendar();
                                  },
                                  icon: SvgPicture.asset(
                                      "assets/icon/calendar.svg"),
                                ),
                              ],
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: ColorValue.hinttext,
                            width: 0.5,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              // cannot input 0 as first number
                              if (_phoneController.text.isEmpty)
                                FilteringTextInputFormatter.deny("0"),

                            ],
                            validator: (value) =>
                                InputValidator.phoneValidator(value),
                            autofillHints: const [
                              AutofillHints.telephoneNumber
                            ],
                            maxLength: 11,
                            buildCounter: (BuildContext context,
                                    {int? currentLength,
                                    int? maxLength,
                                    bool? isFocused}) =>
                                null,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixText: "+62 ",
                              prefixStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    color: ColorValue.primaryColor,
                                  ),
                              hintText: "Masukkan No. HP",
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    color: ColorValue.hinttext,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        label: "Alamat",
                        controller: _addressController,
                        textInputType: TextInputType.streetAddress,
                        validator: (value) =>
                            InputValidator.addressValidator(value),
                        maxLines: 5,
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 37),
                        child: GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!
                                .validate()) {
                              if (_imageFile == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                    Text('Mohon pilih foto terlebih dahulu'),
                                  ),
                                );
                              }
                              if (_dateTime == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Mohon pilih tanggal lahir terlebih dahulu'),
                                  ),
                                );
                              }
                              if (_imageFile != null &&
                                  _dateTime != null) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Register_map(
                                              name: _nameController.text,
                                              image: _imageFile!,
                                              email: widget.email,
                                              password: widget.password,
                                              dateOfBirth: _dateTime!,
                                              address: _addressController.text,
                                              phone: _phoneController.text,
                                            )));
                              }}

                              else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Register_map(
                                              name: _nameController.text,
                                              image: _imageFile!,
                                              email: widget.email,
                                              password: widget.password,
                                              dateOfBirth: _dateTime!,
                                              address: _addressController.text,
                                              phone: _phoneController.text,
                                            )));
                              }},
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: ColorValue.primaryColor,
                                borderRadius: BorderRadius.circular(5)),
                            child: const Center(
                              child: Text(
                                "Lanjut",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ]),
              ),
            ),
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
