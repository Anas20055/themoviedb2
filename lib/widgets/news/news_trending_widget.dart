import 'package:flutter/material.dart';
import 'package:themovedb/widgets/common/radial_percent_widget.dart';

class NewsTrendingWidget extends StatelessWidget {
  const NewsTrendingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController myController = ScrollController();
    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(height: 180,),
            Image.asset('assets/images/backImage.png'),
          ]),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, bottom: 20, top: 20),
            child: Text(
              'Trending',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 410,
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
                        Column(
                          children: [
                            Container(
                                height: 225,
                                margin: const EdgeInsets.fromLTRB(20, 0, 0, 16),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7)),
                                ),
                                clipBehavior: Clip.hardEdge,
                                child: Image.asset('assets/images/movie.jpg')),
                          ],
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
                              borderRadius: const BorderRadius.all(Radius.circular(10))
                            ),
                            child: const Icon(Icons.more_horiz)
                            ),
                        )
                      ],
                    );
                  }),
            ),
          ),
        ]),
      ],
    );
  }
}
