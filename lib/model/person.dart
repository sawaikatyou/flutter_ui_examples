class Person {
  Person(this._name);

  final String _name;

  String greet(String who) => 'Hello, $who. I am $_name';
}
