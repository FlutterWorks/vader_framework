import 'package:shelf_plus/shelf_plus.dart';
import 'package:shelf_service/hello/hello_module.dart';
import 'package:shelf_service/person/person_module.dart';

void main() => shelfRun(init, defaultBindAddress: '0.0.0.0', defaultBindPort: 8080);

Handler init() {
  return cascade([HelloModule.handler(), PersonModule.handler()]);
}
