
import 'package:flutter/material.dart';
import 'package:themovedb/Theme/app_button_style.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      drawerScrimColor: Colors.transparent,
      drawer:drawer(context),
      body:const  SingleChildScrollView(
        child: _HeaderWidget(),        
        ),
    );
  }
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
            onPressed: (){}, 
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

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 16);
    return  Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           const Text('Login to your account',style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500
            ),
          ),
          const _FormWidget(),
          const SizedBox(height: 10,),
          const Text('In order to use the editing and rating capabilities of TMDB, as well as get personal recommendations you will need to login to your account. If you do not have an account, registering for an account is free and simple. ',style: textStyle,
          ),
          TextButton(
            style: AppBarStyle.linkStyle,
            onPressed: (){},
             child: const Text('Sing up',)
             ),
          const Text('If you signed up but didn\'t get your verification email.',style: textStyle,
          ),
          TextButton(
            style: AppBarStyle.linkStyle,
            onPressed: (){},
             child: const Text('Verify email',)
             ),
        ]
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({super.key});

  @override
  State<_FormWidget> createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  String? errorText;
  void _auth (){   
    if(_loginTextController.text == 'admin' && _passwordTextController.text == 'admin'){
      errorText = null;
    }else{
      errorText =  'Wrong login or password ';
    }
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 16);
    const  textfildDecoration=  InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.all(10),
            isCollapsed: true);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [        
        const SizedBox(height: 20,),
        const Text('Username',style: textStyle,),
        const SizedBox(height: 5,),
        TextField(
          controller: _loginTextController,
          decoration: textfildDecoration,
          ),
        const SizedBox(height: 10,),
        const Text('Password',style: textStyle,),
        const SizedBox(height: 5,),
        TextField(
          controller: _passwordTextController,
          decoration: textfildDecoration,
          obscureText: true,
          ),
        const SizedBox(height: 20,),
        if(errorText != null)...[
          Text('$errorText',style:
           const TextStyle(
            color: Colors.red,
            fontSize: 16
          ),
          ),
          const SizedBox(height: 20,)
        ],
        Row(
          children: [
            ElevatedButton(
            style:const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(1, 180, 228, 1))
              ),
            onPressed: _auth,
             child: const Text('Log In',style:
              TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400
              ),
              
              )
             ),
             const SizedBox(width: 20,),
             TextButton(
              style: AppBarStyle.linkStyle,
            onPressed: (){},
             child: const Text('Reset password',)
             ),
          ],
        ),
      ],
    );
  }
}