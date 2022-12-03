import 'package:flutter/material.dart';

class LoadingAppWidget extends StatefulWidget {
  const LoadingAppWidget

  ({super.key});

  @override
  State<LoadingAppWidget> createState() => _LoadingAppWidgetState();
}

class _LoadingAppWidgetState extends State<LoadingAppWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 500), () => {
      Navigator.pushNamed(context, '/home')
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: const Center(
        child: Image(
          image: AssetImage("assets/app-logo.png"),
        ),
      ),
    );
  }
}
