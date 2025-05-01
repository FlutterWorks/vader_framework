import 'package:shelf_plus/shelf_plus.dart';

import 'person.dart';

final data = <Person>[
  Person(id: '1', firstName: 'John', lastName: 'Doe', age: 42),
  Person(id: '2', firstName: 'Jane', lastName: 'Doe', age: 43),
];

class PersonModule {
  static Handler handler() {
    var app = Router().plus;

    app.get('/', () => 'Test123');

    app.get('/person', () => data);

    app.get('/person/<id>',
            (Request request, String id) => data.where((person) => person.id == id));

    app.post('/person', (Request request) async {
      var newPerson = await request.body.as(Person.fromJson);
      data.add(newPerson);
      return {'ok': 'true', 'person': newPerson.toJson()};
    });

    app.put('/person/<id>', (Request request, String id) async {
      data.removeWhere((person) => person.id == id);
      var person = await request.body.as(Person.fromJson);
      person = person.copyWith(id: id);
      data.add(person);
      return {'ok': 'true'};
    });

    app.delete('/person/<id>', (Request request, String id) {
      data.removeWhere((person) => person.id == id);
      return {'ok': 'true'};
    });

    return app.call;
  }
}