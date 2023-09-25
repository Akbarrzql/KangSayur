import 'package:flutter/material.dart';
import 'package:kangsayur/common/color_value.dart';

import '../../API/chat/chat.dart';

class Seller_twobox extends StatefulWidget {
  final VoidCallback onTap;
   Seller_twobox({Key? key, required this.onTap}) : super(key: key);

  @override
  State<Seller_twobox> createState() => _Seller_twoboxState();
}

class _Seller_twoboxState extends State<Seller_twobox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GestureDetector(
        onTap: () {
          widget.onTap();
        },
        child: Container(
          width: MediaQuery.of(context).size.width- 48,
          height: 32,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            border: Border.all(color: ColorValue.primaryColor)
          ),
          child: Center(
            child: Text("Chat", style: TextStyle(fontSize: 14, color: ColorValue.primaryColor),),
          ),
        ),
      ),
    );
  }
}
