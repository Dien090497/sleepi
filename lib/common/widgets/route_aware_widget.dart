import 'package:flutter/material.dart';
import 'package:slee_fi/app.dart';

class RouteAwareWidget extends StatefulWidget {
  const RouteAwareWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<RouteAwareWidget> createState() => RouteAwareWidgetState();
}

// Implement RouteAware in a widget's state and subscribe it to the RouteObserver.
class RouteAwareWidgetState extends State<RouteAwareWidget> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    debugPrint('### didPush ${widget.child}');
    // Route was pushed onto navigator and is now topmost route.
  }

  @override
  void didPopNext() {
    debugPrint('### didPopNext ${widget.child}');
    // Covering route was popped off the navigator.
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
