import 'package:coffee_shop/resources/component/custom_text.dart';
import 'package:coffee_shop/resources/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropDownButton extends StatefulWidget {
  const DropDownButton({super.key});

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  String? selectedItem; // Variable to store the selected value
  List<String> items = ['Islamabad', 'Lahore', 'Peshawar', 'Sialkot']; // Dropdown items

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      iconSize: 25.sm,
      icon: Icon(Icons.keyboard_arrow_down_outlined,color: AppColors.greyColor,),
      dropdownColor: AppColors.blackColor,

      // style: TextStyle(color: AppColors.greyColor),
      value: selectedItem, // Currently selected value
      hint: Text( 'Select Location',style: TextStyle(color: AppColors.greyColor),),// Hint text when no value is selected
      onChanged: (String? newValue) {
        setState(() {
          selectedItem = newValue;// Update the selected value

        });
      },
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(

          value: value,
          child: Text(value,
          style: TextStyle(

            color: selectedItem == value ? AppColors.greyColor : AppColors.whiteColor

          ),
          ), // Display the item text
        );
      }).toList(), // Convert the mapped items to a list
    );
  }
}