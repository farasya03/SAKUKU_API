import 'package:flutter/material.dart';
import 'package:sakuku/screen/menu/menu.dart';

class PinPage extends StatefulWidget {
  const PinPage({Key? key}) : super(key: key);

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  final pinController = TextEditingController();

  Widget _spacer(int space) {
    return SizedBox(
      height: (MediaQuery.of(context).size.height / 100) * space,
    );
  }

  Widget _pinTextField() {
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: (MediaQuery.of(context).size.width / 100) * 10,
        ),
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: (MediaQuery.of(context).size.width / 100) * 5,
            vertical: (MediaQuery.of(context).size.height / 100) * 1,
          ),
          child: TextFormField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            controller: pinController,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Masukkan PIN",
              hintStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _button(bool active, String title) {
    return Material(
      color: active ? const Color(0xFF5A7E92) : Colors.transparent,
      child: InkWell(
        onTap: () {
          if (pinController.text == "1234") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Menu(),
              ),
            );
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Error"),
                  content: const Text("PIN yang anda masukkan salah"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("OK"),
                    ),
                  ],
                );
              },
            );
          }
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
                top: (MediaQuery.of(context).size.height / 100) * 30,
                bottom: (MediaQuery.of(context).size.height / 100) * 5,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _pinTextField(),
                  _spacer(5),
                  _button(true, "MASUK"),
                  _spacer(5),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
