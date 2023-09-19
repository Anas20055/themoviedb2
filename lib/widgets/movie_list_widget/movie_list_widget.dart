import 'package:flutter/material.dart';

class Movie {
  final String imagePath;
  final String title;
  final String time;
  final String description;

  Movie({
    required this.imagePath,
    required this.title, 
    required this.time,
    required this.description
      });
  

}

class MovieListWidget extends StatefulWidget {
  const MovieListWidget({super.key});

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(
      imagePath: 'assets/images/movie.jpg',
      title:'Spider-Man: Across the Spider-Verse',
      time:'May 31, 2023',
      description: 'After reuniting with Gwen Stacy, Brooklyn’s full-time, friendly neighborhood'
      ),
    Movie(
      imagePath: 'assets/images/movie.jpg',
      title:'Flash',
      time:'May 31, 2023',
      description: 'After reuniting with Gwen Stacy, Brooklyn’s full-time, friendly neighborhood'
      ),
    Movie(
      imagePath: 'assets/images/movie.jpg',
      title:'Captain America',
      time:'May 31, 2023',
      description: 'After reuniting with Gwen Stacy, Brooklyn’s full-time, friendly neighborhood'
      ),
    Movie(
      imagePath: 'assets/images/movie.jpg',
      title:'Iron-man',
      time:'May 31, 2023',
      description: 'After reuniting with Gwen Stacy, Brooklyn’s full-time, friendly neighborhood'
      ),
  ];

  // ignore: unused_field
  List<Movie> _filteredMovies= [];
  final _searchController = TextEditingController();

  void _searchMovies(){
    final query = _searchController.text;
    if(query.isNotEmpty){
      _filteredMovies = _movies.where((Movie movie) => movie.title.toLowerCase().contains(query.toLowerCase())
      ).toList();
    }else{
      _filteredMovies = _movies;
    }
    setState(() {  });
  }
  
  @override
  void initState() {
    super.initState();
    _filteredMovies= _movies;
    _searchController.addListener(_searchMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          keyboardDismissBehavior:ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.only(top: 60),
          itemCount: _filteredMovies.length,
          itemExtent: 161,
          itemBuilder: (context, index){
          final movie = _filteredMovies[index];
          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black.withOpacity(0.2)),
                    borderRadius: const BorderRadius.all(Radius.circular(7)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color:Colors.black.withOpacity(0.1),
                        offset:const  Offset(0, 2) ,
                        blurRadius: 0.8           
                      ),
                    ],            
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(movie.imagePath),
                      const SizedBox(width: 14,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height:14),
                            Text(movie.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,                   
                              ),                     
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 5,),
                            Text(movie.time,
                            style: const TextStyle(
                              color: Colors.grey
                              ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 20,),
                            Text(movie.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: (){},
                    ),
                  ),
              ],
            ),
          );
          }    
        ),
        Padding(
          padding:const  EdgeInsets.all(10),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              label:const  Text('Search'),
              filled: true,
              fillColor: Colors.white.withAlpha(235)
            ),
          ),
          ),
      ],
    );
  }
}