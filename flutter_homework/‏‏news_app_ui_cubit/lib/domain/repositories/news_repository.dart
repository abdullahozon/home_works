import 'package:news_app_ui_setup/data/models/article_model.dart'; 
 
abstract class NewsRepository  { 
  Future<List<ArticleModel>> getNews(String category); 
 }