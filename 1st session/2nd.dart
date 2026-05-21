class Child {

  void x(Function func) {
    print(func());
  }
}

void main() {

  Child child = Child();

  child.x(() => "Hello from function parameter");
}