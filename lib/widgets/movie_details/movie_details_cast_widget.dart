import 'package:flutter/material.dart';

class MovieDetailsCastWidget extends StatelessWidget {
  const MovieDetailsCastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController myController = ScrollController();
    return ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(4, 20, 0, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
            padding: EdgeInsets.only(left: 16,bottom: 20),
            child: Text('Top Billed Cast',style: TextStyle(fontSize: 19),),
          ),
            SizedBox(
              height: 280,
              child: Scrollbar(
                thickness: 8,
                radius: const Radius.circular(10),
                controller: myController,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: myController,
                  itemCount: 8,
                  itemExtent: 140,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.fromLTRB(14, 0, 0, 16),
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
                      child: Column(
                        children: [
                          Image.asset('assets/images/actor.jpg'),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(8,8,8,0),
                            child: Column(
                              children: [
                                Text('Hailee Steinfeld',style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                                ),
                                ),
                                SizedBox(height: 2,),
                                Text('Gwen Stacy / Spider-Woman (voice)'),
                                Text(''),
                              ],
                            ),
                          ),
                        ],
                      )
                      );
                  }
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: TextButton(
                onPressed: (){},
                 child: const Text('Full Cast& Crew',
                 style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.normal
                  ),
                  )
                ),
            ),
          ]
          ),
      ),
    );
  }
}