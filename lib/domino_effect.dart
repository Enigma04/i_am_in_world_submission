import 'dart:async';

import 'package:flutter/material.dart';

class DominoEffect extends StatefulWidget {
  final Widget child;
  final Duration delay;
  const DominoEffect({Key? key, required this.child, required this.delay})
      :super(key:key);

  @override
  _DominoEffectState createState() => _DominoEffectState();
}

class _DominoEffectState extends State<DominoEffect> with SingleTickerProviderStateMixin {
  late Timer _timer;
  late AnimationController _animationController;
  late Animation _animation;
  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _timer = Timer(widget.delay, _animationController.forward);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animation,
        child: widget.child,
        builder: (context , child){
          return Opacity(
              opacity: _animation.value,
            child: Transform.translate(
                offset: Offset(0.0,(1-_animation.value)*20.0),
              child: child,
            ),
          );
        }
    );
  }
}

