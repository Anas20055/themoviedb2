import 'package:flutter/material.dart';
import 'package:themovedb/widgets/news/news_trailer_widget.dart';
import 'package:themovedb/widgets/news/news_trending_widget.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children:const  [
        NewsTrendingWidget(),
        NewTrailerWidget()
      ],
    );
  }
}