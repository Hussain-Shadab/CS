

import 'package:coffee_shop/resources/component/tab_button.dart';
import 'package:flutter/material.dart';
class TabButtonsLogic extends StatefulWidget {

  const TabButtonsLogic({super.key});

  @override
  State<TabButtonsLogic> createState() => _TabButtonsLogicState();
}

class _TabButtonsLogicState extends State<TabButtonsLogic> {
int? selectedIndex = 0;

final List<String>  buttonsText = ['All Coffee' , 'Machiato' , 'Latte' , 'Latte Special'];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for( int i = 0; i < buttonsText.length; i++)
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
          child: TabButtons(text: buttonsText[i],
              isSelected: selectedIndex == i,
              onTap: (){
            setState(() {
              selectedIndex = i;
            });
              })
        )
      ],
    );
  }
}
