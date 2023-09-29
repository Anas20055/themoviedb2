import 'package:flutter/material.dart';
import 'package:themovedb/domain/dataProvider/session_data_provider.dart';


Drawer drawer(BuildContext context){
  const textStyle1= TextStyle(
    color: Colors.white,
    fontSize: 20.8,
    fontWeight: FontWeight.w500
  );
  const textStyle2= TextStyle(
    color:Color.fromRGBO(163, 175, 186, 1),
    fontSize: 16,
    fontWeight: FontWeight.w600
  );
  return Drawer(
    shape:const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(bottomRight: Radius.zero)
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    child: ListView(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          height: 55,
          width: 55,
          child: GestureDetector(onTap: (){Navigator.pop(context);},),
        ),
        Container(
          color:const Color.fromRGBO(3, 37, 65, 1),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child:const  Padding(
            padding: EdgeInsets.only(top: 20,left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Movies',style: textStyle1),
                SizedBox(height: 10,),
                Text('TV Shows',style: textStyle1),
                SizedBox(height: 10,),
                Text('People',style: textStyle1),
                SizedBox(height: 20,),
                Text('Contribution Bible',style: textStyle2),
                SizedBox(height: 10,),
                Text('Discussions',style: textStyle2),
                SizedBox(height: 10,),
                Text('Leaderboard',style: textStyle2),
                SizedBox(height: 10,),
                Text('API',style: textStyle2),
                SizedBox(height: 10,),                 
                Text('Support',style: textStyle2),
                SizedBox(height: 10,),
                Text('About',style: textStyle2),
                SizedBox(height: 20,),
                Text('Log In',style: textStyle2),
                SizedBox(height: 20,),
                

              ],
            ),
          ),
        )
      ],
    ),
  );
}

AppBar appBar (){
  return AppBar(
        title: SizedBox(
          width: 55,
          height: 40,
          child: Image.asset('assets/images/t.png')
          ),
        actions: [
          IconButton(
            onPressed: (){
              SessionDataProvider().setSessionId(null);
              print('dssdf');
            }, 
            icon: const Icon(           
               Icons.person,
              )
            ),
          IconButton(
            onPressed: (){},
            icon:const  Icon(
            Icons.search,color: Colors.blue,
              )
            )
        ],
      );
}