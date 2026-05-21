class Parent {

  List<int> _numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  Map<String, dynamic> _info = {
    "name": "Saiful",
    "age": 22,
    "city": "Chattogram"
  };

  List<int> numbers() {
    return _numbers.where((num) => num % 2 != 0).toList();
  }

  dynamic info(String key) {
    return _info[key];
  }
}

void main() {

  Parent obj = Parent();

  print(obj.numbers());
  print(obj.info("name"));
}