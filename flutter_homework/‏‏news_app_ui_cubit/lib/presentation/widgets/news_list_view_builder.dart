import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_ui_setup/presentation/cubits/get_news_cubit/get_news_cubit.dart';
import 'package:news_app_ui_setup/presentation/cubits/get_news_cubit/get_news_cubit_states.dart';
import 'package:news_app_ui_setup/presentation/widgets/news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.category});
  final String category;

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetNewsCubit>(context).getNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNewsCubit, NewsStates>(
      builder: (context, state) {
        if (state is NewsLoadingState) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is NewsLoadedState) {
          return NewsListView(articles: state.articleModel);
        } else if (state is NewsFailureState) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 48),
                  const SizedBox(height: 8),
                  Text(
                    'حدث خطأ أثناء جلب الأخبار:\n${state.error}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }
      },
    );
  }
}
