

import 'package:coffee_shop/provider/tab_buttons_provider.dart';
import 'package:coffee_shop/resources/component/tab_button.dart';
import 'package:coffee_shop/resources/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    final providerTabButtons = Provider.of<TabButtonsProvider>(context);
    return Consumer<TabButtonsProvider>(builder: (context,provider,child){
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for( int i = 0; i < buttonsText.length; i++)
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                  child: TabButtons(text: buttonsText[i],
                      isSelected: provider.selectedIndex == i ,
                      onTap: (){
                        provider.updateIndex(i);
                      })
              )
          ],
        ),
      );
    });
    
  }
}
