import 'package:flutter/material.dart';

class MovieListWidget extends StatefulWidget {
  const MovieListWidget({super.key});

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemExtent: 161,
      itemBuilder: (context, index) => 
      Padding(
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
                  Image.asset('assets/images/movie.jpg'),
                  const SizedBox(width: 14,),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height:14),
                        Text('Spider-Man: Across the Spider-Verse',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,                   
                          ),                     
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 5,),
                        Text('May 31, 2023',
                        style: TextStyle(
                          color: Colors.grey
                          ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 20,),
                        Text('After reuniting with Gwen Stacy, Brooklyn’s full-time, friendly neighborhood Spider-Man is catapulted across the Multiverse, where he encounters the Spider Society, a team of Spider-People charged with protecting the Multiverse’s very existence. But when the heroes clash on how to handle a new threat, Miles finds himself pitted against the other Spiders and must set out on his own to save those he loves most.',
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
      )
      ,     
    );
  }
}