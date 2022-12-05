import 'package:flutter/material.dart';
import 'package:sakuku/data/bloc/transfer_bloc.dart';
import 'package:sakuku/data/model/transfer.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({Key? key}) : super(key: key);

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  String? title;
  String? desc;
  String? totalMoney;
  int dateTime = DateTime.now().millisecondsSinceEpoch;

  Widget _spacer(int space) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: (MediaQuery.of(context).size.height / 100) * space,
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: const Color(0xFFF1F1F1),
      elevation: 1,
      title: const Text(
        "Transfer",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _etTitle() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "NAMA TAGIHAN",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  title = value;
                });
              },
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: "Masukkan nama tagihan",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _etDesc() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "DESKRIPSI TAGIHAN",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            TextFormField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                setState(() {
                  desc = value;
                });
              },
              decoration: const InputDecoration(
                hintText: "Masukkan deskripsi tagihan",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _etTotalMoney() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "TOTAL TAGIHAN",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            TextFormField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  totalMoney = value;
                });
              },
              decoration: const InputDecoration(
                hintText: "Masukkan total tagihan",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _button() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Material(
        color: const Color(0xFF6A859C),
        child: InkWell(
          onTap: () {
            // todo
            transferBloc.addTransfer(TransferModel(
              title: title,
              desc: desc,
              totalMoney: int.parse(totalMoney!),
              dateTime: dateTime,
            ));

            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Transfer berhasil"),
            ));

            Navigator.pop(context);
          },
          child: const SizedBox(
            width: double.infinity,
            height: 50,
            child: Center(
              child: Text(
                "SIMPAN",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Container(
        color: const Color(0xFFF3F3F3),
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                _etTitle(),
                _spacer(1),
                _etDesc(),
                _spacer(1),
                _etTotalMoney(),
              ],
            ),
            _button(),
          ],
        ),
      ),
    );
  }
}
