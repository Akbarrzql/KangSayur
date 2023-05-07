import 'package:flutter/material.dart';

class Dikunjungi_list extends StatefulWidget {
  const Dikunjungi_list({Key? key}) : super(key: key);

  @override
  State<Dikunjungi_list> createState() => _Dikunjungi_listState();
}

class _Dikunjungi_listState extends State<Dikunjungi_list> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 0, right: 24),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: 1,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.fromLTRB(24, 0, 0, 10),
          height: 153,
          width: 119,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                height: 112,
                width: 119,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Center(
                  child: Image.asset(
                    "assets/images/dikunjungi.png",
                    width: 68,
                    height: 68,
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Text("Selada Kudus",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600
              ),
              )
            ],
          ),
        );
      },
    );
  }
}
