import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onboarding_dashboard_app/features/login/ui/login.dart';

void main() {
  testWidgets('Login button triggers loading animation', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    final emailField = find.byType(TextField).at(0);
    final passField = find.byType(TextField).at(1);
    final loginButton = find.text('Login');

    // Enter data
    await tester.enterText(emailField, 'test@example.com');
    await tester.enterText(passField, '123456');
    await tester.tap(loginButton);
    await tester.pump(); // Start animation

    // Should show CircularProgressIndicator
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pumpAndSettle(const Duration(seconds: 3));
  });
}
