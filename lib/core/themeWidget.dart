import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeWidget {
  static ThemeData get themeData {
    return ThemeData(
      
      scaffoldBackgroundColor: Color.fromARGB(255, 181, 171, 197), // تخصيص لون الخلفية لجميع الصفحات

      useMaterial3: true,


      
      appBarTheme: AppBarTheme(


        backgroundColor: Color.fromARGB(255, 42, 22, 74),
      
      ),
    );
  }
}
