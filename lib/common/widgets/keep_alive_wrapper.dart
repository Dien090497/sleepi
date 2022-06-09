import 'package:flutter/cupertino.dart';

class KeepAliveWrapper extends StatefulWidget {
  const KeepAliveWrapper({required this.child, Key? key}) : super(key: key);

  final Widget child;

  @override
  _KeepAliveWrapperState createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
