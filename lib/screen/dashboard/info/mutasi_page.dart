import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sakuku/data/bloc/transfer_bloc.dart';
import 'package:sakuku/data/model/transfer.dart';
import 'package:sakuku/screen/dashboard/info/widget/transfer_card.dart';

class MutasiPage extends StatefulWidget {
  const MutasiPage({Key? key}) : super(key: key);

  @override
  State<MutasiPage> createState() => _MutasiPageState();
}

class _MutasiPageState extends State<MutasiPage> {
  DateFormat dateFormat = DateFormat("dd MMMM yyyy");

  @override
  Widget build(BuildContext context) {
    transferBloc.getTransfers();
    return StreamBuilder<List<TransferModel>>(
      stream: transferBloc.transfers,
      builder: (context, AsyncSnapshot<List<TransferModel>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isNotEmpty) {
            return Material(
              color: Colors.white,
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return TransferCard(
                    date: dateFormat.format(DateTime.fromMillisecondsSinceEpoch(
                        snapshot.data![index].dateTime!)),
                    title: snapshot.data![index].title!,
                    desc: snapshot.data![index].desc!,
                    totalMoney: snapshot.data![index].totalMoney.toString(),
                  );
                },
                itemCount: snapshot.data!.length,
              ),
            );
          } else {
            return const Material(
              color: Colors.white,
              child: Center(
                child: Text("Tidak ada data mutasi"),
              ),
            );
          }
        } else if (snapshot.hasError) {
          // the code below is used to print the error on the screen
          return Text(snapshot.error.toString());
        } else if (snapshot.data == null) {
          return const Center(
            child: Text(
              "Enter your first task",
            ),
          );
        }
        return const Center(
          child: Text(
            "Enter your first task",
          ),
        );
      },
    );
  }
}
