import 'package:flutter/material.dart';
import 'package:sakuku/screen/dashboard/info/mutasi_page.dart';
import 'package:sakuku/screen/dashboard/info/news_page.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  Widget _spacer(int space) {
    return SizedBox(
      height: (MediaQuery.of(context).size.height / 100) * space,
    );
  }

  TabBar get _tabBar => TabBar(
        indicator: const BoxDecoration(
          color: Colors.white,
        ),
        labelColor: const Color(0xFF616161),
        tabs: [
          Tab(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.calendar_month),
                SizedBox(
                  width: 4,
                ),
                Text("Mutasi"),
              ],
            ),
          ),
          Tab(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.newspaper),
                SizedBox(
                  width: 4,
                ),
                Text("News"),
              ],
            ),
          ),
        ],
      );

  Widget _appBar() {
    return SliverToBoxAdapter(
      child: Container(
        height: (MediaQuery.of(context).size.height / 100) * 30,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          margin: EdgeInsets.only(
            left: (MediaQuery.of(context).size.width / 100) * 5,
            right: (MediaQuery.of(context).size.width / 100) * 5,
            bottom: (MediaQuery.of(context).size.height / 100) * 2,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                'assets/images/sakuku.png',
                width: (MediaQuery.of(context).size.width / 100) * 30,
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height / 100) * 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      'assets/images/user.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(
                    width: (MediaQuery.of(context).size.width / 100) * 3,
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Farasya Syifa Hidayat",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Saldo Rp.37.300",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.settings_applications_rounded,
                      color: Color(0xFFBABFCA),
                      size: 48,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _tabBarView() {
    return SliverToBoxAdapter(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            _tabBar,
            SizedBox(
              height: (MediaQuery.of(context).size.height / 100) * 60,
              child: const TabBarView(
                children: [
                  MutasiPage(),
                  NewsPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFEBEBEB),
      child: CustomScrollView(
        slivers: [
          _appBar(),
          _tabBarView(),
        ],
      ),
    );
  }
}
