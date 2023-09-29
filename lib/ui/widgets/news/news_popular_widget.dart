import 'package:flutter/material.dart';
import 'package:themovedb/ui/widgets/common/radial_percent_widget.dart';

class NewsPopularWidget extends StatefulWidget {
  const NewsPopularWidget({super.key});

  @override
  State<NewsPopularWidget> createState() => _NewsPopularWidgetState();
}

class _NewsPopularWidgetState extends State<NewsPopularWidget> {
  final ScrollController myController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Padding(
        padding: const EdgeInsets.only(left: 20, bottom: 20, top: 20,right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('What\'s Popular',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            DropdownButton(
              value: 'Streaming',
              items:const  [
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
        height: 360,
        width: MediaQuery.of(context).size.width,
        child: Scrollbar(
          controller: myController,
          thickness: 8,
          radius: const Radius.circular(10),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemExtent: 170,
              controller: myController,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 225,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                              ),
                              clipBehavior: Clip.hardEdge,
                              child:
                                  Image.asset('assets/images/movie.jpg')),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            'Spider-Man: Across the Spider-Verse',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          const Text('Jun 17 2023',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey))
                        ],
                      ),
                    ),
                    const Positioned(
                      left: 28,
                      top: 205,
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: RadialPercentWidget(
                          percent: 0.85,
                          fillColor: Color.fromRGBO(8, 28, 34, 1),
                          lineColor: Color.fromRGBO(33, 208, 122, 1),
                          freeColor: Color.fromRGBO(32, 69, 41, 1),
                          lineWidth: 2,
                          child: Text(
                            '85%',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
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
    ]);
  }
}
