import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import 'package:news_app_ui_setup/data/datasources/news_service.dart';
import 'package:news_app_ui_setup/data/repositories/news_repository_impl.dart';
import 'package:news_app_ui_setup/domain/usecases/get_news_usecase.dart';
import 'package:news_app_ui_setup/presentation/cubits/get_news_cubit/get_news_cubit.dart';
import 'package:news_app_ui_setup/presentation/views/home_view.dart';

void main() {
  // إعداد التبعيات يدويًا
  final newsService = NewsService(Dio());
  final newsRepository = NewsRepositoryImpl(newsService);
  final getNewsUseCase = GetNewsUseCase(newsRepository);

  runApp(NewsApp(getNewsUseCase: getNewsUseCase));
}

class NewsApp extends StatelessWidget {
  final GetNewsUseCase getNewsUseCase;

  const NewsApp({super.key, required this.getNewsUseCase});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetNewsCubit(getNewsUseCase),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}
