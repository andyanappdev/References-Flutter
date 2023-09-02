import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:onboarding_screens/main_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Welcome to My App',
              body: 'This is the first page.',
              image: Image.asset('assets/images/1.png'),
              decoration: _getPageDecoration(),
            ),
            PageViewModel(
              title: 'Welcome to My App',
              body: 'This is the second page',
              image: Image.asset('assets/images/2.png'),
              decoration: _getPageDecoration(),
            ),
            PageViewModel(
              title: 'Welcome to My App',
              body: 'This is the third page',
              image: Image.asset('assets/images/3.png'),
              decoration: _getPageDecoration(),
            ),
          ],
          done: const Text('Done'),
          onDone: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MainScreen()),
            );
          },
          next: const Icon(Icons.arrow_forward),
          showSkipButton: true,
          skip: const Text('Skip'),
          dotsDecorator: DotsDecorator(
            color: Colors.cyan,
            size: const Size(10, 10),
            activeSize: const Size(22, 10),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            activeColor: Colors.red,
          ),
          curve: Curves.bounceOut, // 애니메이션 설정
        ),
      ),
    );
  }
}

PageDecoration _getPageDecoration() {
  return const PageDecoration(
    titleTextStyle: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    bodyTextStyle: TextStyle(
      fontSize: 18,
      color: Colors.blue,
    ),
    imagePadding: EdgeInsets.only(top: 40),
    pageColor: Colors.orange,
  );
}
