import 'package:animation_painter/paint_animation.dart';
import 'package:flutter/material.dart';

class ImageScreen2 extends StatelessWidget {
  const ImageScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const AnimationPainter()));
          },
        ),
      ),
      body: Image.asset(
        'assets/images/image1.jpg',
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
