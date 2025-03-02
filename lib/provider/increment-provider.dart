import 'package:flutter/material.dart';

class CoffeProvider extends ChangeNotifier{
  int _quatity=1;
  int get quantity=>_quatity;
  int price=3;
  int price1 =4;
  int price2 = 5;
  int price3 = 6;
  increment(){
    _quatity++;
    price=quantity*3;
    price1=quantity*4;
    price2=quantity*5;
    price3=quantity*6;
    print("Price  $price");
    notifyListeners();
  }
  decrement(){

    if(_quatity > 0 ){
      _quatity--;

      price=quantity*3 ;
      price1 =quantity*4;
      price2=quantity*5;
      price3=quantity*6;
    }
    print("Price  $price");

    notifyListeners();
  }

}
