import 'package:flutter/material.dart';
import 'package:starter_kit/common/loading/three_arched_circle.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 80,
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Center(
          child: ThreeArchedCircle(
              color: Theme.of(context).primaryColor, size: 35),
        ),
      ),
    );
  }
}
