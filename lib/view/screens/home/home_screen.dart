import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waleed_project/widgets/custom_botton.dart';
import 'package:get/get.dart';

import '../loan/loan_screen.dart';

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
                  height: Get.height * 0.28,
                  width: double.maxFinite,
                  child: Container(
                    padding: EdgeInsets.only(
                        bottom: Get.height * 0.07, left: Get.width * 0.17),
                    child: Row(
                      children: [
                        const Text(
                          'Welcome',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 1),
                        ),
                        SizedBox(
                          width: Get.width * 0.03,
                        ),
                        const Text('God\'s Favorites',
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
            top: Get.height * 0.14,
            left: Get.width * 0.13,
            child: Container(
              height: Get.height * 0.23,
              width: Get.width * 0.76,
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
                padding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.10, vertical: Get.height * 0.015),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Credit Limit',
                        ),
                        SizedBox(
                          width: Get.width * 0.16,
                        ),
                        const Text(
                          'GHC 100.0',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    const Text(
                        'Get it delivered to your account in less then two minutes'),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    CustomButton(
                        fontSize: 17,
                        width: Get.width * 0.4,
                        height: Get.height * 0.054,
                        text: 'Apply Now',
                        onPressed: () {
                          Get.to(() => LoanScreen());
                        }),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.4,
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
            top: Get.height * 0.49,
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.22,
                  width: Get.width * 0.99,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                        height: Get.height * 0.03,
                        width: Get.width * 0.7,
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
              bottom: Get.height * 0.03,
              left: Get.width * 0.05,
              child: Container(
                color: Colors.white,
                height: Get.height * 0.099,
                width: Get.height * 0.44,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: const [
                        Text(
                          'Services',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.001,
                    ),
                    SizedBox(
                      height: Get.height * 0.07,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: Get.height * 0.07,
                            width: Get.height * 0.07,
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
                              Text(
                                ' Always Refused?',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              Text(
                                  ' check your credit here.\n recommend more platform',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w300)),
                            ],
                          ),
                          CustomButton(
                              fontSize: 12,
                              height: Get.height * 0.04,
                              width: Get.width * 0.2,
                              text: "Check",
                              onPressed: () {}),
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
