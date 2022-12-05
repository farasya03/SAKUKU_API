import 'package:flutter/material.dart';
import 'package:sakuku/screen/pin/pin_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget _spacer(int space) {
    return SizedBox(
      height: (MediaQuery.of(context).size.height / 100) * space,
    );
  }

  Widget _button(bool active, String title, Function onClick) {
    return Material(
      color: active ? const Color(0xFF5A7E92) : Colors.transparent,
      child: InkWell(
        onTap: () {
          onClick();
        },
        child: Container(
          width: (MediaQuery.of(context).size.width / 100) * 60,
          padding: EdgeInsets.symmetric(
              vertical: (MediaQuery.of(context).size.width / 100) * 5),
          decoration: BoxDecoration(
            border: Border.all(
              color: active ? const Color(0xFF5A7E92) : Colors.white,
              width: 1,
            ),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoSakuku() {
    return const Material(
      color: Colors.transparent,
      child: Text(
        "Info Sakuku",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 20,
        ),
      ),
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
                top: (MediaQuery.of(context).size.height / 100) * 20,
                bottom: (MediaQuery.of(context).size.height / 100) * 5,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/sakuku.png',
                    width: (MediaQuery.of(context).size.width / 100) * 80,
                  ),
                  _spacer(5),
                  _button(false, "PIN", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PinPage(),
                      ),
                    );
                  }),
                  _spacer(2),
                  _button(true, "MASUK", () {}),
                  _spacer(5),
                  _infoSakuku(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
