import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mashroaa/disin/siderimge.dart';
import 'package:mashroaa/size/sizeconfig.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          
    CarouselImageSlider(),
         SizedBox(height: 10),

 buildCustomCard(),
 SizedBox(height: 10),

 buildImageGrid(),
 SizedBox(height: 10),

buildTextSection()

        ],
      )
     
      
    );
  }

  // دالة لإنشاء شبكة من الصور داخل بطاقة
 Widget buildImageGrid() {
  return GridView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
    ),
    itemCount: imgs.length,
    itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () {
          // إضافة تفاعل أو التنقل إلى صفحة تفاصيل الصورة
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[200],
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imgs[index],
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    },
  );
}
 // دالة تقوم بإرجاع بطاقة تحتوي على نص
 Widget buildCustomCard() {
  return GestureDetector(
    onTap: () {
      // إجراء عند الضغط على البطاقة (مثل الانتقال لصفحة جديدة)
    },
    child: Container(
      width: SizeConfig.screenWidth,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), // جعل الزوايا دائرية
        gradient: LinearGradient(
          colors: [Color(0xFF9E9E9E), Color(0xFFBDBDBD)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Text(
          "Khalid",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.5,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    ),
  );
}
 // قسم النصوص المتكررة
  Widget buildTextSection() {
    return Column(
      children: [
         Center(child: Text("djhih")),
        Center(child: Text("djhih")),
        Center(child: Text("djhih")),
        Center(child: Text("djhih")),
      ],
    );
  }
}
