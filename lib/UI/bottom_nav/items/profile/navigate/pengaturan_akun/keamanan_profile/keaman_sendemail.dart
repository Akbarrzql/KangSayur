import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kangsayur/API/auth/Auth.dart';

import '../../../../../../../common/color_value.dart';

class KeamananSendEmail extends StatefulWidget {
  const KeamananSendEmail({Key? key}) : super(key: key);

  @override
  State<KeamananSendEmail> createState() => _KeamananSendEmailState();
}

class _KeamananSendEmailState extends State<KeamananSendEmail> {
  bool isLoading = false;
  bool isSend = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Keamanan Akun",
          style: TextStyle(color: ColorValue.neutralColor, fontSize: 16),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset("assets/icon/arrow_left.svg"),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Untuk mengubah kata sandi, kami akan mengirimkan link ke email kamu",
              style: TextStyle(fontSize: 14, color: ColorValue.neutralColor),
            ),
            const SizedBox(
              height: 25,
            ),
            if (isLoading)
              Container(
                width: MediaQuery.of(context).size.width * 0.35,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5)),
                child: const Center(
                  child: Text(
                    "Kirim Link",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            else
              GestureDetector(
                onTap: () async {
                  setState(() {
                    isLoading = true;
                  });
                  await Auth.sendEmailResetPassword(context).then((value) => {
                        if (value)
                          {
                            setState(() {
                              isSend = true;
                            })
                          }
                      });
                  setState(() {
                    isLoading = false;
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: 40,
                  decoration: BoxDecoration(
                      color: ColorValue.primaryColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Center(
                    child: Text(
                      "Kirim Link",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            SizedBox(
              height: 25,
            ),
            if (isSend)
              const Text(
                "Link telah dikirim ke email kamu!",
                style: TextStyle(
                    fontSize: 14,
                    color: ColorValue.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
