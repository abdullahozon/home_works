/*
 9. OOP, Constructors & Getters
 Create a class `Rectangle` with:- Private attributes `_width` and `_height`.- A constructor that initializes the values.- A getter `area` that calculates and returns the area.
 In `main()`, create a `Rectangle` object and print its area.
*/

import 'q9_regtangle.dart';

void main() {  
  Rectangle rec = Rectangle(-2, 5); // لا يمكن أن يكون العرض سالبًا
  rec.getArea(); // يجب استدعاء دالة getArea بدلاً من getAria
}
