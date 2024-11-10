import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:appone/screens/login.dart'; 



class StartupAnimationScreen extends StatefulWidget {
  @override
  _StartupAnimationScreenState createState() => _StartupAnimationScreenState();
}

class _StartupAnimationScreenState extends State<StartupAnimationScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Fade-in and fade-out controller
    _fadeController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    // Scale-up and scale-down controller
    _scaleController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    // Define the animations
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(
        parent: _scaleController,
        curve: Curves.easeInOut,
      ),
    );

    // Start the animation sequence
    _startAnimation();
  }

  void _startAnimation() async {
    await Future.delayed(Duration(milliseconds: 200));

    // Begin the fade and scale animation
    _fadeController.forward();
    _scaleController.forward();

    // After animation completes, navigate to next screen
    await Future.delayed(Duration(seconds: 2));

    // Navigate to LoginScreen after animation
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 156, 228, 202),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min, 
//           children : [AnimatedBuilder(
//           animation: Listenable.merge([_fadeController, _scaleController]),
//           builder: (context, child) {
//             return Opacity(
//               opacity: _fadeAnimation.value,
//               child: Transform.scale(
//                 scale: _scaleAnimation.value,
//                 child: child,
//               ),
//             );
//           },
//           child: Image.asset(
//             'assets/images/imagelogo.png', // Your app logo here
//             width: 200,
//             height: 200,
//           ),
//           // child: Text('Low-effort Task Manager'),
//         ),]

//         )
//       ),
//     );
//   }
// }


@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color.fromARGB(255, 156, 228, 202),
    body: Center(
      child: AnimatedBuilder(
        animation: Listenable.merge([_fadeController, _scaleController]),
        builder: (context, child) {
          return Opacity(
            opacity: _fadeAnimation.value,
            child: Transform.scale(
              scale: _scaleAnimation.value,
              child: child,
            ),
          );
        },
        // Wrapping multiple children in a Column, treated as one "child"
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/imagelogo.png', // Your app logo here
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 16), // Spacing between image and tagline
            const Text(
              'Low-effort Task Manager', // Your tagline here
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black54, // Adjust color to your design
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
    }