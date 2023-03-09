import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waleed_project/widgets/custom_appbar.dart';

class LoanScreen extends StatelessWidget {
  const LoanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Loan Application',
        showBackButton: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
