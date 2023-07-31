import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kangsayur/common/color_value.dart';
import 'package:kangsayur/login/login.dart';
import 'package:kangsayur/register/otp.dart';
import 'package:kangsayur/register/otp_form.dart';
import 'package:kangsayur/register/set_password.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child:
                Form(
                  key: _formKey,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                  height: 31,
              ),
              const Text(
                  "Buat Akun",
                  style: TextStyle(
                      fontSize: 24,
                      color: ColorValue.secondaryColor,
                      fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                  height: 13,
              ),
              const Text(
                  "Selamat datang!",
                  style: TextStyle(
                      fontSize: 16,
                      color: ColorValue.neutralColor,
                      fontWeight: FontWeight.w800),
              ),
              const Text(
                  "Mulai belanja produk segar",
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
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        //validasi email
                        if (value!.isEmpty) {
                          return 'Email tidak boleh kosong';
                        } else if (!value.contains('@')) {
                          return 'Email tidak valid';
                        }
                      },
                      controller: _emailController,
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF3D5A80),
                          fontWeight: FontWeight.normal),
                      decoration: InputDecoration(
                        hintText: "Masukkan Email atau No. Handphone",
                        hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFB6B6B6),
                            fontWeight: FontWeight.normal),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
              ),
              const SizedBox(
                  height: 20,
              ),
              //make duplicate textfield for name
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
                    child: TextFormField(
                      controller: _nameController,
                      validator: (value) {
                        //validasi nama
                        if (value!.isEmpty) {
                          return 'Nama tidak boleh kosong';
                        }
                      },
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF3D5A80),
                          fontWeight: FontWeight.normal),
                      decoration: InputDecoration(
                        hintText: "Username",
                        hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFB6B6B6),
                            fontWeight: FontWeight.normal),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
              ),

              Spacer(),
              const SizedBox(
                  height: 10,
              ),
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
                                builder: (context) => const Login()));
                      },
                      child: Text("Masuk",
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
              Padding(
                  padding: EdgeInsets.only(bottom: 37),
                  child: GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Set_Password(
                                    email: _emailController.text,
                                    name: _nameController.text)));
                      }
                    },
                    // onTap: () => Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => Set_Password(
                    //             email: _emailController.text,
                    //             name: _nameController.text))),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: ColorValue.primaryColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: const Center(
                        child: Text(
                          "Daftar",
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
        ));
  }

}
