import 'package:flutter/material.dart';

class Detail_storebox extends StatefulWidget {
  const Detail_storebox({Key? key}) : super(key: key);

  @override
  State<Detail_storebox> createState() => _Detail_storeboxState();
}

class _Detail_storeboxState extends State<Detail_storebox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      height: 70,
      decoration: BoxDecoration(
        color: Color(0xfff1f1f1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/store.png",
            height: 46,
            width: 46,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Petani Medan",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                        color: Color(0xff25C570),
                        borderRadius: BorderRadius.circular(50))
                  ),
                  SizedBox(width: 5,),
                  Text(
                    "Online",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(0.5)),
                  ),
                ],
              )
            ],
          ),
          Spacer(),
          // Container(width: 110, height: 43, decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(10),
          //   border: Border.all(color: Color(0xff009245))
          // ),
          //   child: Center(child: Text("Langganan", textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xff009245)),)),
          // ),
        ],
      ),
    );
  }
}
