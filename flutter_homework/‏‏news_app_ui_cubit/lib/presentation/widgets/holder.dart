// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:news_app_ui_setup/models/article_model.dart';
// import 'package:news_app_ui_setup/services/news_service.dart';
// import 'package:news_app_ui_setup/widgets/news_tile.dart';

// class NewsListView extends StatefulWidget {
//   const NewsListView({
//     super.key,
//   });

//   /// هدول بعد ما حولناها ل ستيتفل
//   @override
//   State<NewsListView> createState() => _NewsListViewState();
// }

// class _NewsListViewState extends State<NewsListView> {
//   List<ArticleModel> articles = [];

//   bool isLoadind = true;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getGeneralNewsMethod();
//   }

//   Future<void> getGeneralNewsMethod() async {
//     articles = await NewsService(Dio()).getGeneralNews();
//     isLoadind = false;
//     setState(() {});
//   }
// ////

//   @override
//   Widget build(BuildContext context) {
//     return isLoadind
//         ? const SliverToBoxAdapter(
//             child: Center(child: CircularProgressIndicator()))
//         : SliverList(
//             delegate: SliverChildBuilderDelegate(childCount: articles.length,
//                 (context, index) {
//             return Padding(
//               padding: const EdgeInsets.only(bottom: 22),
//               child: NewsTile(
//                 articleModel: articles[index],
//               ),
//             );
//           }));
//   }
// }
