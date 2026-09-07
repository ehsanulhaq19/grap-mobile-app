import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:grap/app.dart';

void main() {
  testWidgets('Login screen renders GRAP branding', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: GrapApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('GRAP'), findsWidgets);
    expect(find.text('Sign In'), findsOneWidget);
    expect(find.text('Request access'), findsOneWidget);
  });
}
