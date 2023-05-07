import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../common/color_value.dart';

class otpForm extends StatefulWidget {
  const otpForm({Key? key}) : super(key: key);

  @override
  State<otpForm> createState() => _otpFormState();
}

class _otpFormState extends State<otpForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Form(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                width: 63,
              child: TextFormField(
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff1e1e1e).withOpacity(0.75)),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
              ),
              Container(
                height: 50,
                width: 63,
                child: TextFormField(
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    } if (value.length == 0) {
                      FocusScope.of(context).previousFocus();
                    }
                  },
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff1e1e1e).withOpacity(0.75)),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
              ),
              Container(
                height: 50,
                width: 63,
                child: TextFormField(
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    } if (value.length == 0) {
                      FocusScope.of(context).previousFocus();
                    }
                  },
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff1e1e1e).withOpacity(0.75)),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
              ),
              Container(
                height: 50,
                width: 63,
                child: TextFormField(
                  onChanged: (value) {
                     if (value.length == 0) {
                      FocusScope.of(context).previousFocus();
                    }
                  },
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff1e1e1e).withOpacity(0.75)),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 38,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Belum menerima kode?",
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff1e1e1e).withOpacity(0.75),
                  fontWeight: FontWeight.w400),
            ),
            Text(
              " 30 Detik",
              style: TextStyle(
                  fontSize: 16,
                  color: ColorValue.primaryColor,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ],
    );
  }
}
