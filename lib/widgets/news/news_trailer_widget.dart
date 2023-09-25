import 'package:flutter/material.dart';

class NewTrailerWidget extends StatelessWidget {
  const NewTrailerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 225,
      child: FittedBox(
        fit: BoxFit.fitHeight,
        child: Image.asset('assets/images/backImage.png'),
      ),

    );
  }
}