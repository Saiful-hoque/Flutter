class Parent {
  List<int> _numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  List<int> numbers() {
    return _numbers.where((n) => n % 2 != 0).toList();
  }

  dynamic info(String key) {
    Map<String, dynamic> _info = {
      "name": "Saiful",
      "age": 22,
      "city": "Chattogram"
    };

    return _info[key];
  }
}

class Child extends Parent {

  void x(Function func) {
    print(func());
  }
}

void main() {

  Child child = Child();
  print(child.numbers());
  print(child.info("name"));
  child.x(() => "Hello from anonymous arrow function");
}