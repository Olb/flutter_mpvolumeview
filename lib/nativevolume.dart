import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

typedef void VolumeViewCreatedCallback(VolumeController controller);

class VolumeController {
  // Not needed since we just want the view
  MethodChannel _channel;

  VolumeController.init(int id) {
    _channel = MethodChannel('nativevolume_$id');
  }
}

class Nativevolume extends StatefulWidget {
  final VolumeViewCreatedCallback onVolumeCreated;

  Nativevolume({
    Key key,
    @required this.onVolumeCreated,
  });

  @override
  _NativevolumeState createState() => _NativevolumeState();
}

class _NativevolumeState extends State<Nativevolume> {
  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType: 'nativevolume',
        onPlatformViewCreated: onPlatformViewCreated,
        creationParamsCodec: const StandardMessageCodec(),
      );
    }

    return Text('$defaultTargetPlatform is not yet supported by this plugin');
  }

  Future<void> onPlatformViewCreated(id) async {
    if (widget.onVolumeCreated == null) {
      return;
    }
    widget.onVolumeCreated(VolumeController.init(id));
  }
}
