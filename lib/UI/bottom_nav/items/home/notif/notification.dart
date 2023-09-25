import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kangsayur/bloc/notifikasilist_bloc/notifikasilist_bloc.dart';
import 'package:kangsayur/bloc/notifikasilist_bloc/notifikasilist_event.dart';
import 'package:kangsayur/model/notifikasilistmodel.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../../bloc/notifikasilist_bloc/notifikasilist_state.dart';
import '../../../../../common/color_value.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  NotifikasiListBloc _notifikasiListBloc = NotifikasiListBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _notifikasiListBloc.add(GetNotifikasiListList());
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Notifikasi',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: ColorValue.neutralColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: ColorValue.neutralColor,
            ),
          ),
        ),
        body: Column(
          children: [
            SafeArea(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Terbaru",
                      style: textTheme.headline6!.copyWith(
                        color: ColorValue.neutralColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 16),
                    BlocBuilder<NotifikasiListBloc, NotifikasiListState>(
                      bloc: _notifikasiListBloc,
                      builder: (context, state) {
                        if (state is NotifikasiListLoading) {
                          return _NotifListLoading();
                        } else if (state is NotifikasiListLoaded) {
                          return _NotifList(state.notifikasiList);
                        } else if (state is NotifikasiListError) {
                          return const Center(
                            child: Text("Error"),
                          );
                        } else {
                          return const Center(
                            child: Text("Error"),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Widget _NotifList(NotifikasiListModel notifikasiListModel) {
    String formatTanggal(DateTime tanggal) {
      final sekarang = DateTime.now();
      final selisih = sekarang.difference(tanggal).inDays;

      if (selisih == 0) {
        return 'hari ini';
      } else if (selisih == 1) {
        return 'satu hari lalu';
      } else {
        return '$selisih hari lalu';
      }
    }

    if (notifikasiListModel.data!.isEmpty) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Center(
          child: Text(
            'Tidak ada notifikasi',
            style: const TextStyle(
              color: ColorValue.neutralColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      );
    } else
      return ListView.builder(
        itemCount: notifikasiListModel.data!.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xFFF4F4F4),
                    ),
                    child: const Icon(
                      Icons.email_outlined,
                      color: ColorValue.neutralColor,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Text(
                                notifikasiListModel.data![index].judul!,
                                style: const TextStyle(
                                  color: ColorValue.neutralColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                formatTanggal(
                                    notifikasiListModel.data![index].tanggal!),
                                style: const TextStyle(
                                  color: ColorValue.neutralColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          notifikasiListModel.data![index].body!,
                          style: const TextStyle(
                            color: ColorValue.neutralColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 1,
                color: ColorValue.neutralColor.withOpacity(0.2),
              ),
            ],
          );
        },
      );
  }

  Widget _NotifListLoading() {
    return ListView.builder(
      itemCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[300],
                    ),
                    child: const Icon(
                      Icons.email_outlined,
                      color: ColorValue.neutralColor,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey[300],
                              ),
                              child: const Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                style: TextStyle(
                                  color: ColorValue.neutralColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey[300],
                              ),
                              child: const Text(
                                "3 hari lalu",
                                style: TextStyle(
                                  color: ColorValue.neutralColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[300],
                          ),
                          child: const Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                            style: TextStyle(
                              color: ColorValue.neutralColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 1,
                color: ColorValue.neutralColor.withOpacity(0.2),
              ),
            ],
          ),
        );
      },
    );
  }
}
