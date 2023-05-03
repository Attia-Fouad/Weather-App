import 'package:flutter/material.dart';
import 'package:weather_app1/presentation/screens/home_screen.dart';
import 'package:weather_app1/presentation/screens/weather_screen.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen two'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen(),));
              },

              child: const Text('Replace this  screen with Home'),
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
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const WeatherScreen(),
                    ),
                        (route) => false);
              },

              child: const Text('Go to Weather Screen'),
            ),

          ],
        ),
      ),
    );
  }
}
