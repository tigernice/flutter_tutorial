import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'calculate_view.dart';
import 'quiz_view.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        centerTitle: true,
        // actions: [
        //     IconButton(
        //       icon: Icon(Icons.settings),
        //       onPressed: () {
        //         Navigator.pushNamed(context, '/settings');
        //       },
        //     ),
        // ],
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Số cột
            crossAxisSpacing: 10, // Khoảng cách giữa các cột
            mainAxisSpacing: 10, // Khoảng cách giữa các dòng
          ),
          children: [
            Card(
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => QuizView()));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: 'quiz',
                      child: Icon(
                        Icons.quiz,
                        size: 50,
                        color: Colors.blue,
                      ),
                    ),
                    // Icon(
                    //   Icons.quiz,
                    //   size: 50,
                    //   color: Colors.blue,
                    // ),
                    Text(
                      'Quiz',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CalculateView()));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.calculate,
                      size: 50,
                      color: Colors.blue,
                    ),
                    Text(
                      'Calculator',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}