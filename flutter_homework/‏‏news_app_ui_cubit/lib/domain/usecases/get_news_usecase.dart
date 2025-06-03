import 'package:news_app_ui_setup/data/models/article_model.dart'; 
import 'package:news_app_ui_setup/domain/repositories/news_repository.dart'; 
 
class GetNewsUseCase  { 
  final NewsRepository repository; 
 
  GetNewsUseCase(this.repository); 
 
  Future<List<ArticleModel>> call(String category)  { 
    return repository.getNews(category); 
   } 
 }