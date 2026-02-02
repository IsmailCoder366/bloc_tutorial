import 'package:flutter/material.dart';

class EquatableTesting extends StatefulWidget {
  const EquatableTesting({super.key});

  @override
  State<EquatableTesting> createState() => _EquatableTestingState();
}

class _EquatableTestingState extends State<EquatableTesting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Person person = Person(name: 'ismail', age: 20);
        Person person1 = Person(name: 'ismail', age: 20);
        print(person.hashCode.toString());
        print(person1.hashCode.toString());
        print(person == person1);
      }),
    );
  }
}

class Person{
  final int age;
  final String name;

  const Person({required this.name, required this.age});
}
