# Dart Essentials

I will try to document the nuances in my app - [Tech Quest](https://tiny.one/techquestapp) problems with the tag `dart` will have solutions solved using the Dart language.

- [Neetcode](./lib/neetcode)
- [Structy.net](./lib/structy)
- [Algo Monster](./lib/algo-monster)
- [Leetcode](./lib/leetcode)

## Important Links
- [Dart - egghead.io](https://egghead.io/courses/getting-started-with-dart-e1b1780f)
- [Dart youtube](https://www.youtube.com/watch?v=F3JuuYuOUK4)
- [Dart Testing - Youtube](https://www.youtube.com/watch?v=NYi1saTtP-0&t=64s)
- [Neetcode.io](https://neetcode.io)
- [Structy.net](https://structy.net)
- [Algo Monster](https://algo.monster/)
- [Leetcode](https://leetcode.com)

## FAQ Troubleshooting
- [Collections as optional arguments in Dart](https://stackoverflow.com/questions/69403241/flutterdart-cannot-remove-from-unmodifiable-list)

## Useful Packages

## Rules

Rules is a simple yet powerful and feature-rich validation library for both dart and flutter.
similar to **class-validator** in Typescript or **bean-validation** in Java

- Link: [rules 2.0.0](https://pub.dev/packages/rules)

---

## Equal operator and IDENTICAL in Dart

Dart has two approaches to determine if two references are the same:

- the **==** operator
- the top-level functoin **identical**

The **==** operator has a default implementation in class **Object** that implements
the **identical()** function.

An Object subclass can override it's equal operator, hashcode and string methods. Code snippet shown below:

```dart
import 'package:rules/rules.dart';

/**
  * Shows how similar == and identical are
*/
void exec() {
  Map<String, String> company = new Map<String, String>();
  company['name'] = 'Google';
  company['year'] = '2000';
  company['location'] = 'San Jose';

  Map<String, String> duplicate = new Map<String, String>();
  company['name'] = 'Google';
  company['year'] = '2000';
  company['location'] = 'San Jose';

  Map<String, String> anotherDuplicate = company;

  String answer;

  final rule = Rule(
	  company['name'],
	  name: 'company(name)',
	  isRequired: true,
	  isEmail: true
  );

  if (rule.hasError){
	print(rule.error);
  }

  answer = identical(company, company).toString();
  print('is company IDENTICAL to company: ${answer}');
  
  answer = identical(company, duplicate).toString();
  print('is company IDENTICAL to duplicate: ${answer}');

  answer = (company == duplicate).toString();
  print('is company == to duplicate: ${answer}');

  Car car1 = new Car('Ford');
  Car car2 = new Car('Ford');

  answer = identical(car1, car2).toString();
  print('is car1 IDENTICAL to car2: ${answer}');

  answer = (car1 == car2).toString();
  print('Car1 is ${car1}');
  print('Car2 is ${car2}');
  print('is car1 == to car2: ${answer}');
}

/*
 * Now every instance of Car class checks for their attributes 
*/
class Car {
  Car(this.model);
  String model;

  @override
  bool operator ==(Object other) {
    if (other is Car) {
      return model == other.model;
    }
    return false;
  }

  @override
  int get hashCode => model.hashCode; // this line overrides the hash code


  @override
  String toString() {
	return 'Car{\n model:${model} \n}';
  }

}
```






