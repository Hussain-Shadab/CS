import 'package:coffee_shop/provider/drop_down_button_provider.dart';
import 'package:coffee_shop/resources/component/custom_text.dart';
import 'package:coffee_shop/resources/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DropDownButton extends StatefulWidget {
  const DropDownButton({super.key});

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
   // Variable to store the selected value


  @override
  Widget build(BuildContext context) {
    final dropDownButtonProvider = Provider.of<DropDownButtonProvider>(context);
    List<String> items = ['Islamabad', 'Lahore', 'Peshawar', 'Sialkot']; // Dropdown items
    return Consumer<DropDownButtonProvider>(builder: (context , provider, child){
      return DropdownButton<String>(
        iconSize: 25.sm,
        icon: Icon(Icons.keyboard_arrow_down_outlined,color: AppColors.greyColor,),
        dropdownColor: AppColors.blackColor,

        // style: TextStyle(color: AppColors.greyColor),
        value: (provider.selectedItem != null && provider.selectedItem!.isNotEmpty)? provider.selectedItem:null, // Currently selected value
        hint: Text( 'Select Location',style: TextStyle(color: AppColors.greyColor),),// Hint text when no value is selected
        onChanged: (String? newItem) {
          if(newItem != null){
            dropDownButtonProvider.updateItem(newItem);
          }
        },
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(

            value: value,
            child: Text(value,
              style: TextStyle(

                  color: provider.selectedItem == value ? AppColors.greyColor : AppColors.whiteColor

              ),
            ), // Display the item text
          );
        }).toList(), // Convert the mapped items to a list
      );
    });
  }
}