// import 'package:dio/dio.dart';
// import 'package:news_app_ui_setup/data/models/article_model.dart';

// class NewsService {
//   final Dio dio;

//   NewsService(this.dio);

//   Future<List<ArticleModel>> getNews({required String category}) async {
//     try {
//       final response = await dio.get(
//         'https://newsapi.org/v2/top-headlines?apiKey=d6f31fa56fc645c783c662dd01cd9a55&country=us&category=$category',
//       );

//       final List<dynamic> articles = response.data['articles'];
//       return articles.map((article) => ArticleModel.fromJson(article)).toList();
//     } catch (e) {
//       throw Exception('فشل في جلب الأخبار: $e');
//     }
//   }
// }

import 'package:dio/dio.dart';
import 'package:news_app_ui_setup/core/constants/api_keys.dart';
import 'package:news_app_ui_setup/data/models/article_model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

  Future<List<ArticleModel>> getNews({required String category}) async {
    try {
      final url =
          'https://newsapi.org/v2/top-headlines?apiKey=${ApiKeys.newsApiKey}&country=us&category=$category';

      final response = await dio.get(url);
      final data = response.data;

      final List articles = data['articles'];
      return articles.map((json) => ArticleModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch news');
    }
  }
}
