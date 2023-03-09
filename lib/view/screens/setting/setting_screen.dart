import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waleed_project/widgets/custom_botton.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

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
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),
                  ),
                  height: 250,
                  width: double.maxFinite,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: 10,),
                      const Text(
                        'Settings',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),

                      Container(
                        padding: EdgeInsets.only(bottom: 50, left: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const CircleAvatar(
                              backgroundImage: AssetImage('assets/images/download.jpg'),
                              backgroundColor: Colors.red,
                              radius: 33,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  '0208988874',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                ),
                                Text('keep good credit\'s enjoy loan',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
          Positioned(
            top: 190,
            left: 45,
            child: Container(
              height: 160,
              width: 270,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: const Offset(0, 1),
                    blurRadius: 3,
                  ),
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: const [
                            Text('Wallet'),
                            SizedBox(
                              width: 10,
                            ),
                            Text('0'),
                          ],
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Column(
                          children: const [
                            Text('Invite Code'),
                            SizedBox(
                              width: 10,
                            ),
                            Text('LPH045'),
                          ],
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Column(
                          children: const [
                            Text('loan Amount'),
                            SizedBox(
                              width: 10,
                            ),
                            Text('0'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 350,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: M,
              children:  [
                Container(
                    child: Text('Other Services')),
                Wrap(
                  spacing: 30,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.wallet_membership),
                        Text('Wallet'),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.whatsapp_outlined),
                        Text('WhatsApp'),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.history_edu_outlined),
                        Text('History'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Wrap(
                  spacing: 50,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.notification_add_outlined),
                        Text('Notification'),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.password),
                        Text('Password'),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.contact_phone_outlined),
                        Text('Contact Us'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Wrap(
                  runSpacing: 20,
                  alignment: WrapAlignment.spaceEvenly,
                  runAlignment: WrapAlignment.start,
                  spacing: 50,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.help),
                        Text('Help'),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.logout),
                        Text('Log Out'),
                      ],
                    ),
                  ],
                ),

              ],
            ),
          ),
          // Positioned(
          //   top: 370,
          //   child: Column(
          //     children: [
          //       SizedBox(
          //         height: 170,
          //         width: 400,
          //         child: ListView.builder(
          //           scrollDirection: Axis.horizontal,
          //           itemCount: 200,
          //           itemBuilder: (BuildContext context, int index) {
          //             return Container(
          //               margin: const EdgeInsets.symmetric(horizontal: 8.0),
          //               height: 70,
          //               width: 260,
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(20),
          //                 color: Colors.deepPurple,
          //                 image: const DecorationImage(
          //                   image: AssetImage('assets/images/download.jpg'),
          //                   fit: BoxFit.cover,
          //                 ),
          //               ),
          //             );
          //           },
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // Positioned(
          //     bottom: 10,
          //     left: 20,
          //     child: Container(
          //       color: Colors.white,
          //       height: 80,
          //       width: 320,
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Column(
          //             children: const [
          //               Text('Services',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
          //             ],
          //           ),
          //           SizedBox(height: 3,),
          //           SizedBox(
          //             height: 50,
          //             child: Row(
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Container(
          //                   height: 48,
          //                   width: 55,
          //                   decoration: const BoxDecoration(
          //                     image: DecorationImage(
          //                       image: AssetImage('assets/images/money.jpg'),
          //                       fit: BoxFit.cover,
          //                     ),
          //                     color: Colors.white,
          //                   ),
          //
          //                 ),
          //                 Column(
          //                   mainAxisAlignment: MainAxisAlignment.start,
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: const [
          //                     Text(' Always Refused?',style: TextStyle(fontWeight: FontWeight.w500),),
          //                     Text(' check your credit here.\n recommend more platform',style: TextStyle(fontWeight: FontWeight.w300)),
          //                   ],
          //                 ),
          //                 CustomButton(
          //                     fontSize: 12,
          //                     height: 30,
          //                     width: 70,
          //                     text: "Check", onPressed: (){}),
          //               ],
          //             ),
          //
          //           ),
          //         ],
          //       ),
          //     ))
        ],
      ),
    );
  }
}
