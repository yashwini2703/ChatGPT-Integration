import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'openailogo_model.dart';
export 'openailogo_model.dart';

class OpenailogoWidget extends StatefulWidget {
  const OpenailogoWidget({super.key});

  @override
  State<OpenailogoWidget> createState() => _OpenailogoWidgetState();
}

class _OpenailogoWidgetState extends State<OpenailogoWidget> {
  late OpenailogoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OpenailogoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 61.0,
      height: 61.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).info,
        shape: BoxShape.circle,
      ),
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Align(
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(0.0),
          child: CachedNetworkImage(
            fadeInDuration: const Duration(milliseconds: 300),
            fadeOutDuration: const Duration(milliseconds: 300),
            imageUrl:
                'https://static.cdnlogo.com/logos/c/18/ChatGPT_800x800.png',
            height: 40.0,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
