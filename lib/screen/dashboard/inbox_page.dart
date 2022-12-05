import 'package:flutter/material.dart';
import 'package:sakuku/screen/dashboard/widget/inbox_card.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({Key? key}) : super(key: key);

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  final List tanggal = [
    "12 Januari 2021",
    "4 October 2020",
    "17 September 2020",
  ];

  final List judul = [
    "Sakuku hadir di kota baru",
    "Promo Sakuku",
    "Promo Sakuku",
  ];

  final List deskripsi = [
    "Sakuku hadir di kota baru",
    "Promo Sakuku",
    "Promo Sakuku",
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return InboxCard(
            date: tanggal[index],
            title: judul[index],
            desc: deskripsi[index],
          );
        },
        itemCount: judul.length,
      ),
    );
  }
}
