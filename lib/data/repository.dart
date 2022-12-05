import 'package:sakuku/data/controller/database_controller.dart';
import 'package:sakuku/data/model/transfer.dart';
import 'package:sakuku/data/provider/news_provider.dart';

class Repository {
  final DatabaseController dbController = DatabaseController();
  final NewsProvider newsProvider = NewsProvider();

  Future getTransfers() => dbController.getTransfers();

  Future createTransfer(TransferModel transferModel) =>
      dbController.createTransfer(transferModel);

  Future fetchTopHeadlines({
    required int page,
  }) =>
      newsProvider.fetchTopHeadlines(
        page: page,
      );
}
