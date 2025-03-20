
class Rectangle {
  num  _width = 0;
  num  _height = 0;

  set width(num width) {
      if(width > 0){
    this._width = width;
  }
  }
  
  set height(num height) {
    if (height > 0 ){
      this._height = height;
    }
  }
  getAria(){
    print(_width*_height);
  }
  
  Rectangle(this._width,this._height);
}