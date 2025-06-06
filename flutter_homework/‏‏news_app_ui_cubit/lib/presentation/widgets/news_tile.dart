import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/data/models/article_model.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel});
  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.network(
            articleModel.image ??
                'https://thumbs.dreamstime.com/b/default-image-icon-vector-missing-picture-page-website-design-mobile-app-no-photo-available-236105299.jpg?w=768',
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          articleModel.title ?? 'no title',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              color: Colors.black87, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          articleModel.subTitle ?? 'no d',
          maxLines: 2,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
