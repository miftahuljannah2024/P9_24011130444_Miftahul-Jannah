import 'package:flutter_test/flutter_test.dart';
import 'package:toko_app/main.dart';
import 'package:toko_app/router/app_router.dart';
import 'package:toko_app/state/auth_state.dart';
import 'package:toko_app/state/cart_state.dart';

void main() {
  testWidgets('TokoApp smoke test', (WidgetTester tester) async {
    final router = createRouter(AuthState(), CartState());
    await tester.pumpWidget(TokoApp(router: router));
    expect(find.text('Login'), findsWidgets);
  });
}