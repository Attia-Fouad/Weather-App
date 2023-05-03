import 'package:flutter/material.dart';
import 'package:weather_app1/presentation/screens/screen_one.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ScreenOne(),));
              },
              child: const Text('Go To Screen One'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.maybePop(context);
              },

              child: const Text('May Be Back'),
            ),
            const SizedBox(height: 50,),
            ElevatedButton(
              onPressed: () {
                // if(Navigator.canPop(context))
                  Navigator.pop(context);

              },

              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}