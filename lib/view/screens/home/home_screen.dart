import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waleed_project/widgets/custom_botton.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Container(
                  decoration: const BoxDecoration(
                    color: Colors.deepPurple,
                  ),
                  height: 200,
                  width: double.maxFinite,
                  child: Container(
                    padding: EdgeInsets.only(bottom: 70, left: 40),
                    child: Row(
                      children: const [
                        Text(
                          'Welcome',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 1),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('God\'s Favorites',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  )),
            ],
          ),
          Positioned(
            top: 100,
            left: 42,
            child: Container(
              height: 180,
              width: 270,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: const Offset(0, 4),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 34.0, vertical: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Credit Limit'),
                        SizedBox(
                          width: 60,
                        ),
                        Text('GHC 100.0'),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    const Text(
                        'Get it delivered to your account in less then two minutes'),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                        fontSize: 17,
                        width: 140,
                        height: 40,
                        text: 'Apply Now',
                        onPressed: () {}),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 300,
            child: Column(
              children: const [
                Icon(
                  Icons.history_edu_outlined,
                  size: 40,
                ),
                Text('History'),
              ],
            ),
          ),
          Positioned(
            top: 370,
            child: Column(
              children: [
                SizedBox(
                  height: 170,
                  width: 400,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 200,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        height: 70,
                        width: 260,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.deepPurple,
                          image: const DecorationImage(
                            image: AssetImage('assets/images/download.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
              left: 20,
              child: Container(
            color: Colors.white,
                height: 80,
                width: 320,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: const [
                        Text('Services',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      ],
                    ),
                    SizedBox(height: 3,),
                    SizedBox(
                      height: 50,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 48,
                            width: 55,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/money.jpg'),
                                  fit: BoxFit.cover,
                                ),
                                color: Colors.white,
                              ),

                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(' Always Refused?',style: TextStyle(fontWeight: FontWeight.w500),),
                              Text(' check your credit here.\n recommend more platform',style: TextStyle(fontWeight: FontWeight.w300)),
                            ],
                          ),
                          CustomButton(
                              fontSize: 12,
                              height: 30,
                              width: 70,
                              text: "Check", onPressed: (){}),
                        ],
                      ),

                    ),
                  ],
                ),
          ))
        ],
      ),
    );
  }
}
