import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kangsayur/API/otp/otp.dart';

import '../common/color_value.dart';

class otpForm extends StatefulWidget {
  const otpForm({Key? key, required this.email, required this.password})
      : super(key: key);
  final String email;
  final String password;

  @override
  State<otpForm> createState() => _otpFormState();
}

class _otpFormState extends State<otpForm> {
  final TextEditingController _otp1Controller = TextEditingController();
  final TextEditingController _otp2Controller = TextEditingController();
  final TextEditingController _otp3Controller = TextEditingController();
  final TextEditingController _otp4Controller = TextEditingController();

  int _start = 30;
  bool _isTimerRunning = false;
  late Timer _timer;

  // circle progress
  bool _isLoading = false;

  //starttimer
  void startTimer() {
    _isTimerRunning = true;
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            _isTimerRunning = false;
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    String otp = _otp1Controller.text +
        _otp2Controller.text +
        _otp3Controller.text +
        _otp4Controller.text;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Form(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                width: 63,
                child: TextFormField(
                  controller: _otp1Controller,
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xff1e1e1e).withOpacity(0.75)),
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
                  controller: _otp2Controller,
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                    if (value.length == 0) {
                      FocusScope.of(context).previousFocus();
                    }
                  },
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xff1e1e1e).withOpacity(0.75)),
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
                  controller: _otp3Controller,
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                    if (value.length == 0) {
                      FocusScope.of(context).previousFocus();
                    }
                  },
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xff1e1e1e).withOpacity(0.75)),
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
                  controller: _otp4Controller,
                  onChanged: (value) {
                    if (value.length == 0) {
                      FocusScope.of(context).previousFocus();
                    }
                  },
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xff1e1e1e).withOpacity(0.75)),
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
        const SizedBox(
          height: 38,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Belum menerima kode?",
              style: TextStyle(
                  fontSize: 16,
                  color: const Color(0xff1e1e1e).withOpacity(0.75),
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              width: 5,
            ),
            if (_isTimerRunning)
              Text("$_start",
                  style: TextStyle(
                      fontSize: 16,
                      color: ColorValue.primaryColor.withOpacity(0.75),
                      fontWeight: FontWeight.w400))
            else
              GestureDetector(
                onTap: () {
                  setState(() {
                    _start = 30;
                  });
                  startTimer();
                },
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isTimerRunning = true;
                      _start = 30;
                    });
                    OTPfunc.otpSend(widget.email);
                    startTimer();
                  },
                  child: Text(
                    "Kirim ulang",
                    style: TextStyle(
                        fontSize: 16,
                        color: ColorValue.primaryColor.withOpacity(0.75),
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
          ],
        ),
        const Spacer(),
        if (_isLoading) _loading(),
        if (!_isLoading)
          Padding(
            padding: const EdgeInsets.only(bottom: 37),
            child: GestureDetector(
              onTap: () async {
                print(otp);
                setState(() {
                  _isLoading = true;
                });
                await OTPfunc.otpVerify(
                    widget.email, otp, widget.password, context);
                setState(() {
                  _isLoading = false;
                });
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: ColorValue.primaryColor,
                    borderRadius: BorderRadius.circular(5)),
                child: const Center(
                  child: Text(
                    "Verifikasi",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _loading() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 37),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(5)),
        child: const Center(
          child: Text(
            "Verifikasi",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
