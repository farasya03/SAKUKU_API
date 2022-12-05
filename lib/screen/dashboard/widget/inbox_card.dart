import 'package:flutter/material.dart';

class InboxCard extends StatelessWidget {
  final String date;
  final String title;
  final String desc;
  const InboxCard({
    Key? key,
    required this.date,
    required this.title,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: (MediaQuery.of(context).size.width / 100) * 5,
        vertical: (MediaQuery.of(context).size.height / 100) * 2,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.grey),
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            date,
            style: const TextStyle(
              color: Color(0xFF8A9EAC),
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.height / 100) * 1,
          ),
          Text(title,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          SizedBox(
            height: (MediaQuery.of(context).size.height / 100) * 1,
          ),
          Text(desc, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
