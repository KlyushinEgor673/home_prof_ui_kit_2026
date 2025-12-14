import 'package:flutter/material.dart';
import 'package:home_prof_ui_kit_2026/home_prof_ui_kit_2026.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          BigButton(color: BigButtonColor.blue, onTap: (){}),
          ChipsButton(color: ChipsButtonColor.gray, onTap: (){}),
          SmallButton(color: SmallButtonColor.lightBlue, onTap: (){}, text: 'Подтвердить'),
          CartButton(price: '500', onTap: (){})
        ],
      ),
    );
  }
}
