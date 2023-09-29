import 'package:flutter/material.dart';
import 'package:themovedb/ui/widgets/common/radial_percent_widget.dart';

class MovieDetailsInfoWidget extends StatelessWidget {
  const MovieDetailsInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _TopPosterWidget(),
        _MovieNameWidget(),
        _ScoreWidget(),
        _SummaryWidget(),
        _OverviewWidget(),
        _PeopleWidget(),       
      
      ],
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          image: AssetImage('assets/images/background.jpg'),
        ),
      ),
      child: Container(
        alignment: Alignment.topLeft,
        margin:const  EdgeInsets.all(20),
        height: 148,
        width: MediaQuery.of(context).size.width,
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Image.asset('assets/images/movie.jpg'),
      ),
    );
  }
}

class _MovieNameWidget extends StatelessWidget {
  const _MovieNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: RichText(
        maxLines: 3,
        textAlign: TextAlign.center, text: const TextSpan(
          children:[ 
            TextSpan(
              text: 'Spider-Man: Across the Spider-Verse ',
              style: TextStyle(fontSize: 19,color: Colors.white,fontWeight: FontWeight.w600)
            ),
            TextSpan(
              text: '(2023)',
              style: TextStyle(fontSize: 15,color: Colors.grey,)
            )
            ]
        ),
      ),
    );
  }
}

class _ScoreWidget extends StatelessWidget {
  const _ScoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(        
          onPressed: (){},
          child:const Row(
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: RadialPercentWidget(
                  percent: 0.85,
                  fillColor:Color.fromRGBO(8, 28, 34, 1),
                  lineColor:Color.fromRGBO(33, 208, 122, 1),
                  freeColor:Color.fromRGBO(32, 69, 41, 1),
                  lineWidth: 3,
                  child: Text('85%',style:TextStyle(
                    color: Colors.white
                    ),
                    ),
                  ),
              ),
              Text('  User Score',style:TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                    ),
                    )
            ],
          ) 
           ),
        Container(
          width: 1,
          height: 20,
          color: Colors.grey,
        ),
        TextButton(
          onPressed: (){},
          child:const Row(
            children: [
              Icon(Icons.play_arrow,color: Colors.white,),
              Text('Play Trailer',style:TextStyle(
                fontSize: 16,
                    color: Colors.white,)),
            ],
          ) 
          ),
      ],
    );
  }
}

class _SummaryWidget extends StatelessWidget {
  const _SummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Color.fromRGBO(29, 29, 29, 1),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 70,vertical: 15),
        child: Text('PG 06/02/2023 (US) 2h 20m Animation, Action, Adventure ',style: TextStyle(color: Colors.white,fontSize: 16),),
        ),
    );
  }
}


class _OverviewWidget extends StatelessWidget {
  const _OverviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 8, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('It\'s how you wear the mask that matters.',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 17
        ),          
        ),
        SizedBox(height: 10,),
        Text('Overview',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),
        ),
        SizedBox(height: 10,),
        Text('After reuniting with Gwen Stacy, Brooklyn’s full-time, friendly neighborhood Spider-Man is catapulted across the Multiverse, where he encounters the Spider Society, a team of Spider-People charged with protecting the Multiverse’s very existence. But when the heroes clash on how to handle a new threat, Miles finds himself pitted against the other Spiders and must set out on his own to save those he loves most.',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        )
        ],
      ),
    );
  }
}

class _PeopleWidget extends StatelessWidget {
  const _PeopleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Padding(
      padding: EdgeInsets.only(left: 20,bottom: 20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Justin K. Thompson',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700
                ),
                ),
                Text('Director',
                style: TextStyle(
                  color: Colors.white,
                ),
                ),
                SizedBox(height: 20,),
                Text('Justin K. Thompson',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700
                ),
                ),
                Text('Director',
                style: TextStyle(
                  color: Colors.white,
                ),
                ),
                SizedBox(height: 20,),
                Text('Justin K. Thompson',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700
                ),
                ),
                Text('Director',
                style: TextStyle(
                  color: Colors.white,
                ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [             
                Text('Justin K. Thompson',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700
                ),
                ),
                Text('Director',
                style: TextStyle(
                  color: Colors.white,
                ),
                ),
                SizedBox(height: 20,),
                Text('Justin K. Thompson',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700
                ),
                ),
                Text('Director',
                style: TextStyle(
                  color: Colors.white,
                ),
                ),
                SizedBox(height: 20,),
                Text('Justin K. Thompson',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700
                ),
                ),
                Text('Director',
                style: TextStyle(
                  color: Colors.white,
                ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

