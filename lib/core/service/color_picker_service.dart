import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorPickerService extends GetxService{
  static ColorPickerService get to => Get.find();

  //initialize color picker service class
  Future<ColorPickerService> init() async{
    return this;
  }

  final _selectedColor = RxInt(0x365BF4FF);
  int get selectedColor => _selectedColor.value;

  String get hexCode => selectedColor.toRadixString(16);

  // ValueChanged<Color> callback
  void changeColor(Color color) {
    _selectedColor.value = color.value;
  }

}