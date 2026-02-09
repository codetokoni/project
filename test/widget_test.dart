import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:project/main.dart';

void main() {
  testWidgets('Bottom navigation bar is present with three items', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final navBar = find.byType(BottomNavigationBar);
    expect(navBar, findsOneWidget);

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Explore'), findsOneWidget);
    expect(find.text('About'), findsOneWidget);
  });

  testWidgets('Home screen shows FALF TV hero banner', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Experience Africa'), findsOneWidget);
    expect(find.text('Authentic Stories. Real Voices.'), findsOneWidget);
    expect(find.text('Watch Now'), findsOneWidget);
    expect(find.text('Featured Content'), findsOneWidget);
  });

  testWidgets('Tapping nav items switches tabs', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Tap Explore tab
    await tester.tap(find.text('Explore'));
    await tester.pump();
    expect(find.text('Categories'), findsOneWidget);
    expect(find.text('Documentaries'), findsOneWidget);

    // Tap About tab
    await tester.tap(find.text('About'));
    await tester.pump();
    expect(find.text('FALF TV'), findsAtLeast(1));
    expect(find.text('admin@falftv.com'), findsOneWidget);
  });
}
