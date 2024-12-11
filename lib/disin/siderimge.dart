import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mashroaa/size/sizeconfig.dart';

final List<String> imgList = [
  'img/image1.jpg',
  'img/image1.jpg',
  'img/image1.jpg',
];
final List<String> imgs = [
  'img/imag0.jpg',
  'img/imag4.jpg',
  'img/imag2.jpg',
  'img/imag3.jpg',
];

class CarouselImageSlider extends StatefulWidget {
  const CarouselImageSlider({Key? key}) : super(key: key);

  @override
  _CarouselImageSliderState createState() => _CarouselImageSliderState();
}

class _CarouselImageSliderState extends State<CarouselImageSlider> {

  @override
  Widget build(BuildContext context) {
    // استدعاء التهيئة مرة واحدة فقط عند بداية build
    SizeConfig().init(context);

    return 
        
        Container(
  height: SizeConfig.screenHeight! / 4,
  decoration: const BoxDecoration(
    gradient: LinearGradient(
      colors: [
         // اللون الأسود في الأعلى
        Color.fromARGB(255, 42, 22, 74),
        Color.fromARGB(0, 0, 0, 0), // اللون الأبيض في الأسفل
      ],
      begin: Alignment.topCenter, // يبدأ التدرج من الأعلى
      end: Alignment.bottomCenter, // ينتهي التدرج في الأسفل
    ),
  ),
  child: CarouselSlider(
    options: CarouselOptions(
      viewportFraction: 0.8,
      pageSnapping: false,
      autoPlay: true,
      aspectRatio: 2.0,
      enlargeCenterPage: true,
    ),
    items: imgList.map((item) => _buildImageItem(item)).toList(),
  ),
);

  
        
         
       
   
  }

  Widget _buildImageItem(String item) {
    return Container(

      height: SizeConfig.screenHeight! * 10,
      padding: const EdgeInsets.only(bottom: 8, top: 20, left: 0, right: 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Stack(

          children: <Widget>[
            Image.asset(item, fit: BoxFit.cover, width: double.infinity),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                  

                    colors: [
                      Color.fromARGB(5, 0, 0, 0), // اللون البنفسجي
        Color.fromARGB(0, 0, 0, 0),   // اللون الأحمر
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
               
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                alignment: Alignment.bottomLeft,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
