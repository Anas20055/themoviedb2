import 'package:flutter/material.dart';
import 'package:themovedb/widgets/common/common_widgets.dart';
import 'package:themovedb/widgets/movie_details/movie_details_cast_widget.dart';
import 'package:themovedb/widgets/movie_details/movie_details_main_info_widget.dart';


class MovieDetailsWidget extends StatefulWidget {
  final int movieId;
  const MovieDetailsWidget({super.key, required this.movieId});

  @override
  State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: ListView(
        children:const  [
          ColoredBox(
            color: Color.fromRGBO(32, 32, 32, 1),
            child: MovieDetailsInfoWidget(),),
          MovieDetailsCastWidget()
        ],
      ),
    );
  }
}