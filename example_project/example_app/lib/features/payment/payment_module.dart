import 'package:example_app/features/app/app_module.dart';
import 'package:example_app/features/payment/payment_page.dart';
import 'package:example_app/features/payment/payment_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:vader_app/vader_app.dart';

class PaymentModule extends AppModule {
  @override
  List<GoRoute> get routes => PaymentRoutes.routes;

  @override
  Injector? get services {
    return super.services!
      ..add(PaymentRepository.new)
      ..commit();
  }
}

enum PaymentRoutes {
  payment(PaymentPage());

  const PaymentRoutes(Widget page) : _page = page;

  final Widget _page;

  static final routePath = '/payment';

  get path => Routes.path(routePath, name);

  static List<GoRoute> get routes => [Routes.route(routePath, PaymentRoutes.payment._page)];
}
