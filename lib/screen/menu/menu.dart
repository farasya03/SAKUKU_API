import 'package:flutter/material.dart';
import 'package:sakuku/screen/dashboard/dashboard_page.dart';
import 'package:sakuku/screen/dashboard/inbox_page.dart';
import 'package:sakuku/screen/dashboard/info_page.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  static const screens = <Widget>[
    DashboardPage(),
    InfoPage(),
    InboxPage(),
  ];

  int selectedScreen = 0;

  List<BottomNavigationBarItem> _bottomNavItem() {
    final bottomNavItem = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Icon(Icons.trending_up),
                  Text('Home'),
                ],
              ),
            ],
          ),
          label: ''),
      const BottomNavigationBarItem(
          icon: Icon(Icons.contact_page), label: 'INFO'),
      const BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'INBOX'),
    ];
    return bottomNavItem;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (selectedScreen != 0) {
          selectedScreen = 0;
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        body: IndexedStack(
          sizing: StackFit.expand,
          index: selectedScreen,
          children: screens,
        ),
        bottomNavigationBar: Container(
          height: (MediaQuery.of(context).size.height / 100) * 8.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() => selectedScreen = 0);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical:
                            (MediaQuery.of(context).size.width / 100) * 3),
                    decoration: BoxDecoration(
                      color: selectedScreen == 0
                          ? const Color(0xFF5A7E92)
                          : const Color(0xFFC3C3C3),
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.home,
                          color: Colors.white,
                          size: 32,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "MENU",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() => selectedScreen = 1);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical:
                            (MediaQuery.of(context).size.width / 100) * 3),
                    decoration: BoxDecoration(
                      color: selectedScreen == 1
                          ? const Color(0xFF5A7E92)
                          : const Color(0xFFC3C3C3),
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.contact_page_outlined,
                          color: Colors.white,
                          size: 32,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "INFO",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() => selectedScreen = 2);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical:
                            (MediaQuery.of(context).size.width / 100) * 3),
                    decoration: BoxDecoration(
                      color: selectedScreen == 2
                          ? const Color(0xFF5A7E92)
                          : const Color(0xFFC3C3C3),
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.mail_outline_outlined,
                          color: Colors.white,
                          size: 32,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "INBOX",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
