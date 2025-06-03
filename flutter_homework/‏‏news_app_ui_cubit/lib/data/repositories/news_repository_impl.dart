import 'package:news_app_ui_setup/data/datasources/news_service.dart'; 
import 'package:news_app_ui_setup/data/models/article_model.dart'; 
import 'package:news_app_ui_setup/domain/repositories/news_repository.dart'; 
 
class NewsRepositoryImpl implements NewsRepository  { 
  final NewsService newsService; 
 
  NewsRepositoryImpl(this.newsService); 
 
  @override 
  Future<List<ArticleModel>> getNews(String category)  { 
    return newsService.getNews(category: category); 
   } 
 }