import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sakuku/data/model/top-headlines.dart';
import 'package:sakuku/data/provider/news_provider.dart';
import 'package:sakuku/utils/pagination.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()) {
    on<NewsEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoadNews>((event, emit) async {
      emit(NewsLoading());
      try {
        final TopHeadlines topHeadlines =
            await NewsProvider().fetchTopHeadlines(
          page: event.page,
        );
        emit(NewsLoaded(topHeadlines: topHeadlines));
      } catch (e) {
        emit(NewsError(message: e.toString()));
      }
    });
  }
}
