import 'package:flutter/material.dart';
import 'package:home_prof_ui_kit_2026/home_prof_ui_kit_2026.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BigButton(color: BigButtonColor.white, onTap: (){},),
          ChipsButton(color: ChipsButtonColor.blue, onTap: (){}),
          SmallButton(color: SmallButtonColor.gray, onTap: (){}, text: 'Подтвердить'),
          CartButton(price: '500', onTap: (){},),
          Image.asset('images/images.jpeg')
        ],
      ),
    );
  }
}
