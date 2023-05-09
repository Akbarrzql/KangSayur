import 'package:flutter/material.dart';

class Detail_ulasan extends StatefulWidget {
  const Detail_ulasan({Key? key}) : super(key: key);

  @override
  State<Detail_ulasan> createState() => _Detail_ulasanState();
}

class _Detail_ulasanState extends State<Detail_ulasan> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          Row(children: [
            Text('Ulasan 5.0 | 30 ulasan', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
            Spacer(),
            Text('Lihat semua', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black.withOpacity(0.5)),)
          ],)
        ],
      ),
    );
  }
}
