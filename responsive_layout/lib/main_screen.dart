import 'package:flutter/material.dart';
import 'package:responsive_layout/responsive/desktop_body.dart';
import 'package:responsive_layout/responsive/mobile_body.dart';
import 'package:responsive_layout/responsive/responsive_layout.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Layout'),
      ),
      body: ResponsiveLayout(
        mobileBody: MobileBody(),
        desktopBody: DesktopBody(),
      ),
    );
  }
}
