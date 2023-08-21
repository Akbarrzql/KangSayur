import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kangsayur/UI/bottom_nav/items/profile/navigate/inbox/navigate/ulasan_anda/detail_ulasan/detail_ulasan.dart';
import 'package:kangsayur/model/historyreviewmodel.dart';
import 'package:kangsayur/widget/list_riwayat_ulasan.dart';

import '../../../../../../../../bloc/historyreview_bloc/historyreview_bloc.dart';
import '../../../../../../../../bloc/historyreview_bloc/historyreview_event.dart';
import '../../../../../../../../bloc/historyreview_bloc/historyreview_states.dart';

class Riwayat_ulasan extends StatefulWidget {
  const Riwayat_ulasan({Key? key, required this.historyReviewModel})
      : super(key: key);
  final HistoryReviewModel historyReviewModel;

  @override
  State<Riwayat_ulasan> createState() => _Riwayat_ulasanState();
}

class _Riwayat_ulasanState extends State<Riwayat_ulasan> {
  //bloc

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _riwayatList(widget.historyReviewModel),
      ],
    );
  }

  Widget _riwayatList(HistoryReviewModel history) {
    return Expanded(
      child: ListView.builder(
        itemCount: history.data!.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: GestureDetector(
              onTap: () {
                if (history.data![index].direply == "true")
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Detail_ulasan()));
              },
              child: List_riwayatulasan(
                gambar: history.data![index].gambar.toString(),
                produk: history.data![index].namaProduk.toString(),
                rating: history.data![index].rating,
                tanggal: DateFormat("dd MM yyyy").format(DateTime.parse(
                    history.data![index].tanggalReview.toString())),
                ulasan: history.data![index].comment.toString(),
                balas: history.data![index].direply == "true" ? true : false,
                banyak_balas: 1, gambarReview: widget.historyReviewModel.data![index].gambarReview.toString(),
              ),
            ),
          );
        },
      ),
    );
  }
}
