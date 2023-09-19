
import 'package:flutter/material.dart';
import 'package:themovedb/Theme/app_button_style.dart';
import 'package:themovedb/widgets/common/common_widgets.dart';

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
          const SizedBox(height: 20,)
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
  final _loginTextController = TextEditingController(text: 'admin');
  final _passwordTextController = TextEditingController(text: 'admin');
  String? errorText;
  void _auth (){   
    if(_loginTextController.text == 'admin' && _passwordTextController.text == 'admin'){
      Navigator.of(context).pushReplacementNamed('/main_screen');
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