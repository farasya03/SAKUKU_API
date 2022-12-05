import 'package:rxdart/rxdart.dart';
import 'package:sakuku/data/model/transfer.dart';
import 'package:sakuku/data/repository.dart';

class TransferBloc {
  final Repository repository = Repository();

  final PublishSubject<List<TransferModel>> _transferFetcher =
      PublishSubject<List<TransferModel>>();

  Stream<List<TransferModel>> get transfers => _transferFetcher.stream;

  TransferBloc() {
    getTransfers();
  }

  getTransfers() async {
    List<TransferModel> transfer = await repository.getTransfers();
    _transferFetcher.sink.add(transfer);
  }

  addTransfer(TransferModel transferModel) async {
    await repository.createTransfer(transferModel);
    getTransfers();
  }
}

final transferBloc = TransferBloc();
