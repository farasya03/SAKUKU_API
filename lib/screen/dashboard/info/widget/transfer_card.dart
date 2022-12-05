import 'package:flutter/material.dart';

class TransferCard extends StatelessWidget {
  final String date;
  final String title;
  final String desc;
  final String totalMoney;
  const TransferCard(
      {Key? key,
      required this.date,
      required this.title,
      required this.desc,
      required this.totalMoney})
      : super(key: key);

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                width: (MediaQuery.of(context).size.width / 100) * 5,
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "Rp. $totalMoney",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xFF3FB6D0),
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.height / 100) * 1,
          ),
          Text(desc, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
