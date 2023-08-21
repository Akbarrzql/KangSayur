import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kangsayur/API/auth/Auth.dart';
import 'package:kangsayur/API/otp/otp.dart';
import 'package:kangsayur/common/color_value.dart';
import 'package:kangsayur/login/login.dart';
import 'package:kangsayur/register/otp.dart';
import 'package:kangsayur/register/register_personal_information.dart';
import 'package:kangsayur/validator/validator.dart';
import 'package:kangsayur/widget/textfieldcustom.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // circle progress
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).viewPadding.top,
                child: Form(
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        CustomTextFormField(
                          label: "Email",
                          controller: _emailController,
                          textInputType: TextInputType.emailAddress,
                          validator: (value) =>
                              InputValidator.emailValidator(value),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //make duplicate textfield for name
                        CustomTextFormField(
                          label: "Password",
                          isPassword: true,
                          controller: _passwordController,
                          validator: (value) =>
                              InputValidator.passwordValidator(value),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                          label: "Confirm Password",
                          isPassword: true,
                          controller: _confirmPasswordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Confirm Password tidak boleh kosong";
                            } else if (value !=
                                _passwordController.text.toString()) {
                              return "Confirm Password tidak sama";
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
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
                        if (_isLoading)
                          _loading(),
                        if (!_isLoading)
                          Padding(
                            padding: EdgeInsets.only(bottom: 37),
                            child: GestureDetector(
                              onTap: () async {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  await Auth.emailVerify(_emailController.text,
                                      _passwordController.text, context);
                                  setState(() {
                                    _isLoading = false;
                                  });
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
            ),
          ),
        ));
  }
  Widget _loading(){
    return Container(
      margin: const EdgeInsets.only(bottom: 37),
      height: 50,
      decoration: BoxDecoration(
          color: Colors.grey,
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
    );
  }
}
