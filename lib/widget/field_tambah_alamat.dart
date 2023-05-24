import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kangsayur/common/color_value.dart';

class Field_isi_alamat extends StatefulWidget {
  const Field_isi_alamat({Key? key, required this.title, required this.hint, required this.icon, required this.controller, this.validator, this.onSaved, required this.keyboardType, this.height, required this.iconVisible,}) : super(key: key);
  // required title, hint, icon, controller, validator, onSaved, keyboardType
  final String title;
  final String hint;
  final bool iconVisible;
  final String icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextInputType keyboardType;
  final double? height;


  @override
  State<Field_isi_alamat> createState() => _Field_isi_alamatState();
}

class _Field_isi_alamatState extends State<Field_isi_alamat> {
  // required title, hint, icon, controller, validator, onSaved, keyboardType

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 14,
            color: ColorValue.neutralColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Container(
          height: widget.height ?? 50,
          decoration: BoxDecoration(
            color: Color(0xffF6F6F6),
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: TextFormField(
            controller: widget.controller,
            validator: widget.validator,
            onSaved: widget.onSaved,
            keyboardType: widget.keyboardType,
            style: TextStyle(
              fontSize: 14,
              color: ColorValue.neutralColor,
            ),
            decoration: InputDecoration(
              suffixIcon: widget.iconVisible ? Padding(
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(
                  widget.icon,
                ),
              ) : null,
              hintText: widget.hint,
              hintStyle: TextStyle(
                fontSize: 14,
                color: ColorValue.hinttext,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
