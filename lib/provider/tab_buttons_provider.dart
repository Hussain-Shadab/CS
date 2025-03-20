


import 'package:flutter/cupertino.dart';

class TabButtonsProvider extends ChangeNotifier{

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;


  void updateIndex(int index){
    _selectedIndex = index;
    notifyListeners();
  }

  }
class CoffeeProvider extends ChangeNotifier{
  final List<Map<String, dynamic>> coffeeItems = [
    {'title': 'Flat White', 'subTitle': 'Expresso', 'price': 5, 'category': 'All Coffee'},
    {'title': 'Mocha Fusi', 'subTitle': 'Ice/Hot', 'price': 6, 'category': 'All Coffee'},
    {'title': 'Coffee Machao', 'subTitle': 'Deep Foam', 'price': 7, 'category': 'Machiato'},
    {'title': 'Coffee Pana', 'subTitle': 'Ice/Hot', 'price': 8, 'category': 'Latte'},
    {'title': 'Latte Special', 'subTitle': 'Creamy Foam', 'price': 9, 'category': 'Latte Special'},
  ];
}
