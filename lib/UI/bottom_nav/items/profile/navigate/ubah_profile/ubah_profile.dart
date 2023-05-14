import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:kangsayur/common/color_value.dart';

class Ubah_profile extends StatefulWidget {
  const Ubah_profile({Key? key}) : super(key: key);

  @override
  State<Ubah_profile> createState() => _Ubah_profileState();
}

class _Ubah_profileState extends State<Ubah_profile> {
  TextEditingController _controller_name =
      TextEditingController(text: "Akbar Rizqullah");
  TextEditingController _controller_email =
      TextEditingController(text: "akbarrizqullah228@gmail.com");
  TextEditingController _controller_nohp =
      TextEditingController(text: "081347464743");

  // make variable controller for jenis kelamin
  TextEditingController _controller_jeniskelamin =
      TextEditingController(text: "Pria");

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
                      style: TextButton.styleFrom(
                          ),
                    ),
                  ),
                  child: child!);
            },
            context: context,
            initialDate: DateTime.now().add(new Duration(days: 3)),
            firstDate: DateTime.now().add(new Duration(days: 3)),
            lastDate: DateTime.now().add(new Duration(days: 14)))
        .then((value) {
      setState(() {
        _dateTime = value;
      });
    });
  }

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
                    Image.asset(
                      "assets/images/profile.png",
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.black.withOpacity(0.20),
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
                  return null;
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
                    child: Text(value, style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Color(0xff35363B),
                    ),),
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
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
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
                    Text(_dateTime == null
                        ? '23-11-2023'
                        : DateFormat('dd-MM-yyyy').format(_dateTime!), style: TextStyle(
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
            Spacer(),
            Container(
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
            )
          ],
        ),
      ),
    );
  }
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
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            border: InputBorder.none,
            hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Color(0xffA0A0A0)),
          ),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
          )
        ),
      ),
    ],
  );
}
