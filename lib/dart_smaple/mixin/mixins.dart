void main() {
  (new Bird()).swim();
  (new Fish()).swim();
}

mixin Swiming {
  void swim() {
    print("swiming");
  }
}

class Bird with Swiming {
  @override
  void swim() {
    // TODO: implement swim
    super.swim();
    print("i am bird");
  }
}

class Fish with Swiming {
  @override
  void swim() {
    // TODO: implement swim
    super.swim();
    print("i am fish");
  }
}
