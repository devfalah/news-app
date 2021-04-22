import 'package:flutter/material.dart';

import 'article_item.dart';

class ListItem extends StatelessWidget {
  final List<dynamic> items;

  const ListItem({required this.items});
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) => ArticleItem(
        article: items[index],
      ),
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemCount: items.length,
    );
  }
}
