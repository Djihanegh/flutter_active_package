// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:active_package_example/main.dart';

void main() {
  testWidgets('Get package name', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Tap on the button to retrieve the package name
    await tester.tap(find.byType(TextButton));

    // Rebuild the widget with the new data.
    await tester.pump(const Duration(seconds: 1));

    expect(
        find.byWidgetPredicate(
          (Widget widget) =>
              widget is Text && widget.data!.startsWith('Running on:'),
        ),
        findsOneWidget);

    // finds the Text Widget that contains the app's package name
    final textFinder = find.byKey(const Key("package_name_text_key"));

    expect(tester.widget<Text>(textFinder).data, "Unknown");
  });
}
