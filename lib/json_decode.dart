import 'dart:convert';

void main() {
  // Your JSON string
  String jsonString = '{"name": "Sara", "age": 20}';

  // Decode the JSON string into a Dart Map
  Map<String, dynamic> jsonData = json.decode(jsonString);

  // Access the decoded data
  String name = jsonData['name'];
  int age = jsonData['age'];

  print('Name: $name');
  print('Age: $age');


//json=> fromJson()
  Map<String, dynamic> jsonData1 = {
    "name": "Christal",
    "age": 24,
  };

  // Create a Person object from the JSON data using fromJson()
  Person person = Person.fromJson(jsonData1);

  // Access the properties of the Person object
  print('Name: ${person.name}');
  print('Age: ${person.age}');
}

class Person {
  String name;
  int age;

  // Constructor for creating a Person object from JSON
  Person.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'];
}



