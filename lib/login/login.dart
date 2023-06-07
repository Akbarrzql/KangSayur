import 'package:flutter/material.dart';
import 'package:kangsayur/UI/bottom_nav/bottom_nav.dart';
import 'package:kangsayur/UI/bottom_nav/items/home/home.dart';
import 'package:kangsayur/common/color_value.dart';
import 'package:kangsayur/model/loginmodel.dart';
import 'package:kangsayur/register/register.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../API/auth/Auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _loginProcess() async {
    Auth.login(context, _emailController, _passwordController);
  }

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
              Container(
                height: 50,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset:
                            const Offset(0, 1), // changes position of shadow
                      ),
                    ],
                    color: const Color(0xFFF6F6F6),
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: TextField(
                    controller: _emailController,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                    decoration: InputDecoration(
                      hintText: "Masukkan Email atau No. Handphone",
                      hintStyle: TextStyle(
                          fontSize: 16,
                          color: ColorValue.hinttext,
                          fontWeight: FontWeight.normal),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //make container for password like before
              Container(
                height: 50,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset:
                            const Offset(0, 1), // changes position of shadow
                      ),
                    ],
                    color: const Color(0xFFF6F6F6),
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: TextField(
                    controller: _passwordController,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                    decoration: InputDecoration(
                      hintText: "Masukkan Password",
                      hintStyle: TextStyle(
                          fontSize: 16,
                          color: ColorValue.hinttext,
                          fontWeight: FontWeight.normal),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sudah punya akun? ",
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
              GestureDetector(
                onTap: () {
                  _loginProcess();
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
}
