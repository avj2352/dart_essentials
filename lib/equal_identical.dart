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
