import 'package:flutter/material.dart';
import 'package:kangsayur/common/color_value.dart';

class Seller_twobox extends StatefulWidget {
  const Seller_twobox({Key? key}) : super(key: key);

  @override
  State<Seller_twobox> createState() => _Seller_twoboxState();
}

class _Seller_twoboxState extends State<Seller_twobox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Container(
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
        ],
      ),
    );
  }
}
