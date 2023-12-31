import 'package:augmented_reality_plugin/augmented_reality_plugin.dart';
import 'package:flutter/material.dart';

class AugmentedRealityView extends StatefulWidget {
  String? clickedItemImageLink;
  AugmentedRealityView({this.clickedItemImageLink});
  @override
  State<AugmentedRealityView> createState() => _AugmentedRealityViewState();
}

class _AugmentedRealityViewState extends State<AugmentedRealityView> {
  @override
  Widget build(BuildContext context) {
    return AugmentedRealityPlugin(
        widget.clickedItemImageLink.toString()
    );
  }
}