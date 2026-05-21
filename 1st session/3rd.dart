class Parent {
  List<int> _numbers = [1, 2, 3, 4, 5];

  List<int> numbers() {
    return _numbers.where((n) => n % 2 != 0).toList();
  }
}

class Child extends Parent {
  void x(Function func) {
    print(func());
  }
}
void main() {
  Child child = Child();

  child.x(() => child.numbers());
}