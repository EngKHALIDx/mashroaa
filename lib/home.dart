import 'package:flutter/material.dart';
import 'package:mashroaa/disin/home.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedindex=0;
  PageController pageController=PageController();

  void onTapped(int index){
    setState(() {
      _selectedindex=index;
    });
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 1000,),curve: Curves.bounceIn);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Text(
          "اهلا ببرنامجنا ",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body:PageView (
        controller: pageController,
        children: [
          Homepage(),
          Container(color:Colors.blue),
          Container(color:Colors.green),
          Container(color:Colors.yellow),
          Container(color:Colors.orange),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: const<BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home),label:'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search),label:'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.add),label:'Add'),
        BottomNavigationBarItem(icon: Icon(Icons.notifications),label:'Notify'),
        BottomNavigationBarItem(icon: Icon(Icons.person),label:'Profile'),
      ],
          currentIndex: _selectedindex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.greenAccent,
          onTap:onTapped
      ),
    );
  }
}
