


import 'package:flutter/material.dart';

class DropDownButtonProvider extends ChangeNotifier{


  String? _selectedItem;
  String ?get selectedItem => _selectedItem;
  void updateItem(String item){
    _selectedItem =item;
    notifyListeners();
  }
}