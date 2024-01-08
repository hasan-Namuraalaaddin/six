import 'package:flutter/material.dart';
import 'package:screen_six/welcome.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
           Padding(
             padding: const EdgeInsets.only(top:40.0,right: 300),
             child: IconButton(
                     onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => const WelcomeScreen()),
              );
                     },
                     icon: const Icon(
              Icons.arrow_back,
                     ),
                   ),
           ),
          const Center(
            child: Text(
              'Favorite',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
