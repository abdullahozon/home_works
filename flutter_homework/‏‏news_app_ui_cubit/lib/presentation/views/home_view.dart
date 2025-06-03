import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/presentation/widgets/app_bar_method.dart';
import 'package:news_app_ui_setup/presentation/widgets/category_list_view.dart';
import 'package:news_app_ui_setup/presentation/widgets/news_list_view_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMethod(),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: CategoryListView()),
            SliverToBoxAdapter(child: SizedBox(height: 22)),
            NewsListViewBuilder(category: 'general'),
          ],
        ),
      ),
    );
  }
}