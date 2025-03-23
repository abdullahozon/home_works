class Rectangle {
  num _width = 0;
  num _height = 0;

  set width(num width) {
    if (width > 0) {
      this._width = width;
    } else {
      print('Width should be positive!');
    }
  }

  set height(num height) {
    if (height > 0) {
      this._height = height;
    } else {
      print('Height should be positive!');
    }
  }

  getArea() {
    print(_width * _height);
  }

  Rectangle(num width, num height) {
    this.width = width;  // استخدم الـ setters لضمان التحقق من القيم
    this.height = height;
  }
}