import 'package:flutter/material.dart';
import '../features/models/contact_model.dart';
import '../features/view/screens/add_contact_screen.dart';
import '../features/view/screens/home_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String addContact = '/add-contact';

  static Map<String, WidgetBuilder> get routes => {
        home: (context) => const HomeScreen(),
        addContact: (context) => const AddContactScreen(),
      };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: settings,
        );
      case addContact:
        final contact = settings.arguments as ContactModel?;
        return MaterialPageRoute(
          builder: (_) => AddContactScreen(contact: contact),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: settings,
        );
    }
  }
}
