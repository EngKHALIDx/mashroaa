import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mashroaa/NAVIGATION/bottom_nav_btn.dart';
import 'package:mashroaa/NAVIGATION/clipper.dart';
import 'package:mashroaa/NAVIGATION/constants.dart';
import 'package:mashroaa/NAVIGATION/size_config.dart';
import 'package:mashroaa/disin/accountpage.dart';
import 'package:mashroaa/disin/home.dart';
import 'package:iconly/iconly.dart';

class FinalView extends StatefulWidget {
  const FinalView({super.key});

  @override
  FinalViewState createState() => FinalViewState();
}

class FinalViewState extends State<FinalView> {
  int _currentIndex = 0;
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void animateToPage(int page) {
    pageController.animateToPage(
      page,
      duration: const Duration(
        milliseconds: 400,
      ),
      curve: Curves.decelerate,
    );
  }

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    return Scaffold(
      appBar: AppBar(
        
        title: const Text(
          "h",
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.white),
        ),
      ),
      
      body:
       SafeArea(
        bottom: false,
        child:
         Stack(
          children: [
            Positioned.fill(
                child: PageView(
              onPageChanged: (value) {
                setState(() {
                  _currentIndex = value;
                });
              },
              controller: pageController,
              children: [
                                Accountpage(),

                Homepage(),

              ],
            )),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: bottomNav(),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomNav() {
    return Padding(
      padding: EdgeInsets.fromLTRB(AppSizes.blockSizeHorizontal * 4.5, 0,
          AppSizes.blockSizeHorizontal * 4.5, 10),
      child: Material(
        borderRadius: BorderRadius.circular(30),
        color: Colors.transparent,
        elevation: 6,
        child: Container(
            height: AppSizes.blockSizeHorizontal * 18,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 33, 33, 33),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: AppSizes.blockSizeHorizontal * 3,
                  right: AppSizes.blockSizeHorizontal * 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BottomNavBTN(
                        onPressed: (val) {
                          animateToPage(val);
                          setState(() {
                            _currentIndex = val;
                          });
                        },
                        icon: IconlyLight.home,
                        currentIndex: _currentIndex,
                        index: 0,
                      ),
                      BottomNavBTN(
                        onPressed: (val) {
                          animateToPage(val);

                          setState(() {
                            _currentIndex = val;
                          });
                        },
                        icon: IconlyLight.search,
                        currentIndex: _currentIndex,
                        index: 1,
                      ),
                      BottomNavBTN(
                        onPressed: (val) {
                          animateToPage(val);

                          setState(() {
                            _currentIndex = val;
                          });
                        },
                        icon: IconlyLight.category,
                        currentIndex: _currentIndex,
                        index: 2,
                      ),
                      BottomNavBTN(
                        onPressed: (val) {
                          animateToPage(val);

                          setState(() {
                            _currentIndex = val;
                          });
                        },
                        icon: IconlyLight.setting,
                        currentIndex: _currentIndex,
                        index: 3,
                      ),
                      BottomNavBTN(
                        onPressed: (val) {
                          animateToPage(val);

                          setState(() {
                            _currentIndex = val;
                          });
                        },
                        icon: IconlyLight.profile,
                        currentIndex: _currentIndex,
                        index: 4,
                      ),
                    ],
                  ),
                ),
                AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.decelerate,
                    top: 0,
                    left: animatedPositionedLEftValue(_currentIndex),
                    child: Column(
                      children: [
                        Container(
                          height: AppSizes.blockSizeHorizontal * 1.0,
                          width: AppSizes.blockSizeHorizontal * 12,
                          decoration: BoxDecoration(
                            color: Colors.deepPurpleAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        ClipPath(
                          clipper: MyCustomClipper(),
                          child: Container(
                            height: AppSizes.blockSizeHorizontal * 15,
                            width: AppSizes.blockSizeHorizontal * 12,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: gradient,
                            )),
                          ),
                        ),
                      ],
                    ))
              ],
            )),
      ),
    );
  }
}
