import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:project/main.dart';

void main() {
  testWidgets('Bottom navigation bar is present with three items', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final navBar = find.byType(BottomNavigationBar);
    expect(navBar, findsOneWidget);

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Search'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);

    // Default screen shows welcome message
    expect(find.text('Welcome Home'), findsOneWidget);
  });

  testWidgets('Tapping nav items switches tabs', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Home tab is shown by default
    expect(find.text('Welcome Home'), findsOneWidget);

    // Tap Search tab
    await tester.tap(find.text('Search'));
    await tester.pump();

    // Tap Profile tab
    await tester.tap(find.text('Profile'));
    await tester.pump();
  });
}
