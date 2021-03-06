import 'package:transfer_memories/Service/AuthenticationService.dart';
import 'package:flutter/material.dart';

class Provider extends InheritedWidget {
  final AuthenticationService auth;
  Provider({
    Key key,
    Widget child,
    this.auth,
  }) : super(
          key: key,
          child: child,
        );

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static Provider of(BuildContext context) =>
      // ignore: deprecated_member_use
      (context.inheritFromWidgetOfExactType(Provider) as Provider);
}
