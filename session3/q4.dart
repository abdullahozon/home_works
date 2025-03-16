void main() {
  Map<String, List> citys = {
    'Aleppo': ['10', '56'],
    'Paris': ['74', '67'],
  };

  void getWith() {
    print(citys['Aleppo']);
  }

  getWith();
}
