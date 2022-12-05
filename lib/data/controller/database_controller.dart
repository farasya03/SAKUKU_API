import 'package:sakuku/data/model/transfer.dart';
import 'package:sakuku/data/provider/database_provider.dart';

class DatabaseController {
  final dbClient = DatabaseProvider.dbProvider;

  Future<int> createTransfer(TransferModel transferModel) async {
    final db = await dbClient.db;

    var result = db.insert("transfer", transferModel.toJson());

    return result;
  }

  Future<List<TransferModel>> getTransfers() async {
    final db = await dbClient.db;

    var result = await db.query("transfer");

    List<TransferModel> list = result.isNotEmpty
        ? result.map((e) => TransferModel.fromJson(e)).toList()
        : [];

    return list;
  }
}
