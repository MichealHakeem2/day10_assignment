import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:contact_app/main.dart';

void main() {
  testWidgets('ContactApp instantiates correctly', (WidgetTester tester) async {
    const app = ContactApp();
    expect(app, isA<StatelessWidget>());
  });
}
