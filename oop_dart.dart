import 'dart:io';

// Feature 1: Object-oriented model using classes and inheritance

// Parent class
class Animal {
  void makeSound() {
    print("Some generic sound");
  }
}

// Child class inheriting from Animal
class Dog extends Animal {
  @override
  void makeSound() {
    print("Woof!");
  }
}

// Feature 2: Class that implements an interface

// Interface
abstract class Shape {
  double calculateArea();
}

// Class implementing the Shape interface
class Circle implements Shape {
  double radius;

  Circle(this.radius);

  @override
  double calculateArea() {
    return 3.14 * radius * radius;
  }
}

// Feature 3: Class that overrides an inherited method
// Already implemented in feature 1

// Feature 4: Instance of a class initialized with data from a file

// Class to represent a Person
class Person {
  String name;
  int age;

  Person(this.name, this.age);

  @override
  String toString() {
    return 'Name: $name, Age: $age';
  }
}

// Method to read data from a file and initialize Person objects
List<Person> readFromFile(String filename) {
  List<Person> people = [];

  // Read data from file and initialize Person objects
  try {
    File file = File(filename);
    List<String> lines = file.readAsLinesSync();

    for (String line in lines) {
      List<String> parts = line.split(',');
      if (parts.length == 2) {
        String name = parts[0];
        int age = int.tryParse(parts[1]);
        if (age != null) {
          Person person = Person(name, age);
          people.add(person);
        }
      }
    }
  } catch (e) {
    print("Error reading file: $e");
  }

  return people;
}

// Feature 5: Method that demonstrates the use of a loop
void printPeople(List<Person> people) {
  for (Person person in people) {
    print(person);
  }
}

void main() {
  // Feature 4 usage
  List<Person> people = readFromFile('data.csv');
  printPeople(people);

  // Feature 1 usage
  Dog dog = Dog();
  dog.makeSound();

  // Feature 2 usage
  Circle circle = Circle(5);
  print("Area of circle: ${circle.calculateArea()}");
}
