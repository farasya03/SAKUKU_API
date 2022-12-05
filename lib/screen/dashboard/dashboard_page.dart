import 'package:flutter/material.dart';
import 'package:sakuku/screen/dashboard/transfer/transfer_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  Widget _spacer(int space) {
    return SizedBox(
      height: (MediaQuery.of(context).size.height / 100) * space,
    );
  }

  Widget _sakuku() {
    return Material(
      color: Colors.transparent,
      child: Image.asset(
        'assets/images/sakuku.png',
        width: (MediaQuery.of(context).size.width / 100) * 40,
      ),
    );
  }

  Widget _menu(
    String imageAsset1,
    String imageAsset2,
    String iconTitle1,
    String iconTitle2,
    Function onTap1,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Container(
                width: (MediaQuery.of(context).size.width / 100) * 30,
                height: (MediaQuery.of(context).size.width / 100) * 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  splashColor: Colors.amberAccent,
                  child: Image.asset(
                    'assets/images/$imageAsset1.png',
                    fit: BoxFit.fitWidth,
                  ),
                  onTap: () {
                    onTap1();
                  },
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                iconTitle1,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Container(
                width: (MediaQuery.of(context).size.width / 100) * 30,
                height: (MediaQuery.of(context).size.width / 100) * 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  splashColor: Colors.amberAccent,
                  child: Image.asset(
                    'assets/images/$imageAsset2.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                iconTitle2,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(
                top: (MediaQuery.of(context).size.height / 100) * 10,
                bottom: (MediaQuery.of(context).size.height / 100) * 5,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _sakuku(),
                  _spacer(5),
                  _menu('qris', 'isi_pulsa', 'Qris', 'Isi Pulsa', () {}),
                  _spacer(4),
                  _menu('transfer', 'voucher_game', 'Transfer', 'Voucher Game',
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TransferPage()),
                    );
                  }),
                  _spacer(4),
                  _menu('tarik_tunai', 'split_bill', 'Tarik Tunai',
                      'Split Bill', () {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
