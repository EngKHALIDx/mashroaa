import 'package:flutter/material.dart';
import 'package:mashroaa/size/sizeconfig.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  late AnimationController _controller;

  // Controllers for TextField
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 6),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);  // Initialize the size config

    return Scaffold(
      backgroundColor: Color(0xFF23242A),
      body: Center(
        child: Container(
          width: SizeConfig.screenWidth! * 0.85,
          height: SizeConfig.screenHeight! * 0.65,
          decoration: BoxDecoration(
            color: Color(0xFF1C1C1C),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.55),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Stack(
            children: [
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _controller.value * 2.0 * 3.14159,
                    child: CustomPaint(
                      painter: GradientPainter(),
                    ),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),
                    decoration: BoxDecoration(
                      color: Color(0xFF28292D),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Sign In',
                          style: TextStyle(
                            color: Color(0xFF45F3FF),
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.1,
                            fontSize: SizeConfig.defaultSize! * 3,
                          ),
                        ),
                        SizedBox(height: SizeConfig.defaultSize! * 3),
                        InputBox(
                          controller: _usernameController,
                          label: 'Username',
                          focusNode: _usernameFocusNode,
                        ),
                        SizedBox(height: SizeConfig.defaultSize! * 2),
                        InputBox(
                          controller: _passwordController,
                          label: 'Password',
                          obscureText: true,
                          focusNode: _passwordFocusNode,
                        ),
                        SizedBox(height: SizeConfig.defaultSize! * 2),
                        // Updated to use SingleChildScrollView for better handling of overflow
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    color: Color(0xFF8F8F8F),
                                    fontSize: SizeConfig.defaultSize! * 1.4,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Color(0xFF8F8F8F),
                                    fontSize: SizeConfig.defaultSize! * 1.4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: SizeConfig.defaultSize! * 3),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF45F3FF),
                            padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.defaultSize! * 2.5,
                              vertical: SizeConfig.defaultSize! * 1.7,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 5,
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.defaultSize! * 1.7,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Create a gradient paint
    Paint paint = Paint()
      ..shader = LinearGradient(
        colors: [Colors.transparent, Color(0xFF45F3FF), Color(0xFF45F3FF)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    // Save the canvas state before transformations
    canvas.save();

    // Apply translation
    canvas.translate(SizeConfig.screenWidth! * 0.85, SizeConfig.screenHeight! * 0.65);

    // Optional: If you want to rotate the canvas, replace 0 with your desired rotation angle
    // canvas.rotate(0); // This line doesn't do anything as rotating by 0 doesn't change the canvas

    // Draw a rectangle with proper dimensions
    double rectWidth = SizeConfig.screenWidth! * 0.85;  // Example width of 100
    double rectHeight =  SizeConfig.screenHeight! * 0.65; // Example height of 200

    canvas.drawRect(
      Rect.fromLTWH(0, 0, 0, rectHeight), // Define the rectangle with width and height
      paint,
    );

    // Restore the canvas state after transformations
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class InputBox extends StatelessWidget {
  final String label;
  final bool obscureText;
  final TextEditingController controller;
  final FocusNode focusNode;

  InputBox({
    required this.label,
    this.obscureText = false,
    required this.controller,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        focusNode: focusNode,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: focusNode.hasFocus || controller.text.isNotEmpty
                ? Color(0xFF45F3FF)
                : Colors.grey,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF45F3FF), width: 2),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 20),
        ),
      ),
    );
  }
}
