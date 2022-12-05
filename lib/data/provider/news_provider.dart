import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sakuku/config/config.dart';
import 'package:sakuku/data/model/top-headlines.dart';

class NewsProvider {
  final Dio dio = Dio();

  Future<TopHeadlines> fetchTopHeadlines({
    required int page,
  }) async {
    try {
      // with query params
      final Response response = await dio.get(
        '${Config.baseUrl}/top-headlines',
        queryParameters: {
          'apiKey': Config.apiKey,
          'country': 'id',
          'category': 'business',
          'pageSize': 10,
          'page': page,
        },
      );

      return TopHeadlines.fromJson(response.data);
    } catch (error, stackTrace) {
      debugPrint("Exception occured: $error stackTrace: $stackTrace");
      return TopHeadlines.withError("$error");
    }
  }
}
