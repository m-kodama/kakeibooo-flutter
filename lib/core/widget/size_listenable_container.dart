import 'package:flutter/widgets.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';

typedef SizeChangedCallback = void Function(Size size);

class SizeListenableContainer extends SingleChildRenderObjectWidget {
  const SizeListenableContainer({
    required Widget child,
    required this.onSizeChanged,
    Key? key,
  }) : super(child: child, key: key);

  final SizeChangedCallback onSizeChanged;

  @override
  SizeListenableRenderObject createRenderObject(BuildContext context) {
    return SizeListenableRenderObject(onSizeChanged: onSizeChanged);
  }
}

class SizeListenableRenderObject extends RenderProxyBox {
  SizeListenableRenderObject({
    required this.onSizeChanged,
  });

  final SizeChangedCallback onSizeChanged;

  Size? _oldSize;

  @override
  void performLayout() {
    super.performLayout();

    if (child == null) {
      return;
    }

    final Size size = this.size;
    if (size != _oldSize) {
      _oldSize = size;
      _callback(size);
    }
  }

  void _callback(Size size) {
    SchedulerBinding.instance.addPostFrameCallback((Duration _) {
      onSizeChanged(size);
    });
  }
}
