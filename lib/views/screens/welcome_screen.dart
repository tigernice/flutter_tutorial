import 'package:flutter/material.dart';

import 'home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width, // lấy kích thước màn hình
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.6,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.6,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.indigo,
                        Colors.purple,
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(70),
                    ),
                  ),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20), // Bán kính bo góc
                      child: Image.asset(
                        'assets/gif/hamster-14608_512.gif',
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.width / 2,
                        fit: BoxFit.cover, // Tùy chọn điều chỉnh hiển thị hình ảnh
                      ),
                    ),
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.666,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.indigo,
                      Colors.purple,
                    ],
                  ),
                ),
              )
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.664,
                padding: EdgeInsets.only(top: 40, bottom: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(70),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      'Welcome to Quiz App',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Let\'s start the quiz',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30 , vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.indigo,
                            Colors.purple,
                          ],
                        ),
                      ),
                      child : InkWell(
                        onTap: (){
                          Navigator.push( // push , pushReplacement
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                              )
                          );
                        },
                        child: Text('start quiz', style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1
                        )),
                      )
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}