import 'package:flutter/material.dart';
import 'package:lessons_18/widgets/user_profile.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: UserProfileWidget(),
    );
  }
}
