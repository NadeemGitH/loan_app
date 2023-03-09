import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waleed_project/widgets/custom_botton.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
                  height: Get.height * 0.3,
                  width: double.maxFinite,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      const Text(
                        'Settings',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            bottom: Get.height * 0.04, left: Get.height * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/download.jpg'),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: M,
            children: [
              const SizedBox(
                height: 15,
              ),
              Wrap(
                spacing: 44,
                children: [
                  Column(
                    children: const [
                      Icon(Icons.wallet_membership),
                      Text('Wallet'),
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(Icons.whatsapp_outlined),
                      Text('WhatsApp'),
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(Icons.history_edu_outlined),
                      Text('History'),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Wrap(
                spacing: 34,
                children: [
                  Column(
                    children: const [
                      Icon(Icons.notification_add_outlined),
                      Text('Notification'),
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(Icons.password),
                      Text('Password'),
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(Icons.contact_phone_outlined),
                      Text('Contact Us'),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.only(right: Get.height * 0.12),
                child: Wrap(
                  spacing: 60,
                  children: [
                    Column(
                      children: const [
                        Icon(Icons.help),
                        Text('Help'),
                      ],
                    ),
                    Column(
                      children: const [
                        Icon(Icons.logout),
                        Text('Log Out'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
