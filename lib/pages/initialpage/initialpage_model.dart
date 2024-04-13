import '/flutter_flow/flutter_flow_util.dart';
import 'initialpage_widget.dart' show InitialpageWidget;
import 'package:flutter/material.dart';

class InitialpageModel extends FlutterFlowModel<InitialpageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
