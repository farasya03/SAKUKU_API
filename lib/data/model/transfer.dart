class TransferModel {
  int? id;
  String? title;
  String? desc;
  int? totalMoney;
  int? dateTime;

  TransferModel({
    this.id,
    this.title,
    this.desc,
    this.totalMoney,
    this.dateTime,
  });

  factory TransferModel.fromJson(Map<String, dynamic> json) => TransferModel(
        id: json["id"],
        title: json["title"],
        desc: json["desc"],
        totalMoney: json["total_money"],
        dateTime: json["date_time"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "desc": desc,
        "total_money": totalMoney,
        "date_time": dateTime,
      };
}
