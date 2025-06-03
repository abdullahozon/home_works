import 'package:equatable/equatable.dart';
import 'package:news_app_ui_setup/data/models/article_model.dart';


abstract class NewsStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class NewsInitialState extends NewsStates {}

class NewsLoadingState extends NewsStates {}

class NewsLoadedState extends NewsStates {
  final List<ArticleModel> articleModel;

  NewsLoadedState({required this.articleModel});

  @override
  List<Object?> get props => [articleModel];
}

class NewsFailureState extends NewsStates {
  final String error;

  NewsFailureState({required this.error});

  @override
  List<Object?> get props => [error];
}