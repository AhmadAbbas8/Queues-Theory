import 'package:flutter/material.dart';
import 'package:queue/Helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Problem Type',
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextButton(
              width: MediaQuery.of(context).size.width,
              buttonName: 'deterministic queueing system',
              onPress: () {
                Navigator.pushNamed(context, 'deterministic');
              },
            ),
            SizedBox(height: 80),
            CustomTextButton(
              width: MediaQuery.of(context).size.width,
              buttonName:  'Stochastic queueing system',
              onPress: () { },
            ),
          ],
        ),
      ),
    );
  }
}
