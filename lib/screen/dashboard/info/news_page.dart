import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakuku/screen/dashboard/info/bloc/news_bloc.dart';
import 'package:sakuku/screen/dashboard/info/widget/news_card.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final NewsBloc _newsBloc = NewsBloc();

  @override
  void initState() {
    _newsBloc.add(const LoadNews(page: 1));
    super.initState();
  }

  Widget _listNews() {
    return BlocProvider(
      create: (_) => _newsBloc,
      child: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsInitial) {
            return const Center(
              child: Text("Enter your first task"),
            );
          } else if (state is NewsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is NewsLoaded) {
            return ListView(
              children: state.topHeadlines.articles
                  .map((e) => NewsCard(
                        icon: Icons.newspaper_rounded,
                        // parse 8601 iso to string  and remove 000z
                        date: DateTime.parse(e.publishedAt)
                            .toString()
                            .substring(0, 16),
                        title: e.title,
                        desc: e.description,
                      ))
                  .toList(),
            );
          } else if (state is NewsError) {
            return Text(state.message);
          }
          return const Center(
            child: Text(
              "Enter your first task",
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: _listNews(),
    );
  }
}
