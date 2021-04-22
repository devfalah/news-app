import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/helper/extension.dart';
import 'package:news/view/web_view.dart';

import 'custom_text.dart';

class ArticleItem extends StatelessWidget {
  final Map article;

  const ArticleItem({required this.article});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(WebViews(
          article['url'],
          article['title'],
        ));
      },
      child: Row(
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('${article['urlToImage']}'),
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          SizedBox(width: 20.0),
          Expanded(
            child: Container(
              height: 120.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomText(
                      text: '${article['title']}',
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0,
                      maxLines: 3,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  CustomText(
                    text:
                        '${StringExtensions.displayTimeAgoFromTimestamp(article['publishedAt'])}',
                    fontSize: 12.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
