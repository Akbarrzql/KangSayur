import 'package:flutter/material.dart';
import 'package:kangsayur/model/tokodetailmodel.dart';

class Seller_tentang extends StatefulWidget {
  Seller_tentang({Key? key, required this.tokoDetailModel}) : super(key: key);
  TokoDetailModel tokoDetailModel;

  @override
  State<Seller_tentang> createState() => _Seller_tentangState();
}

class _Seller_tentangState extends State<Seller_tentang> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25,
          ),
          _deskripsi(widget.tokoDetailModel.data.deskripsi),
          SizedBox(
            height: 20,
          ),
          Seller_info(),
          
        ],
      ),
    );
  }
  Widget _deskripsi (String deskripsi){
    return Column(
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Deskripsi",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 15,
              ),
//text deskripsi
              Text(
                "$deskripsi",
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }
  Widget _informasiToko(String alamat, String open, String close, String noTelp){
    return Column(
      children: [
        Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Informasi Toko",
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 15,
                  ),
                  InformasiToko(
                      context: context,
                        title: alamat,
                      value: "Jl. Jalan 1 sakfpsafkskfdksfkas  dakksajf asf"),
                  SizedBox(
                    height: 10,
                  ),
                  InformasiToko(
                      context: context,
                      title: "Jam Kerja",
                      value: "$open - $close"),
                  SizedBox(
                    height: 10,
                  ),
                  InformasiToko(
                      context: context,
                      title: "No Telepon",
                      value: noTelp),
                  SizedBox(
                    height: 10,
                  ),
                  //make info ulasan
                  InformasiToko(
                      context: context, title: "Ulasan", value: "100 ulasan"),
                  SizedBox(
                    height: 10,
                  ),
                  //make info transaksi
                  InformasiToko(
                      context: context,
                      title: "Transaksi",
                      value: "100 transaksi"),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 1,
                  )
                ]))

      ],
    );

  }

}

//make custom widget of informasi toko
Widget InformasiToko({
  required BuildContext context,
  required String title,
  required String value,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: MediaQuery.of(context).size.width * 0.25,
        child: Text(title, style: TextStyle(fontSize: 12)),
      ),
      Text(":",
          style: TextStyle(
            fontSize: 12,
          )),
      SizedBox(
        width: 16,
      ),
      Expanded(
        child: Text(value,
            //make text go down when over the width
            maxLines: 2,
            style: TextStyle(
              fontSize: 12,
            )),
      ),
    ],
  );
}

class Seller_deskripsi extends StatefulWidget {
  const Seller_deskripsi({Key? key}) : super(key: key);

  @override
  State<Seller_deskripsi> createState() => _Seller_deskripsiState();
}

class _Seller_deskripsiState extends State<Seller_deskripsi> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Deskripsi",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 15,
              ),
//text deskripsi
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                    "Sed euismod, diam id tincidunt dapibus, "
                    "nunc libero ultricies nunc, "
                    "ut aliquam diam mauris eget risus. "
                    "Sed euismod, diam id tincidunt dapibus, "
                    "nunc libero ultricies nunc, "
                    "ut aliquam diam mauris eget risus. "
                    "Sed euismod, diam id tincidunt dapibus, "
                    "nunc libero ultricies nunc, "
                    "ut aliquam diam mauris eget risus. "
                    "Sed euismod, diam id tincidunt dapibus, "
                    "nunc libero ultricies nunc, "
                    "ut aliquam diam mauris eget risus. "
                    "Sed euismod, diam id tincidunt dapibus, "
                    "nunc libero ultricies nunc, "
                    "ut aliquam diam mauris eget risus. "
                    "Sed euismod, diam id tincidunt dapibus, "
                    "nunc libero ultricies nunc, "
                    "ut aliquam diam mauris eget risus. "
                    "Sed euismod, diam id tincidunt dapibus, "
                    "nunc libero ultricies nunc, "
                    "ut aliquam diam mauris eget risus. ",
                maxLines: 10,
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}


class Seller_info extends StatefulWidget {
  const Seller_info({Key? key}) : super(key: key);

  @override
  State<Seller_info> createState() => _Seller_infoState();
}

class _Seller_infoState extends State<Seller_info> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Informasi Toko",
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 15,
                  ),
                  InformasiToko(
                      context: context,
                      title: "Alamat",
                      value: "Jl. Jalan 1 sakfpsafkskfdksfkas  dakksajf asf"),
                  SizedBox(
                    height: 10,
                  ),
                  InformasiToko(
                      context: context,
                      title: "Jam Kerja",
                      value: "08.00 - 17.00"),
                  SizedBox(
                    height: 10,
                  ),
                  InformasiToko(
                      context: context,
                      title: "No Telepon",
                      value: "08123456789"),
                  SizedBox(
                    height: 10,
                  ),
                  //make info ulasan
                  InformasiToko(
                      context: context, title: "Ulasan", value: "100 ulasan"),
                  SizedBox(
                    height: 10,
                  ),
                  //make info transaksi
                  InformasiToko(
                      context: context,
                      title: "Transaksi",
                      value: "100 transaksi"),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 1,
                  )
                ]))

      ],
    );
  }
}


