import 'package:flutter/material.dart';

class NotifierProvider<Model extends ChangeNotifier> extends InheritedNotifier {
  final Widget child;
  final Model model;
  const NotifierProvider({
    super.key,
    required this.child,
    required this.model
    }) : super(
      child: child,
      notifier: model
      );


  static Model? of<Model extends ChangeNotifier>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NotifierProvider<Model>>()?.model;
  }

}


class Provider<Model> extends InheritedWidget {
  final Model model;
  const Provider({
    super.key,
     required this.child,
     required this.model
     }) : super(child: child);

  final Widget child;

  static Model? of<Model>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider<Model>>()?.model;
  }

  @override
  bool updateShouldNotify(Provider oldWidget) {
    return model != oldWidget.model;
  }
}