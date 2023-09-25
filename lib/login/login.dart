import 'package:flutter/material.dart';
import 'package:kangsayur/UI/bottom_nav/bottom_nav.dart';
import 'package:kangsayur/UI/bottom_nav/items/home/home.dart';
import 'package:kangsayur/common/color_value.dart';
import 'package:kangsayur/model/loginmodel.dart';
import 'package:kangsayur/register/register.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../API/auth/Auth.dart';
import '../firebase/firebase_messaging.dart';
import '../validator/validator.dart';
import '../widget/textfieldcustom.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // circle progress
  bool _isLoading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 31,
              ),
              const Text(
                "Masuk",
                style: TextStyle(
                    fontSize: 24,
                    color: ColorValue.secondaryColor,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 13,
              ),
              const Text(
                "Selamat datang kembali!",
                style: TextStyle(
                    fontSize: 16,
                    color: ColorValue.neutralColor,
                    fontWeight: FontWeight.w800),
              ),
              const Text(
                "Anda telah dirindukan",
                style: TextStyle(
                    fontSize: 16,
                    color: ColorValue.neutralColor,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 37,
              ),
              CustomTextFormField(
                label: "Email",
                controller: _emailController,
              ),
              SizedBox(
                height: 20,
              ),
              //make container for password like before
              CustomTextFormField(
                label: "Password",
                isPassword: true,
                controller: _passwordController,
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Belum punya akun? ",
                      style: TextStyle(
                          fontSize: 16,
                          color: ColorValue.secondaryColor,
                          fontWeight: FontWeight.normal)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Register()));
                    },
                    child: Text("Daftar",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF3D5A80),
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              if (_isLoading == true)
                _Loading()
              else
                GestureDetector(
                  onTap: () async {
                    setState(() {
                      //close keyboard
                      FocusScope.of(context).unfocus();
                      _isLoading = true;
                    });
                    String? deviceToken = await FirebaseNotificationManager.getToken();
                    print('Device Token: $deviceToken');

                    await Auth.login(
                        context, _emailController, _passwordController, deviceToken!).then((value) {
                    if (value == true) {
                      print('Login Success');
                      Auth.deviceToken(_emailController.text,
                          _passwordController.text, deviceToken, context);
                    }
                    });
                    setState(() {
                      _isLoading = false;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 37),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: ColorValue.primaryColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: const Center(
                        child: Text(
                          "Masuk",
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
        ));
  }

  Widget _Loading() {
    return Padding(
      padding: EdgeInsets.only(bottom: 37),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(5)),
        child: const Center(
          child: Text(
            "Masuk",
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
