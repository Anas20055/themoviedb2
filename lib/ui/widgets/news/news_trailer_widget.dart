import 'package:flutter/material.dart';

class NewsTrailerWidget extends StatefulWidget {
  const NewsTrailerWidget({super.key});

  @override
  State<NewsTrailerWidget> createState() => _NewsTrailerWidgetState();
}

class _NewsTrailerWidgetState extends State<NewsTrailerWidget> {
  final ScrollController myController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          colorFilter:
              ColorFilter.mode(Colors.blueGrey.shade700, BlendMode.modulate),
          image: const AssetImage('assets/images/bb.jpg'),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 10, top: 10,right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Latest Trailers',
                style: TextStyle(
                  fontSize: 24, 
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                  ),
              ),
              DropdownButton(
                dropdownColor: Colors.blueGrey.shade900,
                style: const TextStyle(color: Colors.white),
                iconEnabledColor: Colors.white,
                value: 'Popular',
                items:const  [
                  DropdownMenuItem(value: 'Popular',child: Text('Popular'),),
                  DropdownMenuItem(value: 'Streaming',child: Text('Streaming'),),
                  DropdownMenuItem(value: 'On TV',child: Text('On TV'),),
                  DropdownMenuItem(value: 'For Rent',child: Text('For Rent'),),
                  DropdownMenuItem(value: 'In Teaters',child: Text('In Teaters'),)
                ],
                 onChanged: (fsdf){}
                 )
            ],
          ),
        ),
        SizedBox(
          height: 270,
          width: MediaQuery.of(context).size.width,
          child: Scrollbar(
            controller: myController,
            thickness: 8,
            radius: const Radius.circular(10),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemExtent: 328,
                controller: myController,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                height: 175,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                clipBehavior: Clip.hardEdge,
                                child:
                                    Image.asset('assets/images/bb.jpg')),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Rick and Morty',
                              style: TextStyle(
                                  fontSize: 19, 
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                  ),
                            ),
                            const Text('Season 7 Official Trailer',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white))
                          ],
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.7),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: const Icon(Icons.more_horiz)),
                      )
                    ],
                  );
                }),
          ),
        ),
      ]),
    );
  }
}
